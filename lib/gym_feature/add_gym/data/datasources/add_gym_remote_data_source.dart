import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/gym_feature/add_gym/data/models/gym_request_model.dart';

abstract class AddGymRemoteDataSource {
  Future<GymRequestModel> addGymRequest(GymRequestModel gymRequestModel);
  Future<Map<String, List<String>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(double) onProgress);

}

@Injectable(as: AddGymRemoteDataSource)
class AddGymRemoteDataSourceImpl implements AddGymRemoteDataSource {
  AddGymRemoteDataSourceImpl();
  final storage = FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance;
  final _secureStorage = const FlutterSecureStorage();
  static const String _gymIdKey = 'gym_id_key';
  
  CollectionReference get _gymsCollection =>
     firestore.collection(FirebaseCollections.gym);
  
  @override
  Future<GymRequestModel> addGymRequest(GymRequestModel gymRequestModel) async {
    try {
      var docRef = _gymsCollection.doc();
      gymRequestModel = gymRequestModel.copyWith(id: docRef.id);
      await docRef.set(gymRequestModel.toMap());
      
      // Save gym ID to secure storage after successful creation
      
      return gymRequestModel;
    } catch (e) {
      throw Exception('Failed to add gym request: $e');
    }
  }

  

  @override
  Future<Map<String, List<String>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(double) onProgress) async {
    Map<String, List<String>> uploadedUrls = {};
    double uploadedFiles = 0;
    for (var entry in imagesMap.entries) {
      String category = entry.key;
      List<File> files = entry.value;
      List<String> urls = [];

      for (int i = 0; i < files.length; i++) {
        File file = files[i];
        String fileName = file.path.split('/').last;
        Reference ref = storage.ref().child('uploads/$category/$fileName');
        UploadTask uploadTask = ref.putFile(file);

        await uploadTask.whenComplete(() async {
          String downloadUrl = await ref.getDownloadURL();
          urls.add(downloadUrl);
          uploadedFiles++;
          onProgress(uploadedFiles);
        });
      }

      uploadedUrls[category] = urls;
    }

    return uploadedUrls;
  }
}

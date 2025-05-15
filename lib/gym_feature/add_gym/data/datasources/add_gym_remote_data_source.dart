import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/gym_feature/add_gym/data/models/gym_request_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

abstract class AddGymRemoteDataSource {
  Future<GymRequestModel> addGymRequest(GymRequestModel gymRequestModel);
  Future<Map<String, List<String>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(double) onProgress);
  Future<GymRequestModel?> getGymById(String gymId);
  Future<List<Map<String,dynamic>>> getAllGyms();
  Future<List<Map<String,dynamic>>> getFeatureOfSpecificGym(String gymId);
  Future<void> addGymFeatures(String gymId, List<Feature> features);
  Future<void> addGymPlan(String gymId,Plan plan);
  
}

@Injectable(as: AddGymRemoteDataSource)
class AddGymRemoteDataSourceImpl implements AddGymRemoteDataSource {
  AddGymRemoteDataSourceImpl();
  final storage = FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance;
  
  
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
  
  @override
  Future<List<Map<String, dynamic>>> getAllGyms() {
 return executeTryAndCatchForDataLayer(()async{
   var querySnapshot = await _gymsCollection.get();
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
 });
  }
  
@override
Future<void> addGymFeatures(String gymId, List<Feature> features) {
  return executeTryAndCatchForDataLayer(() async {
    final featuresCollection = _gymsCollection.doc(gymId).collection('features');

    for (final feature in features) {
       await featuresCollection.doc(feature.id).set(feature.toMap());
    }
  });
}

 
  @override
  Future<GymRequestModel?> getGymById(String gymId) async {
    try {
      final docSnapshot = await _gymsCollection.doc(gymId).get();
      
      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        return GymRequestModel.fromMap(data);
      }
      
      return null;
    } catch (e) {
      throw Exception('Failed to get gym by ID: $e');
    }
  }
  
  @override
  Future<List<Map<String, dynamic>>> getFeatureOfSpecificGym(String gymId) {
    return executeTryAndCatchForDataLayer(() async {
      final featuresCollection = _gymsCollection.doc(gymId).collection(FirebaseCollections.features);
      final querySnapshot = await featuresCollection.get();
      return querySnapshot.docs
          .map((doc) => doc.data())
          .toList();
    });
  }
  
  @override
  Future<void> addGymPlan(String gymId, Plan plan) {
    return executeTryAndCatchForDataLayer(() async {
      final docRef = _gymsCollection.doc(gymId).collection(FirebaseCollections.plans).doc();
      plan = plan.copyWith(planId: docRef.id);
      await docRef.set(plan.toMap());
    });
  }
}

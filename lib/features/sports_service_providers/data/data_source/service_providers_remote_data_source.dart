//init add_service_provider_to_firebase branch
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_model.dart';
import 'package:path/path.dart';
import 'package:injectable/injectable.dart';


abstract class ServiceProvidersRemoteDataSource {
  Future<void> addServiceToFirestore(PlaygroundRequestModel playground);
  Future<List<String>> addImagesToStorage(List<File> images);
  Future<bool> deleteImagesFromStorage(List<File> images);
}

@Injectable(as:ServiceProvidersRemoteDataSource)
class ServiceProvidersRemoteDataSourceImpl
    implements ServiceProvidersRemoteDataSource {
  FirebaseFirestore firestore;
  FirebaseStorage storage;
  ServiceProvidersRemoteDataSourceImpl(
      {required this.firestore, required this.storage});

  @override
  Future<void> addServiceToFirestore(PlaygroundRequestModel playground) async {
    return executeTryAndCatchForDataLayer(() async {
      var collRef =
          firestore.collection(FirebaseCollections.playgroundsRequests);
      var docRef = collRef.doc();
      playground.playgroundId = docRef.id;
      return await docRef.set(playground.toMap());
    });
  }

  @override
  Future<List<String>> addImagesToStorage(List<File> images) async {
    List<String> imagesUrl = [];

    return executeTryAndCatchForDataLayer(() async {
      for (var image in images) {
        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child(basename(image.path));

        UploadTask uploadTask = firebaseStorageRef.putFile(image);

        TaskSnapshot taskSnapshot = await uploadTask;

        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        imagesUrl.add(downloadUrl);
      }
      return imagesUrl;
    });
  }

  @override
  Future<bool> deleteImagesFromStorage(List<File> images) async {
    return executeTryAndCatchForDataLayer(() async {
      for (var image in images) {
        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child(basename(image.path));

        await firebaseStorageRef.delete();
      }
      return true;
    });
  }
}

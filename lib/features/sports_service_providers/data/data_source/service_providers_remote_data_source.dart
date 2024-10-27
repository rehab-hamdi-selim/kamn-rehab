//init add_service_provider_to_firebase branch
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_model.dart';
import 'package:path/path.dart';

abstract class ServiceProvidersRemoteDataSource {
  Future<void> addServiceToFirestore(PlaygroundModel playground);
  Future<List<String>> addImagesToStorage(List<File> images);
  Future<void> addTestData(); // New method
}

class ServiceProvidersRemoteDataSourceImpl
    implements ServiceProvidersRemoteDataSource {
  FirebaseFirestore firestore;
  FirebaseStorage storage;
  ServiceProvidersRemoteDataSourceImpl(
      {required this.firestore, required this.storage});

  @override
  Future<void> addServiceToFirestore(PlaygroundModel playground) async {
    return executeTryAndCatchForDataLayer(() async {
      var collRef = firestore.collection(FirebaseCollections.playgrounds);
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
  Future<void> addTestData() async {
    return executeTryAndCatchForDataLayer(() async {
      var collRef = firestore.collection(FirebaseCollections.playgrounds);
      var batch = firestore.batch();

      for (int i = 0; i < 100; i++) {
        var docRef = collRef.doc();
        var playground = PlaygroundModel(
          playgroundId: docRef.id,
          name: 'Test Playground ${i + 1}',
          phone: '123456789${i.toString().padLeft(2, '0')}',
          address: 'Test Address ${i + 1}',
          size:
              Random().nextInt(1000) + 100, // Random size between 100 and 1099
          govenrate: 'Test Governorate',
          images: ['https://example.com/test_image.jpg'],
          latitude:
              30.0 + (Random().nextDouble() * 2), // Random latitude around 30
          longitude:
              31.0 + (Random().nextDouble() * 2), // Random longitude around 31
          ownerId: 'testOwner${i + 1}',
          price:
              Random().nextInt(1000) + 100, // Random price between 100 and 1099
          description: 'This is a test playground description ${i + 1}',
          status: 'active',
        );
        batch.set(docRef, playground.toMap());
      }

      return await batch.commit();
    });
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/home_cooked__features/data/models/home_cook_model_test.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';

abstract class AddHomeCookRemoteDataSource {
  Future<void> updateServiceProviderHomeCookAddDeliveryData(
      HomeCookModel homeCookModel);

  Future<HomeCookModel> getServiceProviderHomeCook();

  Future<HomeCookModel> addHomeCookRequest(HomeCookModel gymRequestModel);

  Future<List<Map<String, dynamic>>> getMeals(String homeCookId);

  Future<void> addMealModel(MealModel mealModel);

  Future<void> updateMealModel(MealModel mealModel, String homeCookId);

  Future<void> deleteMeal(MealModel mealModel, String homeCookId);
  Stream<List<Map<String, dynamic>>> getMealsStream(String homeCookId);

  Future<Map<String, List<String>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(double) onProgress);

  Future<List<String>> uploadMealImages(
      List<File> images, void Function(double) onProgress);
}

@Injectable(as: AddHomeCookRemoteDataSource)
class AddHomeCookRemoteDataSourceImpl implements AddHomeCookRemoteDataSource {
  AddHomeCookRemoteDataSourceImpl();

  final storage = FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance;

  CollectionReference get _homeCookCollection =>
      firestore.collection(FirebaseCollections.homeCookRequest);

  // CollectionReference<Object?> getMealsCollection(String homeCookId) {
  //   return   firestore.collection(FirebaseCollections.meal);

  //   // firestore
  //   //     .collection(FirebaseCollections.homeCookRequest)
  //   //     .doc(homeCookId)
  //   //     .collection(FirebaseCollections.meal);
  // }
  CollectionReference<Object?> getMealsCollection() {
    return firestore.collection(FirebaseCollections.meal);

    // firestore
    //     .collection(FirebaseCollections.homeCookRequest)
    //     .doc(homeCookId)
    //     .collection(FirebaseCollections.meal);
  }

//mary

  @override
  Future<void> updateServiceProviderHomeCookAddDeliveryData(
      HomeCookModel homeCookModel) async {
    //e9d5af41-1156-4b6f-aac1-075a057c742b
    var docRef = _homeCookCollection.doc("u0cBRLRyHcppREpHYdNf");
    await docRef.update(homeCookModel.toMap());
  }

//TODO: get service provider home cook with id just now for testing
  @override
  Future<HomeCookModel> getServiceProviderHomeCook() async {
    var docRef = _homeCookCollection.doc("u0cBRLRyHcppREpHYdNf");
    var docSnap = await docRef.get();

    return HomeCookModel.fromMap(docSnap.data() as Map<String, dynamic>);
  }

  @override
  Future<void> addMealModel(MealModel mealModel) async {
    var docMeal = getMealsCollection().doc(mealModel.id);
    await docMeal.set(mealModel.toMap());
  }

  @override
  Future<void> updateMealModel(MealModel mealModel, String homeCookId) async {
    var docMeal = getMealsCollection().doc(mealModel.id);
    await docMeal.update(mealModel.toMap());
  }

  @override
  Future<HomeCookModel> addHomeCookRequest(
      HomeCookModel homeCookRequestModel) async {
    try {
      var docRef = _homeCookCollection.doc();
      homeCookRequestModel = homeCookRequestModel.copyWith(id: docRef.id);
      await docRef.set(homeCookRequestModel.toMap());
      return homeCookRequestModel;
    } catch (e) {
      throw Exception('Failed to add gym request: $e');
    }
  }

////////////////////////////
  ///
  ///
  ///
  ///
  ///
  @override
  Stream<List<Map<String, dynamic>>> getMealsStream(String homeCookId) {
    var docRef = getMealsCollection()
        // .where('homeCookId', isEqualTo: homeCookId) // Filter by homeCookId
        .orderBy('time', descending: true);
    return docRef
        .snapshots() //Stream<List<Map<String, dynamic>>>
        .map((snapshot) {
      return snapshot.docs //List<Map<String, dynamic>>
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

////////////////
  @override
  Future<List<Map<String, dynamic>>> getMeals(String homeCookId) async {
    var docRef = getMealsCollection()
        .where("homeCookId", isEqualTo: homeCookId)
        .orderBy('time', descending: true);
    //.orderBy('date', descending: true);
    //var docSnap = await docRef.snapshots().listen((f) {});
    var docSnap = await docRef.get();
    return docSnap.docs.map((element) {
      return element.data()
          as Map<String, dynamic>; // ✅ Explicitly cast the data
    }).toList();
  }

  @override
  Future<void> deleteMeal(MealModel mealModel, String homeCookId) async {
    var docMeal = getMealsCollection().doc(mealModel.id);
    await docMeal.delete();
  }

////////////////////////////////////
  ///
  ///
  @override
  Future<List<String>> uploadMealImages(
      List<File> images, void Function(double) onProgress) async {
    List<String> uploadedUrls = [];
    double uploadedFiles = 0;

    for (int i = 0; i < images.length; i++) {
      File file = images[i];

      String fileName = file.path.split('/').last;
      Reference ref = storage.ref().child('uploads/mealImages/$fileName');
      UploadTask uploadTask = ref.putFile(file);

      await uploadTask.whenComplete(() async {
        String downloadUrl = await ref.getDownloadURL();
        uploadedUrls.add(downloadUrl);
        uploadedFiles++;
        onProgress(uploadedFiles / images.length); // نسبة مئوية
      });
    }

    return uploadedUrls;
  }

  @override
  Future<Map<String, List<String>>> uploadImages(
      Map<String, List<File>> imagesMap,
      void Function(double) onProgress) async {
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

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

  Future<void> addMealModel(MealModel mealModel, String homeCookId);

  Future<void> updateMealModel(MealModel mealModel, String homeCookId);

  Future<Map<String, List<String>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(double) onProgress);
}

@Injectable(as: AddHomeCookRemoteDataSource)
class AddHomeCookRemoteDataSourceImpl implements AddHomeCookRemoteDataSource {
  AddHomeCookRemoteDataSourceImpl();

  final storage = FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance;

  CollectionReference get _homeCookCollection =>
      firestore.collection(FirebaseCollections.homeCookRequest);

  CollectionReference<Object?> getMealsCollection(String homeCookId) {
    return firestore
        .collection(FirebaseCollections.homeCookRequest)
        .doc(homeCookId)
        .collection(FirebaseCollections.meal);
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
  Future<void> addMealModel(MealModel mealModel, String homeCookId) async {
    var docMeal = getMealsCollection(homeCookId).doc(mealModel.id);
    await docMeal.set(mealModel.toMap());
  }

  @override
  Future<void> updateMealModel(MealModel mealModel, String homeCookId) async {
    var docMeal = getMealsCollection(homeCookId).doc(mealModel.id);
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

  @override
  Future<List<Map<String, dynamic>>> getMeals(String homeCookId) async {
    var docRef = getMealsCollection(homeCookId);
    var docSnap = await docRef.get();

    return docSnap.docs.map((element) {
      return element.data()
          as Map<String, dynamic>; // ✅ Explicitly cast the data
    }).toList();
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

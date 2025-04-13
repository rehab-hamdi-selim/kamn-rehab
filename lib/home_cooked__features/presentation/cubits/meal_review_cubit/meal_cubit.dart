import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/utils/image_picker.dart';
import 'package:kamn/healthy_food_features/data/models/category_data.dart';
import 'package:kamn/home_cooked__features/data/models/home_cook_model_test.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_state.dart';

import '../../../data/repositories/home_cook_repository.dart';

@injectable
class MealCubit extends Cubit<MealState> {
  AddHomeCookRepository homeCookRepository;
  MealCubit(this.homeCookRepository)
      : super(MealState(state: MealStatus.initial));

  final TextEditingController mealNameController = TextEditingController();
  final TextEditingController prepController = TextEditingController();
  final TextEditingController kcalController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> addMealKey = GlobalKey<FormState>();
  final GlobalKey<FormState> updateMealKey = GlobalKey<FormState>();
  TextEditingController? deliveryFeeController = TextEditingController();
  final deliveryformKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  // Future<void> pickMealImage(int index) async {
  //   final image = await pickImage();
  //   if (image != null) {
  //     _mealImages.add(image);
  //     emit(state.copyWith(
  //         state: MealStatus.mealImagePicked,
  //         mealImages: List.from(_mealImages)));
  //   }
  // }

  Future<void> pickImageMeal(int index) async {
    // final File? image =
    //     await pickImage(); // your helper that picks & compresses

    // if (image != null) {
    //   _mealImages[index] = image;

    //   emit(state.copyWith(state: MealStatus.mealImagePicked,mealImages: List.from(_mealImages)));
    // }

    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print("picker is:$pickedFile");

      final newImages = List<File?>.from(state.mealImages);
      newImages[index] = File(pickedFile.path);
      emit(state.copyWith(
          mealImages: newImages, state: MealStatus.mealImagePicked));
      print("newImages is:$newImages");
      print("mealstate is:${state.mealImages}");
    } else {
      print("picker is null");
    }
  }
  // Future<void> pickImageMeal(int index) async {
  //    final image = await pickImage();
  //  // final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     final newImages = List<File?>.from(state.images);
  //     newImages[index] = File(pickedFile.path);
  //     emit(state.copyWith(images: newImages));
  //   }
  // }

  Future<void> uploadMealImages() async {
    emit(state.copyWith(
      state: MealStatus.mealImageLoading,
    ));
    final images = state.mealImages.whereType<File>().toList();
    final uploadResponse =
        await homeCookRepository.uploadMealImages(images, (progress) {
      print("now on $progress");
      // emit(state.copyWith(
      //   state: MealStatus.mealImageLoading,
      //  // uploadProgress: progress,
    });

    uploadResponse.fold((error) {
      emit(state.copyWith(
        state: MealStatus.mealImageError,
        error: error.erorr,
      ));

      print("errorimage is:${error.erorr}");

      return null;
    },
        (urls) => {
              updateMeal(state.selectedMeal!.copyWith(
                imageUrls: urls,
              )),
              print("updatedmeal is:${state.selectedMeal}"),
            }
        // emit(state.copyWith(
        //       state: AddHomeCookStatus.uploadImagesSuccess,
        //       imagesUrlMap: urls,
        //     ))

        );
  }

  Future<void> uploadDeliveryOption(HomeCookModel homeCookModel) async {
    emit(state.copyWith(state: MealStatus.loading));

    final result = await homeCookRepository
        .updateServiceProviderHomeCookAddDeliveryData(homeCookModel);

    result.fold((error) {
      emit(state.copyWith(
        state: MealStatus.addDeliveryOptionError,
        error: error.erorr,
      ));
    }, (success) {
      log("message updated home: success data");
      emit(state.copyWith(state: MealStatus.addDeliveryOptionSuccess));
    });
  }

  void togglePickupOption(bool isPickupSelected) {
    emit(state.copyWith(isPickupSelected: isPickupSelected));
  }

  void toggleDeliveryOption(bool isDeliverySelected) {
    emit(state.copyWith(isDeliverySelected: isDeliverySelected));
  }

  void getMeals(String homeCookId) {
    // emit(state.copyWith(state: MealStatus.loading));
    // final result = await homeCookRepository.getMeals(homeCookId);
    // result.fold((error) {
    //   emit(state.copyWith(
    //     state: MealStatus.error,
    //     error: error.erorr,
    //   ));
    // },
    // (myMeal) {
    //   emit(state.copyWith(
    //       state: MealStatus.success, myMeals: myMeal, selectedMeal: myMeal[0]));
    // });

///////
    // emit(state.copyWith(state: MealStatus.loading));

    // homeCookRepository.getMealsStream().listen((meals) {
    //   emit(state.copyWith(
    //     state: MealStatus.success,
    //     myMeals: meals.map((e) => MealModel.fromMap(e)).toList(),
    //     selectedMeal: meals.isNotEmpty ? MealModel.fromMap(meals.first) : null,
    //   ));
    // }, onError: (error) {
    //   emit(state.copyWith(
    //     state: MealStatus.error,
    //     error: error.toString(),
    //   ));
    // });

    emit(state.copyWith(state: MealStatus.loading));
    homeCookRepository.getMealsStream(homeCookId).listen((result) {
      result.fold(
        (error) =>
            emit(state.copyWith(state: MealStatus.error, error: error.erorr)),
        (meals) => emit(state.copyWith(
            state: MealStatus.success, myMeals: meals, selectedMeal: meals[0])),
      );
    });
  }

  void initServiceProviderHomeCook(HomeCookModel homeCookModel) {
    emit(state.copyWith(
      homeCookModel: homeCookModel,
    ));
  }

  void selectedMeal(MealModel mealModel) {
    emit(state.copyWith(
      selectedMeal: mealModel,
      selectedIngredients: List<String>.from(mealModel.ingredients),
    ));
  }

  void addMeal(MealModel mealModel) async {
    final res = await homeCookRepository.addMealModel(
        mealModel, "u0cBRLRyHcppREpHYdNf");
    res.fold(
        (l) => emit(
            state.copyWith(state: MealStatus.addMealError, error: l.erorr)),
        (r) => emit(state.copyWith(
              state: MealStatus.addMealSuccess,
            )));
  }

  //////

  void deleteMeal(MealModel mealModel) async {
    final res =
        await homeCookRepository.deleteMeal(mealModel, "u0cBRLRyHcppREpHYdNf");
    // print("deleteMeal");

    res.fold(
        (l) => emit(
            state.copyWith(state: MealStatus.deleteMealError, error: l.erorr)),
        (r) => emit(state.copyWith(state: MealStatus.deleteMealSuccess)));
  }

///////

  void updateMeal(MealModel mealModel) async {
    final res = await homeCookRepository.updateMealModel(
        mealModel, "u0cBRLRyHcppREpHYdNf");
    res.fold(
        (l) => emit(
            state.copyWith(state: MealStatus.updateMealError, error: l.erorr)),
        (r) => emit(state.copyWith(
            state: MealStatus.updateMealSuccess, selectedMeal: mealModel)));
  }

  void changeSelectedType(String type) {
    emit(state.copyWith(selectedMealType: type));
  }

  /// Add a specialty tag
  void addSpecialtyTag(String tag) {
    if (!state.specialtyTags.contains(tag)) {
      emit(state.copyWith(specialtyTags: [...state.specialtyTags, tag]));
    }
  }

  /// Remove a specialty tag
  void removeSpecialtyTag(String tag) {
    List<String> updatedTags = List.from(state.specialtyTags);
    updatedTags.remove(tag);
    emit(state.copyWith(specialtyTags: updatedTags));
  }

  void toggleSelection(String ingredientName) {
    final updatedIngredients = List<String>.from(state.selectedIngredients);

    if (updatedIngredients.contains(ingredientName)) {
      updatedIngredients.remove(ingredientName);
    } else {
      updatedIngredients.add(ingredientName);
    }

    emit(state.copyWith(selectedIngredients: updatedIngredients));
    print("Updated Ingredients: ${state.selectedIngredients}");
  }
}

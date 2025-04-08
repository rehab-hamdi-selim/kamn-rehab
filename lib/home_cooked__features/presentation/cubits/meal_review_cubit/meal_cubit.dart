import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
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

  void getMeals(String homeCookId) async {
    emit(state.copyWith(state: MealStatus.loading));
    final result = await homeCookRepository.getMeals(homeCookId);
    result.fold((error) {
      emit(state.copyWith(
        state: MealStatus.error,
        error: error.erorr,
      ));
    }, (myMeal) {
      emit(state.copyWith(
          state: MealStatus.success, myMeals: myMeal, selectedMeal: myMeal[0]));
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
        (r) => emit(state.copyWith(state: MealStatus.addMealSuccess)));
  }

  void updateMeal(MealModel mealModel) async {
    final res = await homeCookRepository.updateMealModel(
        mealModel, "u0cBRLRyHcppREpHYdNf");
    res.fold(
        (l) => emit(
            state.copyWith(state: MealStatus.updateMealError, error: l.erorr)),
        (r) => emit(state.copyWith(state: MealStatus.updateMealSuccess)));
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

// void toggleSelection(String ingredientName) {
//     final updatedIngredients = List<String>.from(state.ingredients);

//     if (updatedIngredients.contains(ingredientName)) {
//       updatedIngredients.remove(ingredientName);
//     } else {
//       updatedIngredients.add(ingredientName);
//     }

//     emit(state.copyWith(ingredients: updatedIngredients));
//     print("Selected Ingredients: ${state.ingredients}");
//   }

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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/healthy_food_features/data/models/category_data.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_state.dart';

import '../../../data/repositories/home_cook_repository.dart';

@injectable
class MealCubit extends Cubit<MealState> {
  AddHomeCookRepository homeCookRepository;
  MealCubit(this.homeCookRepository) : super(MealState(state: MealReviewStatus.initial));

  //for add and update meal
final TextEditingController mealNameController =    TextEditingController();
final TextEditingController prepController =        TextEditingController();
final TextEditingController kcalController =        TextEditingController();
final TextEditingController priceController =       TextEditingController();
final TextEditingController descriptionController = TextEditingController();   

final GlobalKey<FormState> addMealKey = GlobalKey<FormState>();
final GlobalKey<FormState> updateMealKey = GlobalKey<FormState>();




  void getMeals(String homeCookId) async{
    emit(state.copyWith(state: MealReviewStatus.loading));
    final result = await homeCookRepository.getMeals(homeCookId);
    result.fold((error) {
      emit(state.copyWith(
      state: MealReviewStatus.error,
      error: error.erorr,
    ));
    }, (myMeal) {
      emit(state.copyWith(
          state: MealReviewStatus.success, myMeals: myMeal,selectedMeal: myMeal[0]));
    });
  }

  void selectedMeal(MealModel mealModel) {
    emit(state.copyWith(selectedMeal: mealModel, selectedIngredients: List<String>.from(mealModel.ingredients )));
  }

  void addMeal(MealModel mealModel) async{
   final res = await homeCookRepository.addMealModel(mealModel,"u0cBRLRyHcppREpHYdNf");
   res.fold((l) => emit(state.copyWith(state: MealReviewStatus.addMealError, error: l.erorr)), 
   (r) => emit(state.copyWith(state: MealReviewStatus.addMealSuccess)));
  }

  void updateMeal(MealModel mealModel) async{
    final res = await homeCookRepository.updateMealModel(mealModel,"u0cBRLRyHcppREpHYdNf");
    res.fold((l) => emit(state.copyWith(state: MealReviewStatus.updateMealError, error: l.erorr)),
    (r) => emit(state.copyWith(state: MealReviewStatus.updateMealSuccess)));
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
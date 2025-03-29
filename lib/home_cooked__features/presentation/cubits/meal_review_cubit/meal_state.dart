import 'package:kamn/home_cooked__features/data/models/home_cook_model_test.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';

enum MealReviewStatus { initial, loading, success, error,addMealLoading,addMealSuccess,addMealError,updateMealLoading,updateMealSuccess,updateMealError }

///

extension MealReviewStateExtension on MealState {
  bool get isInitial => state == MealReviewStatus.initial;
  bool get isLoading => state == MealReviewStatus.loading;
  bool get isSuccess => state == MealReviewStatus.success;
  bool get isError => state == MealReviewStatus.error;
  bool get isAddMealLoading => state == MealReviewStatus.addMealLoading;
  bool get isAddMealLoaded => state == MealReviewStatus.addMealSuccess;
  bool get isAddMealError => state == MealReviewStatus.addMealError;
  bool get isUpdateMealLoading => state == MealReviewStatus.updateMealLoading;
  bool get isUpdateMealSuccess => state == MealReviewStatus.updateMealSuccess;
  bool get isUpdateMealError => state == MealReviewStatus.updateMealError;
}
class MealState {
  final MealReviewStatus state;
  final String? error;
  final MealModel? meal;
  final MealModel? selectedMeal;
  final List<MealModel>? myMeals;
  final HomeCookModel? homeCookModel;
   String selectedMealType;
   List<String> specialtyTags = [];
   List<String> ingredients = [];
   List<String> selectedIngredients = [];
  //  final Map<String, List<PlaygroundModel>>? playgroundsMap;

  MealState({
    required this.state,
    this.error,
    this.meal,
    this.selectedMeal,
    this.myMeals,
    this.homeCookModel ,
    this.selectedMealType = "Breakfast",
    this.specialtyTags = const ["Keto"],
    this.ingredients = const [],
    this.selectedIngredients = const [],
  });

  MealState copyWith({
    MealReviewStatus? state,
    String? error,
    HomeCookModel? homeCookModel,
    String? selectedMealType,
    List<String>? specialtyTags,
    MealModel? meal,
    MealModel? selectedMeal,
    List<MealModel>? myMeals,
    List<String>? ingredients,
    List<String>? selectedIngredients,
    //  Map<String, List<PlaygroundModel>>? playgroundsMap,
  }) {
    return MealState(
      state: state ?? this.state,
      error: error ?? this.error,
      meal: meal ?? this.meal,
      selectedMeal: selectedMeal ?? this.selectedMeal,
      myMeals: myMeals ?? this.myMeals,
      homeCookModel: homeCookModel ?? this.homeCookModel,
      selectedMealType: selectedMealType?? this.selectedMealType,
      specialtyTags: specialtyTags ?? this.specialtyTags,
      ingredients: ingredients ?? this.ingredients,
      selectedIngredients: selectedIngredients ?? this.selectedIngredients,

      // playgroundsMap: playgroundsMap ?? this.playgroundsMap,
    );
  }


  @override
  String toString() {
return 'MealState{state: $state, error: $error, meal: $meal, selectedMeal: $selectedMeal, myMeals: $myMeals, homeCookModel: $homeCookModel, selectedMealType: $selectedMealType, specialtyTags: $specialtyTags, ingredients: $ingredients, selectedIngredients: $selectedIngredients}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MealState &&
        other.state == state &&
        other.error == error &&
        other.meal == meal &&
        other.selectedMeal == selectedMeal &&
        other.myMeals == myMeals &&
        other.homeCookModel == homeCookModel &&
        other.selectedMealType == selectedMealType &&
        other.specialtyTags == specialtyTags &&
        other.ingredients == ingredients&&
        other.selectedIngredients == selectedIngredients;
  }

  @override
  int get hashCode {
    return state.hashCode ^
        error.hashCode ^        
        meal.hashCode ^
        selectedMeal.hashCode ^
        myMeals.hashCode ^
        homeCookModel.hashCode ^
        selectedMealType.hashCode ^
        specialtyTags.hashCode ^
        ingredients.hashCode ^
        selectedIngredients.hashCode;
  }  
}

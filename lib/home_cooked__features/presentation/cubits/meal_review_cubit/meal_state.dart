import 'package:kamn/home_cooked__features/data/models/home_cook_model_test.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';

enum MealStatus {
  initial,
  loading,
  success,
  error,
  addMealLoading,
  addMealSuccess,
  addMealError,
  updateMealLoading,
  updateMealSuccess,
  updateMealError,
  addDeliveryOptionLoading,
  addDeliveryOptionSuccess,
  addDeliveryOptionError,
}

///

extension MealReviewExtension on MealState {
  bool get isInitial => state == MealStatus.initial;
  bool get isLoading => state == MealStatus.loading;
  bool get isSuccess => state == MealStatus.success;
  bool get isError => state == MealStatus.error;
  bool get isAddMealLoading => state == MealStatus.addMealLoading;
  bool get isAddMealSuccess => state == MealStatus.addMealSuccess;
  bool get isAddMealError => state == MealStatus.addMealError;
  bool get isUpdateMealLoading => state == MealStatus.updateMealLoading;
  bool get isUpdateMealSuccess => state == MealStatus.updateMealSuccess;
  bool get isUpdateMealError => state == MealStatus.updateMealError;
  bool get isAddDeliveryOptionLoading =>
      state == MealStatus.addDeliveryOptionLoading;
  bool get isAddDeliveryOptionSuccess =>
      state == MealStatus.addDeliveryOptionSuccess;
  bool get isAddDeliveryOptionError =>
      state == MealStatus.addDeliveryOptionError;
}

class MealState {
  final MealStatus state;
  final String? error;
  final MealModel? meal;
  final MealModel? selectedMeal;
  final List<MealModel>? myMeals;
  final bool isPickupSelected;
  final bool isDeliverySelected;
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
    this.homeCookModel,
    this.isPickupSelected = false,
    this.isDeliverySelected = false,
    this.selectedMealType = "Breakfast",
    this.specialtyTags = const [],
    this.ingredients = const [],
    this.selectedIngredients = const [],
  });

  MealState copyWith({
    MealStatus? state,
    String? error,
    HomeCookModel? homeCookModel,
    String? selectedMealType,
    List<String>? specialtyTags,
    bool? isPickupSelected,
    bool? isDeliverySelected,
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
      isPickupSelected: isPickupSelected ?? this.isPickupSelected,
      isDeliverySelected: isDeliverySelected ?? this.isDeliverySelected,
      selectedMealType: selectedMealType ?? this.selectedMealType,
      specialtyTags: specialtyTags ?? this.specialtyTags,
      ingredients: ingredients ?? this.ingredients,
      selectedIngredients: selectedIngredients ?? this.selectedIngredients,

      // playgroundsMap: playgroundsMap ?? this.playgroundsMap,
    );
  }

  @override
  String toString() {
    return 'MealState{state: $state, error: $error, meal: $meal, selectedMeal: $selectedMeal, myMeals: $myMeals, homeCookModel: $homeCookModel, selectedMealType: $selectedMealType, specialtyTags: $specialtyTags, ingredients: $ingredients, selectedIngredients: $selectedIngredients, isPickupSelected: $isPickupSelected, isDeliverySelected: $isDeliverySelected}';
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
        other.ingredients == ingredients &&
        other.selectedIngredients == selectedIngredients &&
        other.isPickupSelected == isPickupSelected &&
        other.isDeliverySelected == isDeliverySelected;
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
        selectedIngredients.hashCode ^
        isPickupSelected.hashCode ^
        isDeliverySelected.hashCode;
  }
}

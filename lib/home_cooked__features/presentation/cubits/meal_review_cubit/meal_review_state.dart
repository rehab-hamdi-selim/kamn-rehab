import 'package:kamn/home_cooked__features/data/models/meals_model.dart';

enum MealReviewStatus { initial, loading, success, error }

///

extension MealReviewStateExtension on MealReviewState {
  bool get isInitial => state == MealReviewStatus.initial;
  bool get isLoading => state == MealReviewStatus.loading;
  bool get isSuccess => state == MealReviewStatus.success;
  bool get isError => state == MealReviewStatus.error;
}

class MealReviewState {
  final MealReviewStatus state;
  final String? error;
  final Meal? meal;
  //  final Map<String, List<PlaygroundModel>>? playgroundsMap;

  MealReviewState({
    required this.state,
    this.error,
    this.meal,
  });

  MealReviewState copyWith({
    MealReviewStatus? state,
    String? error,
    Meal? meal,
    //  Map<String, List<PlaygroundModel>>? playgroundsMap,
  }) {
    return MealReviewState(
      state: state ?? this.state,
      error: error ?? this.error,
      meal: meal ?? this.meal,

      // playgroundsMap: playgroundsMap ?? this.playgroundsMap,
    );
  }

  //@override
  // String toString() => 'SelectCategoryState(state: $state, error: $error, playgroundsMap: $playgroundsMap)';
}

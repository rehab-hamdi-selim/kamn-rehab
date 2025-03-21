import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_review_state.dart';

class MealReviewCubit extends Cubit<MealReviewState> {
  MealReviewCubit() : super(MealReviewState(state: MealReviewStatus.initial));

  Future<void> getMeal(int id) async {
    emit(state.copyWith(state: MealReviewStatus.loading));
    final result = await getmealbyid(id);
    // result.fold((error) {
    //   emit(state.copyWith(
    //     state: MealReviewStatus.error,
    //     error: error.erorr,
    //   ));
    // },
    //  (success) {
    //   emit(state.copyWith(
    //       state: MealReviewStatus.success, meal: success));
    // }

    // );
    if (result != null) {
      emit(state.copyWith(state: MealReviewStatus.success, meal: result));
    } else {
      emit(state.copyWith(
        state: MealReviewStatus.error,
        error: "Error",
      ));
    }
  }
}

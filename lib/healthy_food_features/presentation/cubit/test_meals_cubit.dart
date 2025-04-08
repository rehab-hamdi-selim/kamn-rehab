import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';
import 'package:kamn/healthy_food_features/domain/repositories/test_meals_repository.dart';

part 'test_meals_state.dart';

@injectable
class TestMealsCubit extends Cubit<TestMealsState> {
  final TestMealsRepository _repository;

  TestMealsCubit(this._repository) : super(const TestMealsState());

  Future<void> getTestMeals() async {
    emit(state.copyWith(status: TestMealsStatus.loading));

    final result = await _repository.getTestMeals();

    result.fold(
      (failure) => emit(state.copyWith(
        status: TestMealsStatus.error,
        errorMessage: failure.erorr,
      )),
      (meals) => emit(state.copyWith(
        status: TestMealsStatus.loaded,
        meals: meals,
      )),
    );
  }

  Future<void> addTestMeals() async {
    emit(state.copyWith(status: TestMealsStatus.loading));

    final result = await _repository.addTestMeals();

    result.fold(
      (failure) => emit(state.copyWith(
        status: TestMealsStatus.error,
        errorMessage: failure.erorr,
      )),
      (_) async {
        final mealsResult = await _repository.getTestMeals();

        mealsResult.fold(
          (failure) => emit(state.copyWith(
            status: TestMealsStatus.error,
            errorMessage: failure.erorr,
          )),
          (meals) => emit(state.copyWith(
            status: TestMealsStatus.loaded,
            meals: meals,
          )),
        );
      },
    );
  }
}

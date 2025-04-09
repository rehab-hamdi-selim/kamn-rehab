part of 'test_meals_cubit.dart';

enum TestMealsStatus {
  initial,
  loading,
  loaded,
  error,
}

class TestMealsState extends Equatable {
  final TestMealsStatus status;
  final List<TestMealModel> meals;
  final String errorMessage;

  const TestMealsState({
    this.status = TestMealsStatus.initial,
    this.meals = const [],
    this.errorMessage = '',
  });

  TestMealsState copyWith({
    TestMealsStatus? status,
    List<TestMealModel>? meals,
    String? errorMessage,
  }) {
    return TestMealsState(
      status: status ?? this.status,
      meals: meals ?? this.meals,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, meals, errorMessage];
}

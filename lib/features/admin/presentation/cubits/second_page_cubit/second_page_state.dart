abstract class SecondPageState {}

final class SecondPageCubitInitial extends SecondPageState {}

final class GetChartDataLoading extends SecondPageState {}

final class GetChartDataSuccess extends SecondPageState {}

final class GetChartDataError extends SecondPageState {
  final String error;

  GetChartDataError({required this.error});
}

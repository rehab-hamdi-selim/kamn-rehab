import 'package:kamn/features/admin/data/models/analytics_model.dart';

sealed class SecondPageCubitState {}

final class SecondPageCubitInitial extends SecondPageCubitState {}

final class GetChartDataLoading extends SecondPageCubitState {}

final class GetChartDataSuccess extends SecondPageCubitState {
  final AnalyticsModel analyticsModel;

  GetChartDataSuccess({required this.analyticsModel});
}

final class GetChartDataError extends SecondPageCubitState {
  final String error;

  GetChartDataError({required this.error});
}

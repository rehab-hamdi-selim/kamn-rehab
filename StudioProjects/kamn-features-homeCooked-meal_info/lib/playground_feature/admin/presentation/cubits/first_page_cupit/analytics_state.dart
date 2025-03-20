import 'package:kamn/playground_feature/admin/data/models/analytics_data_model.dart';

// abstract class AnalyticsState {}

// class AnalyticsInitState extends AnalyticsState {}

// class AnalyticsSuccess extends AnalyticsState {
//   final List<AnalyticsDataModel> data;
//   AnalyticsSuccess(this.data);
// }

enum AnalyticsStatus {
  initial,
  loading,
  success,
  failure,
}

extension AnalyticsExtension on AnalyticsState {
  bool get isInitial => state == AnalyticsStatus.initial;
  bool get isLoading => state == AnalyticsStatus.loading;
  bool get isSuccess => state == AnalyticsStatus.success;
  bool get isFailure => state == AnalyticsStatus.failure;
}

class AnalyticsState {
  final AnalyticsStatus state;
  final List<AnalyticsDataModel>? analyticsdata;
  final String? erorrMessage;
  final String? successMessage;

  AnalyticsState({
    required this.state,
    this.analyticsdata,
    this.erorrMessage,
    this.successMessage,
  });
}

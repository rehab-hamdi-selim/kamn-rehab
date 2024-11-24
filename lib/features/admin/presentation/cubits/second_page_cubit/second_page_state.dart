import 'package:kamn/features/admin/data/models/chart_data_model.dart';

enum SecondPageStatus { intial, loading, success, failure }

// Ask What is State
extension SecondPageExtension on SecondPageState {
  bool get inInitial => state == SecondPageStatus.intial;
  bool get inLoading => state == SecondPageStatus.loading;
  bool get inSuccess => state == SecondPageStatus.success;
  bool get inFailure => state == SecondPageStatus.failure;
}

class SecondPageState {
  final SecondPageStatus? state;
  final ChartDataModel? data;
  final String? erorrMessage;
  SecondPageState({this.state, this.data, this.erorrMessage});
}

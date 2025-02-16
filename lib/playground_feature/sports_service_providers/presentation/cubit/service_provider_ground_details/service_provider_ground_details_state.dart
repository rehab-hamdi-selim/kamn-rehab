// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kamn/playground_feature/sports_service_providers/data/model/playground_request_model.dart';

enum ServiceProviderGroundDetailsStatus {
  initial,
  loading,
  success,
  failure,
  textExtended
}

extension SportsGroundStateExtension on ServiceProviderGroundDetailsState {
  bool get isInitial => state == ServiceProviderGroundDetailsStatus.initial;
  bool get isLoading => state == ServiceProviderGroundDetailsStatus.loading;
  bool get isSuccess => state == ServiceProviderGroundDetailsStatus.success;
  bool get isFailure => state == ServiceProviderGroundDetailsStatus.failure;
  bool get isTextExtended =>
      state == ServiceProviderGroundDetailsStatus.textExtended;
}

class ServiceProviderGroundDetailsState {
  final ServiceProviderGroundDetailsStatus state;
  final List<PlaygroundRequestModel>? playgrounds;
  final String? erorrMessage;
  final String? successMessage;

  ServiceProviderGroundDetailsState({
    required this.state,
    this.playgrounds,
    this.erorrMessage,
    this.successMessage,
  });

  @override
  String toString() {
    return 'ServiceProviderGroundDetailsState(state: $state, playgrounds: $playgrounds, erorrMessage: $erorrMessage, successMessage: $successMessage)';
  }
}

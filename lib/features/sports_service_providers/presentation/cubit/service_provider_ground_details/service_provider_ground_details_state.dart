import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';

enum ServiceProviderGroundDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

extension SportsGroundStateExtension on ServiceProviderGroundDetailsState {
  bool get isInitial => state == ServiceProviderGroundDetailsStatus.initial;
  bool get isLoading => state == ServiceProviderGroundDetailsStatus.loading;
  bool get isSuccess => state == ServiceProviderGroundDetailsStatus.success;
  bool get isFailure => state == ServiceProviderGroundDetailsStatus.failure;
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
}

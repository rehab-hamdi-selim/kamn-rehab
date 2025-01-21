
import 'package:flutter/widgets.dart';

import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';

enum ServiceProviderGroundsStatus {
  initial,
  loading,
  success,
  failure,
}

extension SportsGroundStateExtension on ServiceProviderGroundsState {
  bool get isInitial => state == ServiceProviderGroundsStatus.initial;
  bool get isLoading => state == ServiceProviderGroundsStatus.loading;
  bool get isSuccess => state == ServiceProviderGroundsStatus.success;
  bool get isFailure => state == ServiceProviderGroundsStatus.failure;
}

class ServiceProviderGroundsState {
  final ServiceProviderGroundsStatus state;
  final Map<String, List<PlaygroundRequestModel>>? playgrounds;
  final String? erorrMessage;
  final String? successMessage;

  ServiceProviderGroundsState({
    required this.state,
    this.playgrounds,
    this.erorrMessage,
    this.successMessage,
  });

  ServiceProviderGroundsState copyWith({
    ServiceProviderGroundsStatus? state,
    Map<String, List<PlaygroundRequestModel>>? playgrounds,
    String? erorrMessage,
    ValueGetter<String?>? successMessage,
  }) {
    return ServiceProviderGroundsState(
      state: state ?? this.state,
      playgrounds: playgrounds ?? this.playgrounds,
      erorrMessage: erorrMessage ?? this.erorrMessage,
      successMessage:
          successMessage != null ? successMessage() : this.successMessage,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';

import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';

enum GetGroundStatus {
  initial,
  loading,
  success,
  error,
}

extension statusGetGround on GetGroundViewModelState {
  bool get isInitial => status == GetGroundStatus.initial;
  bool get isLoading => status == GetGroundStatus.loading;
  bool get isSuccess => status == GetGroundStatus.success;
  bool get isError => status == GetGroundStatus.error;
}

class GetGroundViewModelState {
  final GetGroundStatus status;
  final List<PlaygroundModel>? playgrounds;
  final String? errorMessage;
  GetGroundViewModelState({
    required this.status,
    this.playgrounds,
    this.errorMessage,
  });

  GetGroundViewModelState copyWith({
    GetGroundStatus? status,
    List<PlaygroundModel>? playgrounds,
    String? errorMessage,
  }) {
    return GetGroundViewModelState(
      status: status ?? this.status,
      playgrounds: playgrounds ?? this.playgrounds,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'GetGroundViewModelState(status: $status, playgrounds: $playgrounds, errorMessage: $errorMessage)';

  @override
  bool operator ==(covariant GetGroundViewModelState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.playgrounds, playgrounds) &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode =>
      status.hashCode ^ playgrounds.hashCode ^ errorMessage.hashCode;
}

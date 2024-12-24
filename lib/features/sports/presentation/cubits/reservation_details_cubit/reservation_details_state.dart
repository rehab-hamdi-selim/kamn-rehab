import 'package:flutter_countdown_timer/countdown_controller.dart';

enum ReservationDetailsStatus { initial, refreshed, completed }

extension ReservationDetailsStateExtension on ReservationDetailsStatus {
  bool get isInitial => this == ReservationDetailsStatus.initial;
  bool get isRefreshed => this == ReservationDetailsStatus.refreshed;
  bool get isCompleted => this == ReservationDetailsStatus.completed;
}

class ReservationDetailsState {
  final ReservationDetailsStatus status;
  final String? errorMessage;
  final Duration? countdownDuration;
  final bool? isVisible;
  final int? maxLines;
  ReservationDetailsState({
    this.status = ReservationDetailsStatus.initial,
    this.errorMessage,
    this.countdownDuration,
    this.isVisible = true,
    this.maxLines = 10,
  });

  ReservationDetailsState copyWith({
    ReservationDetailsStatus? status,
    String? errorMessage,
    Duration? countdownDuration,
    bool? isVisible,
    int? maxLines,
  }) {
    return ReservationDetailsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      countdownDuration: countdownDuration ?? this.countdownDuration,
      isVisible: isVisible ?? this.isVisible,
      maxLines: maxLines ?? this.maxLines,
    );
  }
}

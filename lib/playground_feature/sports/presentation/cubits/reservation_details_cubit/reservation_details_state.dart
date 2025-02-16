// ignore_for_file: public_member_api_docs, sort_constructors_first

enum ReservationDetailsStatus { initial, refreshed, completed,deleted,failed,timeExcessed }

extension ReservationDetailsStateExtension on ReservationDetailsState {
  bool get isInitial => status == ReservationDetailsStatus.initial;
  bool get isRefreshed => status == ReservationDetailsStatus.refreshed;
  bool get isCompleted => status == ReservationDetailsStatus.completed;
  bool get isDeleted => status == ReservationDetailsStatus.deleted;
  bool get isFailed => status == ReservationDetailsStatus.failed;
  bool get isTimeExcessed => status == ReservationDetailsStatus.timeExcessed;
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

  @override
  String toString() {
    return 'ReservationDetailsState(status: $status, errorMessage: $errorMessage, countdownDuration: $countdownDuration, isVisible: $isVisible, maxLines: $maxLines)';
  }
}

import 'package:equatable/equatable.dart';
import '../../../data/models/notifications_model.dart';

enum NotificationsStatus {
  initial,
  loading,
  success,
  failure,
}

class NotificationsState extends Equatable {
  final NotificationsStatus status;
  final List<NotificationsModel> notifications;
  final String? errorMessage;

  const NotificationsState({
    this.status = NotificationsStatus.initial,
    this.notifications = const [],
    this.errorMessage,
  });

  bool get isLoading => status == NotificationsStatus.loading;
  bool get isSuccess => status == NotificationsStatus.success;
  bool get isFailure => status == NotificationsStatus.failure;

  NotificationsState copyWith({
    NotificationsStatus? status,
    List<NotificationsModel>? notifications,
    String? errorMessage,
  }) {
    return NotificationsState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, notifications, errorMessage];
}

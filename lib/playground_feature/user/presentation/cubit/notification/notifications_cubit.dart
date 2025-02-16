import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/repository/user_repository.dart';
import 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final UserRepository _userRepository;

  NotificationsCubit({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const NotificationsState());

  Future<void> getNotifications(String userId) async {
    emit(state.copyWith(status: NotificationsStatus.loading));
    final result = await _userRepository.getNotifications(userId);
    result.fold(
      (failure) => emit(state.copyWith(
        status: NotificationsStatus.failure,
        errorMessage: failure.erorr,
      )),
      (notifications) => emit(state.copyWith(
        status: NotificationsStatus.success,
        notifications: notifications,
      )),
    );
  }

  Future<void> markAsRead(String notificationId, String userId) async {
    final result = await _userRepository.markNotificationAsRead(notificationId);
    result.fold(
      (failure) => emit(state.copyWith(
        status: NotificationsStatus.failure,
        errorMessage: failure.erorr,
      )),
      (_) => getNotifications(userId),
    );
  }
}

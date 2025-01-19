import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/erorr/faliure.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../data_source/user_remote_data_source.dart';
import '../models/notifications_model.dart';

abstract interface class UserRepository {
  Future<Either<Faliure, List<NotificationsModel>>> getNotifications(
      String userId);
  Future<Either<Faliure, void>> markNotificationAsRead(String notificationId);
}

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl({required UserRemoteDataSource userRemoteDataSource})
      : _userRemoteDataSource = userRemoteDataSource;

  @override
  Future<Either<Faliure, List<NotificationsModel>>> getNotifications(
      String userId) async {
    return await executeTryAndCatchForRepository(() async {
      final notifications =
          await _userRemoteDataSource.getNotifications(userId);
      return notifications
          .map((notification) => NotificationsModel.fromMap(notification))
          .toList();
    });
  }

  @override
  Future<Either<Faliure, void>> markNotificationAsRead(
      String notificationId) async {
    return await executeTryAndCatchForRepository(() async {
      await _userRemoteDataSource.markNotificationAsRead(notificationId);
    });
  }
}

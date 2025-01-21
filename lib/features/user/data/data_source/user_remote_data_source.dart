import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/class/firestore_services.dart';
import '../../../../core/const/firebase_collections.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../models/notifications_model.dart';

abstract interface class UserRemoteDataSource {
  Future<List<Map<String, dynamic>>> getNotifications(String userId);
  Future<void> markNotificationAsRead(String notificationId);
}

@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirestoreService _firestoreService;

  UserRemoteDataSourceImpl({required FirestoreService firestoreService})
      : _firestoreService = firestoreService;

  @override
  Future<List<Map<String, dynamic>>> getNotifications(String userId) async {
    return await executeTryAndCatchForDataLayer(() async {
      final querySnapshot = await _firestoreService.firestore
          .collection(FirebaseCollections.notifications)
          .where('userId', isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .get();

      return querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Future<void> markNotificationAsRead(String notificationId) async {
    return await executeTryAndCatchForDataLayer(() async {
      await _firestoreService.firestore
          .collection(FirebaseCollections.notifications)
          .doc(notificationId)
          .update({'isRead': true});
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/class/firebase_storage_services.dart';
import 'package:kamn/core/common/class/firestore_services.dart';

abstract class AnalyticsDataSource {
  Future<List<Map<String, dynamic>>> getAnalyticsData();
}

@Injectable(as: AnalyticsDataSource)
class AnalyticsDataSourceImpl implements AnalyticsDataSource {
  FirestoreService firestoreServices;
  FirebaseStorageServices storageServies;
  AnalyticsDataSourceImpl(
      {required this.firestoreServices, required this.storageServies});
  @override
  Future<List<Map<String, dynamic>>> getAnalyticsData() {
    return executeTryAndCatchForDataLayer(() async {
      var querySnapshot =
          await FirebaseFirestore.instance.collection('analyticsdata').get();
      return querySnapshot.docs
          .map((doc) => doc.data())
          .toList();
    });
  }
}

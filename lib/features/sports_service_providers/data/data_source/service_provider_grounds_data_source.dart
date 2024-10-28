import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/class/firestore_services.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';

abstract class ServiceProviderGroundsDataSource {
  Future<List<Map<String, dynamic>>> getPlaygroundsRequests();
}

@Injectable(as: ServiceProviderGroundsDataSource)
class ServiceProviderGroundsDataSourceImpl
    implements ServiceProviderGroundsDataSource {
  FirestoreService firestoreServices;
  ServiceProviderGroundsDataSourceImpl({required this.firestoreServices});

  @override
  Future<List<Map<String, dynamic>>> getPlaygroundsRequests() {
    return executeTryAndCatchForDataLayer(() async {
      var querySnapshot = await firestoreServices
          .getData(FirebaseCollections.playgroundsRequests);
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }
}

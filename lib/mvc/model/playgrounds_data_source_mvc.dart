import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';

import '../../core/common/class/firestore_services.dart';
import '../../features/sports/data/models/playground_model.dart';

class GetGroundsDataSourceMVC {
  final FirestoreService firestoreServices;

  GetGroundsDataSourceMVC({required this.firestoreServices});

  Future<List<PlaygroundModel>> getPlaygroundsRequests() {
    return executeTryAndCatchForDataLayer(() async {
      var querySnapshot =
          await firestoreServices.getData(FirebaseCollections.playgrounds);
      print(querySnapshot.docs.length);
      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return PlaygroundModel.fromMap(data);
      }).toList();
    });
  }
}

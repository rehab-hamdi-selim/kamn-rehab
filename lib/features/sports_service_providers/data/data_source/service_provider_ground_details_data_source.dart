import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/class/firestore_services.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';

abstract class ServiceProviderGroundDetailsDataSource {
  Future<void> addToFiresore(PlaygroundModel playgroundModel);
  Future<void> updateState(
      PlaygroundRequestModel playgroundModel, Map<String, dynamic> data);
}

@Injectable(as: ServiceProviderGroundDetailsDataSource)
class ServiceProviderGroundDetailsDataSourceImpl
    implements ServiceProviderGroundDetailsDataSource {
  FirestoreService firestoreServices;
  ServiceProviderGroundDetailsDataSourceImpl({
    required this.firestoreServices,
  });

  @override
  Future<void> addToFiresore(PlaygroundModel playgroundModel) {
    return executeTryAndCatchForDataLayer(() async {
      return await firestoreServices.addData(
          FirebaseCollections.playgrounds, playgroundModel.toMap());
    });
  }

  @override
  Future<void> updateState(
      PlaygroundRequestModel playgroundModel, Map<String, dynamic> data) {
    return executeTryAndCatchForDataLayer(() async {
      return await firestoreServices.updateData(
          FirebaseCollections.playgroundsRequests, playgroundModel, data);
    });
  }
}

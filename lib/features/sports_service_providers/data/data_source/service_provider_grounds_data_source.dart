import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kamn/core/common/class/firestore_services.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/service_provider_grounds_screen.dart';

abstract class ServiceProviderGroundsDataSource {
  Future<List<PlaygroundRequestModel>> getPlaygroundsRequest();
}

class ServiceProviderGroundsDataSourceImpl
    implements ServiceProviderGroundsDataSource {
  FirestoreService firestore;
  ServiceProviderGroundsDataSourceImpl({required this.firestore});

  @override
  Future<List<PlaygroundRequestModel>> getPlaygroundsRequest() {
    return;
  }
}

//init add_service_provider_to_firebase branch
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_model.dart';

abstract class ServiceProvidersRemoteDataSource {
  void addServiceToFirestore(PlaygroundModel playground);
}

class ServiceProvidersRemoteDataSourceImpl
    implements ServiceProvidersRemoteDataSource {
  FirebaseFirestore firestore;
  ServiceProvidersRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> addServiceToFirestore(PlaygroundModel playground) async {
    executeTryAndCatchForDataLayer(() async {
      var collRef = firestore.collection(FirebaseCollections.playgrounds);
      playground.playgroundId = collRef.doc().id;
      return await collRef.add(playground.toMap());
    });
  }
}

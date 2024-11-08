import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/const/firebase_collections.dart';
import '../../../../core/utils/try_and_catch.dart';

abstract interface class SportsRemoteDataSource {
  Future<List<Map<String, dynamic>>> getPlaygrounds();
}

@Injectable(as: SportsRemoteDataSource)
class SportsRemoteDataSourceImpl implements SportsRemoteDataSource {
  final FirebaseFirestore _firestore;
  SportsRemoteDataSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;
  CollectionReference get _playGroundCollection =>
      _firestore.collection(FirebaseCollections.playgrounds);
  @override
  Future<List<Map<String, dynamic>>> getPlaygrounds() async {
    return executeTryAndCatchForDataLayer(() async {
      var querySnapshot = await _playGroundCollection.get();
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }
}

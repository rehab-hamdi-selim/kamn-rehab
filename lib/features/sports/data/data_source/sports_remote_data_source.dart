import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/const/firebase_collections.dart';
import '../../../../core/erorr/has_reach_end_exception.dart';
import '../../../../core/utils/try_and_catch.dart';

abstract interface class SportsRemoteDataSource {
  Future<List<Map<String, dynamic>>> getPlaygrounds();
  Future<Map<String, dynamic>> getPlaygroundsWithFirstPagginationWay(int limit);
  Future<List<Map<String, dynamic>>> getPlaygroundsWithSecoundPagginationWay(
      DocumentSnapshot? lastVisible);

  Future<List<Map<String, dynamic>>> getPlaygroundsWithThirdPagginationWay(
      int startAt);
}

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

// الدالة الأولى: لتحميل البيانات مع الحد المحدد
  @override
  Future<Map<String, dynamic>> getPlaygroundsWithFirstPagginationWay(
      int limit) async {
    return executeTryAndCatchForDataLayer(() async {
      // جلب أول دفعة بحد معين
      var querySnapshot = await _playGroundCollection.limit(limit).get();

      // التحقق من الوصول إلى نهاية المجموعة
      bool hasReachedEnd = querySnapshot.docs.length < limit;

      return {
        "data": querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList(),
        "hasReachedEnd": hasReachedEnd
      };
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getPlaygroundsWithSecoundPagginationWay(
      DocumentSnapshot? lastVisible) async {
    return executeTryAndCatchForDataLayer(() async {
      const int limit = 10;

      Query query = _playGroundCollection.orderBy("population").limit(limit);

      // إذا كان هناك وثيقة مرئية من الدفعة السابقة
      if (lastVisible != null) {
        query = query.startAfterDocument(lastVisible);
      }

      var querySnapshot = await query.get();
      var docs = querySnapshot.docs;

      // تحقق مما إذا كانت هذه هي آخر دفعة
      bool hasReachedEnd = docs.length < limit;

      if (hasReachedEnd) {
        throw HasReachEndException();
      }

      return docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getPlaygroundsWithThirdPagginationWay(
      int startAt) async {
    return executeTryAndCatchForDataLayer(() async {
      var querySnapshot = await _playGroundCollection
          .orderBy("population")
          .limit(10)
          .startAt([startAt]).get();

//i dont like to write logic in data source layer
      bool hasReachedEnd = querySnapshot.docs.length < 10;

      if (hasReachedEnd) {
        throw HasReachEndException();
      }
//==============================================
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }
}

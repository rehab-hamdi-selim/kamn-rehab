import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';

abstract interface class SecondPageDataSource {
  Future<Map<String, dynamic>> secondPageDataSource();
}

class SecondPageDataSourceImpl implements SecondPageDataSource {
  final FirebaseFirestore firestore;
  const SecondPageDataSourceImpl({required this.firestore});

  // ignore: non_constant_identifier_names
  CollectionReference get _SecondPageData =>
      firestore.collection(FirebaseCollections.analyticsdata);

  @override
  Future<Map<String, dynamic>> secondPageDataSource() async {
    return executeTryAndCatchForDataLayer(() async {
      var querySnapshot =
          await _SecondPageData.doc('nlCtjDvonWFCdK6pfgGy').get();
      return querySnapshot.data() as Map<String, dynamic>;
    });
  }
}

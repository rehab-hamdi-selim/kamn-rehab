import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/class/firestore_services.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';

abstract interface class SecondPageDataSource {
  Future<Map<String, dynamic>> secondPageDataSource();
}

@Injectable(as: SecondPageDataSource)
class SecondPageDataSourceImpl implements SecondPageDataSource {
  final FirestoreService firestore;
  const SecondPageDataSourceImpl({required this.firestore});

  // ignore: non_constant_identifier_names
  CollectionReference get _SecondPageData =>
      firestore.firestore.collection(FirebaseCollections.analyticsdata);

  @override
  Future<Map<String, dynamic>> secondPageDataSource() async {
    return executeTryAndCatchForDataLayer(() async {
      var querySnapshot =
          await _SecondPageData.doc('nlCtjDvonWFCdK6pfgGy').get();
      return querySnapshot.data() as Map<String, dynamic>;
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/const/firebase_collections.dart';
import '../../../../core/utils/try_and_catch.dart';

abstract interface class SignInDataSource {
  Future<Map<String, dynamic>> signInDataSource(
      {required String email, required String password});
}

@Injectable(as: SignInDataSource)
class SignInDataSourceImpl implements SignInDataSource {
  final FirebaseFirestore _firestore;
  SignInDataSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;
  CollectionReference get _userCollection =>
      _firestore.collection(FirebaseCollections.users);
  @override
  Future<Map<String, dynamic>> signInDataSource(
      {required String email, required String password}) async {
    return await executeTryAndCatchForDataLayer(() async {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        //  String? idToken =  value.user!.getIdToken();

        final String uid = value.user?.uid ?? "";

        if (uid.isEmpty) {
          throw "Failed to create user: UID is null.";
        }
        var querySnapshot = _userCollection.doc(value.user!.uid);
        return querySnapshot.get().then((value) {
          return value.data() as Map<String, dynamic>;
        });
      });
    });
  }
}

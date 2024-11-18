import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/authantication/data/model/auth_user_model.dart';
import '../../../../core/const/firebase_collections.dart';
import '../../../../core/utils/try_and_catch.dart';

abstract interface class SignUpDataSource {
  Future<UserCredential> signUpDataSource(
      {required String email, required String password, required String name});
}

@Injectable(as: SignUpDataSource)
class SignUpDataSourceImpl implements SignUpDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  SignUpDataSourceImpl({
    required FirebaseFirestore firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore,
        _auth = auth ?? FirebaseAuth.instance;

  CollectionReference get _userCollection =>
      _firestore.collection(FirebaseCollections.users);

  @override
  Future<UserCredential> signUpDataSource(
      {required String email,
      required String password,
      required String name}) async {
    return await executeTryAndCatchForDataLayer(() async {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user == null) {
        throw FirebaseAuthException(
            message: "User creation failed", code: 'user-not-found');
      }

      return userCredential;
    });
  }
}

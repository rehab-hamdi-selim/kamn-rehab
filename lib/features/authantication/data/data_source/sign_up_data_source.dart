import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/authantication/data/model/auth_user_model.dart';
import '../../../../core/const/firebase_collections.dart';
import '../../../../core/utils/try_and_catch.dart';

abstract interface class SignUpDataSource {
  Future<Map<String, dynamic>> signUpDataSource(
      {required String email, required String password, required String name});
}

@Injectable(as: SignUpDataSource)
class SignUpDataSourceImpl implements SignUpDataSource {
  final FirebaseFirestore _firestore;
  SignUpDataSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;
  CollectionReference get _userCollection =>
      _firestore.collection(FirebaseCollections.users);
  @override
  Future<Map<String, dynamic>> signUpDataSource(
      {required String email,
      required String password,
      required String name}) async {
    return await executeTryAndCatchForDataLayer(() async {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        var querySnapshot = _userCollection
            .doc(value.user!.uid)
            .set(
              AuthUserModel(
                      email: email,
                      name: name,
                      type: 'user',
                      userId: value.user!.uid)
                  .toJson(),
            )
            .then((element) {
          FirebaseFirestore.instance
              .collection(FirebaseCollections.users)
              .doc(value.user!.uid)
              .get()
              .then((value) {
            return value.data() as Map<String, dynamic>;
          });
        });
      }).catchError((e) {
        if (e.code == 'weak-password') {
          throw 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          throw 'The account already exists for that email.';
        }
      });
      throw "Firebase error";
    });
  }
}

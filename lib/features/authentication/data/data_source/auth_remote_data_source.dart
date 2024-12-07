import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/const/firebase_collections.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../../../../core/common/entities/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserCredential> signUp(
      {required String email, required String password, required String name});
  Future<void> sendVerificationEmail();
  Future<void> setUser({required UserModel userModel});
  Future<void> deleteUser({required String uid});
  Future<UserCredential> signIn(
      {required String email, required String password});
  Future<Map<String, dynamic>> getUserData({required String uid});
  Future<void> signOut();
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  AuthRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore,
        _auth = auth ?? FirebaseAuth.instance;

  CollectionReference get _userCollection =>
      _firestore.collection(FirebaseCollections.users);

  @override
  Future<UserCredential> signUp(
      {required String email,
      required String password,
      required String name}) async {
    return await executeTryAndCatchForDataLayer(() async {
      // Create the user account
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user == null) {
        throw FirebaseAuthException(
            message: "User creation failed", code: 'user-not-found');
      }

      // Update display name
      await userCredential.user!.updateDisplayName(name);

      return userCredential;
    });
  }

  @override
  Future<void> sendVerificationEmail() async {
    return await executeTryAndCatchForDataLayer(() async {
      await _auth.currentUser?.sendEmailVerification();
      await _auth.signOut();
    });
  }

  @override
  Future<void> setUser({required UserModel userModel}) async {
    return await executeTryAndCatchForDataLayer(() async {
      throw "User data not saved";
      await _userCollection.doc(userModel.uid).set(userModel.toMap());
    });
  }

  @override
  Future<void> deleteUser({required String uid}) async {
    return await executeTryAndCatchForDataLayer(() async {
      await _auth.currentUser?.delete();
      await _userCollection.doc(uid).delete();
    });
  }

  @override
  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    return await executeTryAndCatchForDataLayer(() async {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (!userCredential.user!.emailVerified) {
        throw FirebaseAuthException(
          code: 'email-not-verified',
          message: 'Please verify your email before signing in.',
        );
      }

      return userCredential;
    });
  }

  @override
  Future<Map<String, dynamic>> getUserData({required String uid}) async {
    return await executeTryAndCatchForDataLayer(() async {
      final doc = await _userCollection.doc(uid).get();
      return doc.data() as Map<String, dynamic>;
    });
  }

  @override
  Future<void> signOut() async {
    return await executeTryAndCatchForDataLayer(() async {
      await _auth.signOut();
    });
  }
}

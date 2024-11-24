import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/authantication/data/data_source/sign_up_data_source.dart';
import 'package:kamn/features/authantication/data/model/auth_user_model.dart';

abstract interface class SignUpRepository {
  Future<Either<Faliure, AuthUserModel>> signUp({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Faliure, void>> setUser(
      {required AuthUserModel authUserModel}) ;
        Future<Either<Faliure, void>> deleteUser(
      {required String uid});
}

@Injectable(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDataSource _signUpDataSource;
  final FirebaseFirestore _firestore;

  SignUpRepositoryImpl({
    required SignUpDataSource signUpDataSource,
    required FirebaseFirestore firestore,
  })  : _signUpDataSource = signUpDataSource,
        _firestore = firestore;

  @override
  Future<Either<Faliure, AuthUserModel>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    return await executeTryAndCatchForRepository(() async {
      final userCredential = await _signUpDataSource.signUpDataSource(
        email: email,
        password: password,
        name: name,
      );

      // if (userCredential.user == null) {
      //   throw FirebaseAuthException(code: "user-not-found");
      // }

      // Create AuthUserModel from UserCredential
      final authUserModel = AuthUserModel(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
        createdAt: DateTime.now(),
      );

      // Store additional user data in Firestore
      // await _firestore
      //     .collection('users')
      //     .doc(userCredential.user!.uid)
      //     .set(authUserModel.toMap());

      return authUserModel;
    });
  }

  @override
  Future<Either<Faliure, void>> setUser(
      {required AuthUserModel authUserModel}) async {
    return await executeTryAndCatchForRepository(() async {
       await _signUpDataSource.setUserDataSource( authUserModel: authUserModel);
     
    });
  }

    @override
  Future<Either<Faliure, void>> deleteUser(
      {required String uid}) async {
    return await executeTryAndCatchForRepository(() async {
       await _signUpDataSource.deleteUserAccountDataSource( uid: uid);
     
    });
  }

}

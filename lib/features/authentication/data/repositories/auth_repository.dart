import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/erorr/faliure.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../../../../core/common/entities/user_model.dart';
import '../data_source/auth_remote_data_source.dart';

abstract interface class AuthRepository {
  Future<Either<Faliure, UserModel>> signUp({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Faliure, void>> sendVerificationEmail();
  Future<Either<Faliure, void>> setUser({required UserModel userModel});
  Future<Either<Faliure, void>> deleteUser({required String uid});
  Future<Either<Faliure, String>> signIn(
      {required String email, required String password});
  Future<Either<Faliure, UserModel>> getUser({required String uid});
  Future<Either<Faliure, void>> signOut();
}

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource authDataSource})
      : _authDataSource = authDataSource;

  @override
  Future<Either<Faliure, UserModel>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    return await executeTryAndCatchForRepository(() async {
      final userCredential = await _authDataSource.signUp(
        email: email,
        password: password,
        name: name,
      );

      final userModel = UserModel(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
        createdAt: DateTime.now(),
      );

      return userModel;
    });
  }

  @override
  Future<Either<Faliure, void>> sendVerificationEmail() async {
    return await executeTryAndCatchForRepository(() async {
      await _authDataSource.sendVerificationEmail();
    });
  }

  @override
  Future<Either<Faliure, void>> setUser({required UserModel userModel}) async {
    return await executeTryAndCatchForRepository(() async {
      await _authDataSource.setUser(userModel: userModel);
    });
  }

  @override
  Future<Either<Faliure, void>> deleteUser({required String uid}) async {
    return await executeTryAndCatchForRepository(() async {
      await _authDataSource.deleteUser(uid: uid);
    });
  }

  @override
  Future<Either<Faliure, String>> signIn(
      {required String email, required String password}) async {
    return executeTryAndCatchForRepository(() async {
      final userCredential =
          await _authDataSource.signIn(email: email, password: password);
      return userCredential.user!.uid;
    });
  }

  @override
  Future<Either<Faliure, UserModel>> getUser({required String uid}) async {
    return executeTryAndCatchForRepository(() async {
      final userData = await _authDataSource.getUserData(uid: uid);
      return UserModel.fromMap(userData);
    });
  }

  @override
  Future<Either<Faliure, void>> signOut() async {
    return await executeTryAndCatchForRepository(() async {
      await _authDataSource.signOut();
    });
  }
}

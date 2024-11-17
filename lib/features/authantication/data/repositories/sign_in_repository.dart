import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/features/authantication/data/data_source/sign_in_data_source.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../model/auth_user_model.dart';

@injectable
class SignInRepository {
  final SignInDataSource _remoteDataSource;
  SignInRepository({required SignInDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  Future<Either<Faliure, AuthUserModel?>> signIn({required String email, required String password}) async {
    return executeTryAndCatchForRepository(() async {
      final Map<String, dynamic> rawData =
          await _remoteDataSource.signInDataSource(email: email, password:password);

      final userModel =AuthUserModel.fromMap(rawData);

      return userModel;
    });
  }
}
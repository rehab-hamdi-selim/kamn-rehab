import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../data_source/sign_up_data_source.dart';
import '../model/auth_user_model.dart';

@injectable
class SignUpRepository {
  final SignUpDataSource _remoteDataSource;
  SignUpRepository({required SignUpDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  Future<Either<Faliure, AuthUserModel?>> signUp({required String email, required String password,required String name,}) async {
    return executeTryAndCatchForRepository(() async {
      final Map<String, dynamic> rawData =
          await _remoteDataSource.signUpDataSource(email: email, password:password,name: name);

      final userModel =AuthUserModel.fromMap(rawData);

      return userModel;
    });
  }
}
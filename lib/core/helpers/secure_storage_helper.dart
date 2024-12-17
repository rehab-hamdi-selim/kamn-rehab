import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import '../common/entities/user_model.dart';

class SecureStorageHelper {
  static const String _userKey = 'user_data';
  static const _storage = FlutterSecureStorage();

  // Save user data
  static Future<Either<String, void>> saveUserData(UserModel user) async {
    try {
      await _storage.write(
        key: user.uid,
        value: user.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Get user data
  static Future<Either<String, UserModel?>> getUserData() async {
    try {
      final userData = await _storage.read(key: _userKey);
      if (userData != null) {
        return Right(UserModel.fromJson(userData));
      }
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Remove user data
  static Future<Either<String, void>> removeUserData() async {
    try {
      await _storage.delete(key: _userKey);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Check if user is logged in
  static Future<Either<String, bool>> isUserLoggedIn() async {
    try {
      final userData = await _storage.read(key: _userKey);
      if (userData != null) {
        return const Right(true);
      }
      return const Left('User is not logged in');
    } catch (e) {
      return Left(e.toString());
    }
  }
}

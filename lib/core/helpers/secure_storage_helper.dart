import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import '../common/entities/user_model.dart';

class SecureStorageHelper {
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  static const String _userKey = 'user_data';
  static const String _firstTime = 'first_time';
  static const String _ratingListKey = 'ratingList';
  static final _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  // Save user data
  static Future<Either<String, void>> saveData<T>(T data, String key) async {
    try {
      await _storage.write(
        key: key,
        value: jsonEncode(data),
      );
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  //get data
  static Future<Either<String, T>> getData<T>(String key) async {
    try {
      final data = await _storage.read(key: key);
      if (data != null) {
        return Right(jsonDecode(data));
      }
      return const Left('Data not found');
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Save user data
  static Future<Either<String, void>> saveUserData(UserModel user) async {
    try {
      await _storage.write(
        key: _userKey,
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
  static Future<Either<String, UserModel>> isUserLoggedIn() async {
    try {
      final userData = await _storage.read(key: _userKey);
      if (userData != null) {
        return Right(UserModel.fromJson(userData));
      }
      return const Left('User is not logged in');
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, String>> isFirstInstallation() async {
    try {
      final flag = await _storage.read(key: _firstTime);
      if (flag != null) {
        return Right(flag);
      }
      return const Left('User is not Install the app');
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, void>> saveInstalltionFlag() async {
    try {
      await _storage.write(
        key: _firstTime,
        value: 'installed',
      );
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<void> saveStringList(List<String> list) async {
    final jsonString = jsonEncode(list);
    await _storage.write(
      key: _ratingListKey,
      value: jsonString,
    );
  }

  static Future<List<String>> getStringList() async {
    final jsonString = await _storage.read(key: _ratingListKey);
    if (jsonString != null) {
      return List<String>.from(jsonDecode(jsonString));
    }
    return [];
  }
}

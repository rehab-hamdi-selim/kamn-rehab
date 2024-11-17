import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import '../erorr/faliure.dart';
import '../erorr/netowrk_exception.dart';

// Define a utility function to handle exceptions and return an Either type
Future<Either<Faliure, T>> executeTryAndCatchForRepository<T>(
    Future<T> Function() action) async {
  try {
    final result = await action();
    return right(result);
  } on FormatException catch (e) {
    return left(Faliure('Error parsing data: ${e.message}'));
  } on NoInternetException catch (e) {
    return left(Faliure(e.message));
  } on TypeError catch (e) {
    return left(Faliure(
        'Type error: ${e.toString()}. This might be due to incorrect data structure.'));
  } on NoSuchMethodError catch (e) {
    return left(Faliure(
        'Method not found: ${e.toString()}. This might be due to missing fields in the data.'));
  } catch (e) {
    if (e is FirebaseException) {
      return left(Faliure(
          'Firebase error: ${e.code} - ${e.message ?? 'An unknown Firebase error occurred'}'));
    } else if (e is TimeoutException) {
      return left(Faliure('Operation timed out: ${e.message}'));
    } else if (e is SocketException) {
      return left(Faliure('Network error: ${e.message}'));
    } else {
      return left(Faliure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}

Future<T> executeTryAndCatchForDataLayer<T>(Future<T> Function() action) async {
  try {
    var check = await Connectivity().checkConnectivity();

    if (check.contains(ConnectivityResult.mobile) ||
        check.contains(ConnectivityResult.wifi)) {
      return await action();
    } else {
      throw NoInternetException();
    }
  } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user.';
      }
      throw 'An error occurred while signing in: ${e.message}';
    }
   on FirebaseException catch (e) {
    throw 'Firebase error: ${e.code} - ${e.message ?? 'An unknown Firebase error occurred'}';
  } on TimeoutException catch (e) {
    throw 'Operation timed out: ${e.message}';
  } on SocketException catch (e) {
    throw 'Network error: ${e.message}';
  } on FormatException catch (e) {
    throw 'Error parsing data: ${e.message}';
  } catch (e) {
    throw 'An unexpected error occurred: ${e.toString()}';
  }
}

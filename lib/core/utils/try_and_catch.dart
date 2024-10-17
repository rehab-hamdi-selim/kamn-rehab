import 'package:fpdart/fpdart.dart';
import '../erorr/exception.dart';
import '../erorr/faliure.dart';

// Define a utility function to handle exceptions and return an Either type
Future<Either<Faliure, T>> executeTryAndCatchForRepository<T>(
    Future<T> Function() action) async {
  try {
    return right(await action());
  } catch (e) {
    return left(Faliure(e.toString()));
  }
}

Future<Map> executeTryAndCatchForDataLayer(
    Future<Map> Function() action) async {
  try {
    return await action();
  } catch (e) {
    throw e.toString();
  }
}

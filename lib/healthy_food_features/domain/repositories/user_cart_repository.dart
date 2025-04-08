import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/error/failures.dart';
import 'package:kamn/healthy_food_features/data/data_sources/user_cart_data_source.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

import '../../../core/erorr/faliure.dart';
import '../../../core/utils/try_and_catch.dart';

abstract class UserCartRepository {
  Future<List<TestMealModel>> getCart();
  Future<void> updateCart(List<TestMealModel> cart, String uid);
  Future<void> clearCart();
}

@Injectable(as: UserCartRepository)
class UserCartRepositoryImpl implements UserCartRepository {
  final UserCartDataSource _dataSource;

  UserCartRepositoryImpl(this._dataSource);

  @override
  Future<List<TestMealModel>> getCart() async {
    try {
      final cart = await _dataSource.getUserCart('');
      return cart;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updateCart(List<TestMealModel> cart, String uid) async {
    try {
      await _dataSource.updateUserCart(uid, cart);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> clearCart() async {
    // Implementation needed
    throw UnimplementedError();
  }
}

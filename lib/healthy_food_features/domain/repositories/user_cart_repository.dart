import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/entities/meal_cart_model.dart';
import 'package:kamn/core/error/failures.dart';
import 'package:kamn/healthy_food_features/data/data_sources/user_cart_data_source.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

import '../../../core/erorr/faliure.dart';
import '../../../core/utils/try_and_catch.dart';

abstract class UserCartRepository {
  Future<List<TestMealModel>> getCart();
  Future<void> updateCart(List<TestMealModel> cart, String uid);
  Future<void> clearCart();
  double getCartTotal(List<MealCartModel> cartItems);
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

  @override
  double getCartTotal(List<MealCartModel> cartItems) {
    double total = 0.0;

    for (var item in cartItems) {
      total += (item.price ?? 0) * (item.quantity ?? 0);
    }

    return total;
  }
}

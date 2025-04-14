import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/common/entities/meal_cart_model.dart';
import 'package:kamn/healthy_food_features/data/data_sources/user_cart_data_source.dart';
import 'package:kamn/healthy_food_features/domain/repositories/user_cart_repository.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

import '../../../core/erorr/faliure.dart';
import '../../../core/utils/try_and_catch.dart'
    show executeTryAndCatchForRepository;

class UserCartRepositoryImpl implements UserCartRepository {
  final UserCartDataSource _dataSource;

  UserCartRepositoryImpl({required UserCartDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<List<TestMealModel>> getCart() async {
    try {
      return await _dataSource.getUserCart('');
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
    try {
      await _dataSource.updateUserCart('', []);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  @override
  double getCartTotal(List<MealCartModel> cartItems) {
    double total = 0.0;

    for (var item in cartItems) {
      total += (item.price ?? 0) * (item.quantity ?? 0);
    }

    return total;
  }
}

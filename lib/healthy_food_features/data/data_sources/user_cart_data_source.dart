import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kamn/core/common/entities/meal_cart_model.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

abstract class UserCartDataSource {
  Future<List<TestMealModel>> getUserCart(String userId);
  Future<void> updateUserCart(String userId, List<TestMealModel> meals);
}

class UserCartDataSourceImpl implements UserCartDataSource {
  final FirebaseFirestore firestore;

  UserCartDataSourceImpl(this.firestore);

  Future<List<TestMealModel>> getUserCart(String userId) async {
    final doc = await firestore.collection('users').doc(userId).get();
    final data = doc.data();
    if (data == null || !data.containsKey('my_healthFood_cart')) {
      return [];
    }
    final cartData = data['my_healthFood_cart'] as List<dynamic>;
    return cartData.map((item) => TestMealModel.fromJson(item)).toList();
  }

  @override
  Future<void> updateUserCart(String userId, List<TestMealModel> meals) async {
    final userRef = firestore.collection('users').doc(userId);
    await userRef.update(
        {'my_healthFood_cart': meals.map((meal) => meal.toJson()).toList()});
  }

 

  // @override
  // Future<double> getTotalFromUserCart(String userId) async {
  //   try {
  //     final doc = await firestore.collection('users').doc(userId).get();
  //     final data = doc.data();

  //     if (data == null || !data.containsKey('my_healthFood_cart')) {
  //       return 0.0;
  //     }

  //     final cartData = data['my_healthFood_cart'] as List<dynamic>;

  //     double total = 0.0;
  //     for (var item in cartData) {
  //       final meal = MealCartModel.fromJson(item as Map<String, dynamic>);
  //       total += meal.price * meal.quantity;
  //     }

  //     return total;
  //   } catch (e) {
  //     print('Error fetching user cart total: $e');
  //     return 0.0;
  //   }
  // }
}

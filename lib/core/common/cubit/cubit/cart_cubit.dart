import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/cubit/cubit/cart_state.dart';
import 'package:kamn/core/common/entities/meal_cart_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cartView: [], total: 0.0));

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<double> getTotalFromUserCart(String userId) async {
    try {
      final doc = await firestore.collection('users').doc(userId).get();
      final data = doc.data();

      if (data == null || !data.containsKey('my_healthFood_cart')) {
        return 0.0;
      }

      final cartData = data['my_healthFood_cart'] as List<dynamic>;

      double total = 0.0;
      for (var item in cartData) {
        final meal = MealCartModel.fromJson(item as Map<String, dynamic>);
        total += meal.price * meal.quantity;
      }

      return total;
    } catch (e) {
      print('Error fetching user cart total: $e');
      return 0.0;
    }
  }
}

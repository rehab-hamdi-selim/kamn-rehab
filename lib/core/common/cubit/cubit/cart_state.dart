import 'package:kamn/core/common/entities/meal_cart_model.dart';

class CartState {
  final List<MealCartModel> cartView;
  final double total;

  CartState({
    required this.cartView,
    required this.total,
  });

  CartState copyWith({
    List<MealCartModel>? cartView,
    double? total,
  }) {
    return CartState(
      cartView: cartView ?? this.cartView,
      total: total ?? this.total,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/entities/meal_cart_model.dart';
import 'package:kamn/healthy_food_features/data/models/order_model.dart';
import 'package:kamn/healthy_food_features/data/repositories/order_repo.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository repository;

  OrderCubit(this.repository) : super(OrderInitial());

  Future<void> createOrder({
    required List<MealCartModel> cartItems,
    required String userId,
  }) async {
    emit(OrderLoading());

    try {
      await repository.createOrder(cartItems: cartItems, userId: userId);
      emit(OrderSuccess());
    } catch (e) {
      emit(OrderFailure(e.toString()));
    }
  }

  Future<void> fetchOrders(String userId) async {
    emit(OrderLoading());
    try {
      final orders = await repository.fetchOrders(userId);
      emit(OrderLoaded(orders));
    } catch (e) {
      emit(OrderFailure(e.toString()));
    }
  }
}

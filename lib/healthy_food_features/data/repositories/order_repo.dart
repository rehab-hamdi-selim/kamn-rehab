import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kamn/core/common/entities/meal_cart_model.dart';
import 'package:kamn/healthy_food_features/data/models/order_model.dart';

abstract class OrderRepository {
  Future<void> createOrder({
    required List<MealCartModel> cartItems,
    required String userId,
  });
  Future<List<OrderModel>> fetchOrders(String userId);
  Future<OrderModel> fetchOrderById(String orderId);
  Future<void> sendMessage({
    required String orderId,
    required String senderId,
    required String receiverId,
    required String text,
  });
  Stream<List<Map<String, dynamic>>> messageStream(String orderId);
}

class OrderRepositoryImpl implements OrderRepository {
  final FirebaseFirestore firestore;

  OrderRepositoryImpl({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createOrder({
    required List<MealCartModel> cartItems,
    required String userId,
  }) async {
    final orderId = firestore.collection('orders').doc().id;

    final newOrder = OrderModel(
      orderId: orderId,
      userId: userId,
      status: 'Pending',
      meals: cartItems,
      total: 100.0,
      createdAt: DateTime.now(),
    );

    await firestore.collection('orders').doc(orderId).set(newOrder.toJson());
  }

  @override
  Future<List<OrderModel>> fetchOrders(String userId) async {
    final snapshot = await firestore
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) => OrderModel.fromJson(doc.data())).toList();
  }

  @override
  Future<OrderModel> fetchOrderById(String orderId) async {
    final doc = await FirebaseFirestore.instance
        .collection('orders')
        .doc(orderId)
        .get();

    if (doc.exists) {
      return OrderModel.fromFirestore(doc);
    } else {
      throw Exception('Order not found');
    }
  }

  @override
  Future<void> sendMessage(
      {required String orderId,
      required String senderId,
      required String receiverId,
      required String text}) async {
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(orderId)
        .collection('messages')
        .add({
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Stream<List<Map<String, dynamic>>> messageStream(String orderId) {
    return FirebaseFirestore.instance
        .collection('orders')
        .doc(orderId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}

class DeliveryModel {
  bool isDelivery = false;
  bool isPickup = false;
  double? deliveryFee = 0.0;

  DeliveryModel({
    this.deliveryFee,
    required this.isDelivery,
    required this.isPickup,
  });

  // Convert to Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'isDelivery': isDelivery,
      'isPickup': isPickup,
      'deliveryFee': deliveryFee,
    };
  }

  // Create object from Firebase snapshot
  factory DeliveryModel.fromMap(Map<String, dynamic> map) {
    return DeliveryModel(
      deliveryFee: map['deliveryFee']?.toDouble(),
      isDelivery: map['isDelivery'] ?? false,
      isPickup: map['isPickup'] ?? false,
    );
  }
}

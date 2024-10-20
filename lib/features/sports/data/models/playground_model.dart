// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlaygroundModel {
  final String name;
  final String address;
  final double price;

  PlaygroundModel({
    required this.name,
    required this.address,
    required this.price,
  });

  PlaygroundModel copyWith({
    String? name,
    String? address,
    double? price,
  }) {
    return PlaygroundModel(
      name: name ?? this.name,
      address: address ?? this.address,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
      'price': price,
    };
  }

  factory PlaygroundModel.fromMap(Map<String, dynamic> map) {
    return PlaygroundModel(
      name: map['name'] as String? ?? 'Unknown',
      address: map['address'] as String? ?? 'No address provided',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaygroundModel.fromJson(String source) =>
      PlaygroundModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PlaygroundModel(name: $name, address: $address, price: $price)';

  @override
  bool operator ==(covariant PlaygroundModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.address == address &&
        other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ address.hashCode ^ price.hashCode;
}

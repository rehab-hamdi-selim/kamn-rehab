import 'dart:convert';

import 'package:flutter/foundation.dart';

class PlaygroundModel {
  String? playgroundId;
  String name;
  double longitude;
  double latitude;
  String ownerId;
  String address;
  String status;
  double rating;
  double price;
  String description;
  List<String> images;
  int size;
  String govenrate;

  PlaygroundModel({
    this.playgroundId,
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.ownerId,
    required this.address,
    required this.status,
    required this.rating,
    required this.price,
    required this.description,
    required this.images,
    required this.size,
    required this.govenrate,
  });

  Map<String, dynamic> toMap() {
    return {
      'playgroundId': playgroundId,
      'name': name,
      'longitude': longitude,
      'latitude': latitude,
      'ownerId': ownerId,
      'address': address,
      'status': status,
      'rating': rating,
      'price': price,
      'description': description,
      'images': images,
      'size': size,
      'govenrate': govenrate,
    };
  }

  factory PlaygroundModel.fromMap(Map<String, dynamic> map) {
    return PlaygroundModel(
      playgroundId: map['playgroundId'] ?? '',
      name: map['name'] ?? '',
      longitude: map['longitude']?.toDouble() ?? 0.0,
      latitude: map['latitude']?.toDouble() ?? 0.0,
      ownerId: map['ownerId'] ?? '',
      address: map['address'] ?? '',
      status: map['status'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
      images: List<String>.from(map['images']),
      size: map['size']?.toInt() ?? 0,
      govenrate: map['govenrate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaygroundModel.fromJson(String source) =>
      PlaygroundModel.fromMap(json.decode(source));

  PlaygroundModel copyWith({
    String? playgroundId,
    String? name,
    double? longitude,
    double? latitude,
    String? ownerId,
    String? address,
    String? status,
    double? rating,
    double? price,
    String? description,
    List<String>? images,
    int? size,
    String? govenrate,
  }) {
    return PlaygroundModel(
      playgroundId: playgroundId ?? this.playgroundId,
      name: name ?? this.name,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      ownerId: ownerId ?? this.ownerId,
      address: address ?? this.address,
      status: status ?? this.status,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      description: description ?? this.description,
      images: images ?? this.images,
      size: size ?? this.size,
      govenrate: govenrate ?? this.govenrate,
    );
  }

  @override
  String toString() {
    return 'PlaygroundModel(playgroundId: $playgroundId, name: $name, longitude: $longitude, latitude: $latitude, ownerId: $ownerId, address: $address, status: $status, rating: $rating, price: $price, description: $description, images: $images, size: $size, govenrate: $govenrate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlaygroundModel &&
        other.playgroundId == playgroundId &&
        other.name == name &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.ownerId == ownerId &&
        other.address == address &&
        other.status == status &&
        other.rating == rating &&
        other.price == price &&
        other.description == description &&
        listEquals(other.images, images) &&
        other.size == size &&
        other.govenrate == govenrate;
  }

  @override
  int get hashCode {
    return playgroundId.hashCode ^
        name.hashCode ^
        longitude.hashCode ^
        latitude.hashCode ^
        ownerId.hashCode ^
        address.hashCode ^
        status.hashCode ^
        rating.hashCode ^
        price.hashCode ^
        description.hashCode ^
        images.hashCode ^
        size.hashCode ^
        govenrate.hashCode;
  }
}

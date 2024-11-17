// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PlaygroundModel {
  final String name;
  final double longitude;
  final double latitude;
  final String address;
  final String description;
  final String govenrate;
  final String ownerId;
  String playgroundId;
  final String status;
  Map<String, String>? availableTime;
  int? peroid;

  final List images;
  final double price;
  final double rating;
  final double size;
  PlaygroundModel({
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.address,
    required this.description,
    required this.govenrate,
    required this.ownerId,
    required this.playgroundId,
    required this.status,
    this.availableTime,
    this.peroid,
    required this.images,
    required this.price,
    required this.rating,
    required this.size,
  });

  PlaygroundModel copyWith({
    String? name,
    double? longitude,
    double? latitude,
    String? address,
    String? description,
    String? govenrate,
    String? ownerId,
    String? playgroundId,
    String? status,
    ValueGetter<Map<String, String>?>? availableTime,
    ValueGetter<int?>? peroid,
    List? images,
    double? price,
    double? rating,
    double? size,
  }) {
    return PlaygroundModel(
      name: name ?? this.name,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      address: address ?? this.address,
      description: description ?? this.description,
      govenrate: govenrate ?? this.govenrate,
      ownerId: ownerId ?? this.ownerId,
      playgroundId: playgroundId ?? this.playgroundId,
      status: status ?? this.status,
      availableTime:
          availableTime != null ? availableTime() : this.availableTime,
      peroid: peroid != null ? peroid() : this.peroid,
      images: images ?? this.images,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'longitude': longitude,
      'latitude': latitude,
      'address': address,
      'description': description,
      'govenrate': govenrate,
      'ownerId': ownerId,
      'playgroundId': playgroundId,
      'status': status,
      'available_time': availableTime,
      'peroid': peroid,
      'images': images,
      'price': price,
      'rating': rating,
      'size': size,
    };
  }

  factory PlaygroundModel.fromMap(Map<String, dynamic> map) {
    return PlaygroundModel(
      name: map['name'] ?? '',
      longitude: map['longitude']?.toDouble() ?? 0.0,
      latitude: map['latitude']?.toDouble() ?? 0.0,
      address: map['address'] ?? '',
      description: map['description'] ?? '',
      govenrate: map['govenrate'] ?? '',
      ownerId: map['ownerId'] ?? '',
      playgroundId: map['playgroundId'] ?? '',
      status: map['status'] ?? '',
      availableTime: Map<String, String>.from(map['available_time'] ?? {}),
      peroid: map['peroid']?.toInt(),
      images: List.from(map['images']),
      price: map['price']?.toDouble() ?? 0.0,
      rating: map['rating']?.toDouble() ?? 0.0,
      size: map['size']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaygroundModel.fromJson(String source) =>
      PlaygroundModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlaygroundModel(name: $name, longitude: $longitude, latitude: $latitude, address: $address, description: $description, govenrate: $govenrate, ownerId: $ownerId, playgroundId: $playgroundId, status: $status, availableTime: $availableTime, peroid: $peroid, images: $images, price: $price, rating: $rating, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlaygroundModel &&
        other.name == name &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.address == address &&
        other.description == description &&
        other.govenrate == govenrate &&
        other.ownerId == ownerId &&
        other.playgroundId == playgroundId &&
        other.status == status &&
        mapEquals(other.availableTime, availableTime) &&
        other.peroid == peroid &&
        listEquals(other.images, images) &&
        other.price == price &&
        other.rating == rating &&
        other.size == size;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        longitude.hashCode ^
        latitude.hashCode ^
        address.hashCode ^
        description.hashCode ^
        govenrate.hashCode ^
        ownerId.hashCode ^
        playgroundId.hashCode ^
        status.hashCode ^
        availableTime.hashCode ^
        peroid.hashCode ^
        images.hashCode ^
        price.hashCode ^
        rating.hashCode ^
        size.hashCode;
  }
}

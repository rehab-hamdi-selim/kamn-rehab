// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PlaygroundModel {
  final String? name;
  final double? longitude;
  final double? latitude;
  final String? address;
  final String? description;
  final String? govenrate;
  final String? ownerId;
  String? playgroundId;
  final String? status;
  Map<dynamic, dynamic>? availableTime;
  num? peroid;
  final List? images;
  final num? price;
  final num? rating;
  final num? size;
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
    ValueGetter<Map<String, List<DateTime>?>?>? availableTime,
    ValueGetter<num?>? peroid,
    List? images,
    num? price,
    num? rating,
    num? size,
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
      'images': images,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'rating': rating,
      'description': description,
      'ownerId': ownerId,
      'peroid': peroid,
      'govenrate': govenrate,
      'available_time': availableTime?.map(
        (key, dateTimeList) => MapEntry(
          key,
          dateTimeList
              ?.map((dateTime) => dateTime.millisecondsSinceEpoch)
              .toList(),
        ),
      ),
      'size': size,
      'price': price,
      'name': name,
      'playgroundId': playgroundId,
      'status': status,
    };
  }

  factory PlaygroundModel.fromMap(Map<String, dynamic> map) {
    return PlaygroundModel(
      images: List<String>.from(map['images'] ?? []),
      address: map['address'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      rating: map['rating']?.toDouble() ?? 0,
      description: map['description'] ?? '',
      ownerId: map['ownerId'] ?? '',
      peroid: map['peroid'] ?? 0,
      govenrate: map['govenrate'] ?? '',
      availableTime: map['available_time'] != null
          ? (map['available_time'])?.map(
              (key, list) => MapEntry(
                key,
                (list as List<dynamic>)
                    .map((millis) =>
                        DateTime.fromMillisecondsSinceEpoch(millis as int))
                    .toList(),
              ),
            )
          : null,
      size: map['size'] ?? 0,
      price: map['price'] ?? 0,
      name: map['name'] ?? '',
      playgroundId: map['playgroundId'] ?? '',
      status: map['status'] ?? '',
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

class Intervals {
  String date;
  String status;
  Intervals({
    required this.date,
    required this.status,
  });

  Intervals copyWith({
    String? date,
    String? status,
  }) {
    return Intervals(
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'status': status,
    };
  }

  factory Intervals.fromMap(Map<String, dynamic> map) {
    return Intervals(
      date: map['date'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Intervals.fromJson(String source) =>
      Intervals.fromMap(json.decode(source));

  @override
  String toString() => 'Intervals(date: $date, status: $status)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Intervals && other.date == date && other.status == status;
  }

  @override
  int get hashCode => date.hashCode ^ status.hashCode;
}

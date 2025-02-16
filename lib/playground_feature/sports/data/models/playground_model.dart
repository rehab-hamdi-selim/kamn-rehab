// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:kamn/core/common/entities/user_model.dart';
import 'package:kamn/playground_feature/sports_service_providers/data/model/playground_request_model.dart';
extension PlaygroundExtension on PlaygroundModel{
double get ratings => (rating?.reduce((a, b) => a + b) ?? 0) / (rating?.length ?? 1);}
class PlaygroundModel {
  String? playgroundId;
  String? playgroundName;
  String? phone;
  double? longitude;
  double? latitude;
  String? ownerId; //get from user credential
  String? address;
  String? status; // need to handel
  List<double>? rating; //calcolute from developer
  double? price; // need to handel  /*
  String? description; // need to handel /*
  List<String>? groundImages;
  List<String>? ownershipImages;
  int? size;
  AvailableTime? availableTime;
  num? period;
  String? govenrate;
  String? type;
  UserModel? owner;
  PlaygroundModel({
    this.playgroundId,
    this.playgroundName,
    this.phone,
    this.longitude,
    this.latitude,
    this.ownerId,
    this.address,
    this.status,
    this.rating,
    this.price,
    this.description,
    this.groundImages,
    this.ownershipImages,
    this.size,
    this.availableTime,
    this.period,
    this.govenrate,
    this.type,
    this.owner,
  });

  PlaygroundModel copyWith({
    ValueGetter<String?>? playgroundId,
    ValueGetter<String?>? name,
    ValueGetter<String?>? phone,
    ValueGetter<double?>? longitude,
    ValueGetter<double?>? latitude,
    ValueGetter<String?>? ownerId,
    ValueGetter<String?>? address,
    ValueGetter<String?>? status,
    ValueGetter<List<double>?>? rating,
    ValueGetter<double?>? price,
    ValueGetter<String?>? description,
    ValueGetter<List<String>?>? groundImages,
    ValueGetter<List<String>?>? ownershipImages,
    ValueGetter<int?>? size,
    ValueGetter<AvailableTime?>? availableTime,
    ValueGetter<num?>? period,
    ValueGetter<String?>? govenrate,
    ValueGetter<String?>? type,
    ValueGetter<UserModel?>? owner,
  }) {
    return PlaygroundModel(
      playgroundId: playgroundId != null ? playgroundId() : this.playgroundId,
      playgroundName: name != null ? name() : playgroundName,
      phone: phone != null ? phone() : this.phone,
      longitude: longitude != null ? longitude() : this.longitude,
      latitude: latitude != null ? latitude() : this.latitude,
      ownerId: ownerId != null ? ownerId() : this.ownerId,
      address: address != null ? address() : this.address,
      status: status != null ? status() : this.status,
      rating: rating != null ? rating() : this.rating,
      price: price != null ? price() : this.price,
      description: description != null ? description() : this.description,
      groundImages: groundImages != null ? groundImages() : this.groundImages,
      ownershipImages:
          ownershipImages != null ? ownershipImages() : this.ownershipImages,
      size: size != null ? size() : this.size,
      availableTime:
          availableTime != null ? availableTime() : this.availableTime,
      period: period != null ? period() : this.period,
      govenrate: govenrate != null ? govenrate() : this.govenrate,
      type: type != null ? type() : this.type,
      owner: owner != null ? owner() : this.owner,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'playgroundId': playgroundId,
      'name': playgroundName,
      'phone': phone,
      'longitude': longitude,
      'latitude': latitude,
      'ownerId': ownerId,
      'address': address,
      'status': status,
      'rating': rating,
      'price': price,
      'description': description,
      'groundImages': groundImages,
      'ownershipImages': ownershipImages,
      'size': size,
      'availableTime': availableTime?.toMap(),
      'period': period,
      'govenrate': govenrate,
      'type': type,
      'owner': owner?.toMap(),
    };
  }

  factory PlaygroundModel.fromMap(Map<String, dynamic> map) {
    return PlaygroundModel(
      playgroundId: map['playgroundId'],
      playgroundName: map['name'],
      phone: map['phone'],
      longitude: map['longitude']?.toDouble(),
      latitude: map['latitude']?.toDouble(),
      ownerId: map['ownerId'],
      address: map['address'],
      status: map['status'],
      rating: map['rating'] != null
          ? List<double>.from(map['rating'].map((x) => x.toDouble()))
          : null,
      price: map['price']?.toDouble(),
      description: map['description'],
      groundImages: List<String>.from(map['groundImages']),
      ownershipImages: List<String>.from(map['ownershipImages']),
      size: map['size']?.toInt(),
      availableTime: map['availableTime'] != null
          ? AvailableTime.fromMap(map['availableTime'])
          : null,
      period: map['period'],
      govenrate: map['govenrate'],
      type: map['type'],
      owner: map['owner'] != null ? UserModel.fromMap(map['owner']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaygroundModel.fromJson(String source) =>
      PlaygroundModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlaygroundModel(playgroundId: $playgroundId, name: $playgroundName, phone: $phone, longitude: $longitude, latitude: $latitude, ownerId: $ownerId, address: $address, status: $status, rating: $rating, price: $price, description: $description, groundImages: $groundImages, ownershipImages: $ownershipImages, size: $size, availableTime: $availableTime, period: $period, govenrate: $govenrate, type: $type, owner: $owner)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is PlaygroundModel &&
        other.playgroundId == playgroundId &&
        other.playgroundName == playgroundName &&
        other.phone == phone &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.ownerId == ownerId &&
        other.address == address &&
        other.status == status &&
        other.rating == rating &&
        other.price == price &&
        other.description == description &&
        listEquals(other.groundImages, groundImages) &&
        listEquals(other.ownershipImages, ownershipImages) &&
        other.size == size &&
        other.availableTime == availableTime &&
        other.period == period &&
        other.govenrate == govenrate &&
        other.type == type &&
        other.owner == owner;
  }

  @override
  int get hashCode {
    return playgroundId.hashCode ^
        playgroundName.hashCode ^
        phone.hashCode ^
        longitude.hashCode ^
        latitude.hashCode ^
        ownerId.hashCode ^
        address.hashCode ^
        status.hashCode ^
        rating.hashCode ^
        price.hashCode ^
        description.hashCode ^
        groundImages.hashCode ^
        ownershipImages.hashCode ^
        size.hashCode ^
        availableTime.hashCode ^
        period.hashCode ^
        govenrate.hashCode ^
        type.hashCode ^
        owner.hashCode;
  }
}

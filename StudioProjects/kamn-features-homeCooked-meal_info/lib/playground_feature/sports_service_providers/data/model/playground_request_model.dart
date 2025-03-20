import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'package:kamn/core/common/entities/user_model.dart';

class PlaygroundRequestModel {
  String? playgroundId;
  String? playgroundName;
  String? phone;
  double? longitude;
  double? latitude;
  String? address;
  String? status; // need to handel
  double? rating; //calcolute from developer
  double? price; // need to handel  /*
  String? description; // need to handel /*
  List<String>? groundImages;
  List<String>? ownershipImages;
  int? size;
  AvailableTime? availableTime;
  num? period;
  String? govenrate;
  String? accpetingState;
  String? comment;
  String? type;
  UserModel? owner;
  PlaygroundRequestModel({
    this.playgroundId,
    this.playgroundName,
    this.phone,
    this.longitude,
    this.latitude,
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
    this.accpetingState,
    this.comment,
    this.type,
    this.owner,
  });

  PlaygroundRequestModel copyWith({
    ValueGetter<String?>? playgroundId,
    ValueGetter<String?>? name,
    ValueGetter<String?>? phone,
    ValueGetter<double?>? longitude,
    ValueGetter<double?>? latitude,
    ValueGetter<String?>? address,
    ValueGetter<String?>? status,
    ValueGetter<double?>? rating,
    ValueGetter<double?>? price,
    ValueGetter<String?>? description,
    ValueGetter<List<String>?>? groundImages,
    ValueGetter<List<String>?>? ownershipImages,
    ValueGetter<int?>? size,
    ValueGetter<AvailableTime?>? availableTime,
    ValueGetter<num?>? period,
    ValueGetter<String?>? govenrate,
    ValueGetter<String?>? accpetingState,
    ValueGetter<String?>? comment,
    ValueGetter<String?>? type,
    ValueGetter<UserModel?>? owner,
  }) {
    return PlaygroundRequestModel(
      playgroundId: playgroundId != null ? playgroundId() : this.playgroundId,
      playgroundName: name != null ? name() : playgroundName,
      phone: phone != null ? phone() : this.phone,
      longitude: longitude != null ? longitude() : this.longitude,
      latitude: latitude != null ? latitude() : this.latitude,
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
      accpetingState:
          accpetingState != null ? accpetingState() : this.accpetingState,
      comment: comment != null ? comment() : this.comment,
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
      'accpetingState': accpetingState,
      'comment': comment,
      'type': type,
      'owner': owner?.toMap(),
    };
  }

  factory PlaygroundRequestModel.fromMap(Map<String, dynamic> map) {
    return PlaygroundRequestModel(
      playgroundId: map['playgroundId'],
      playgroundName: map['name'],
      phone: map['phone'],
      longitude: map['longitude']?.toDouble(),
      latitude: map['latitude']?.toDouble(),
      address: map['address'],
      status: map['status'],
      rating: map['rating']?.toDouble(),
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
      accpetingState: map['accpetingState'],
      comment: map['comment'],
      type: map['type'],
      owner: map['owner'] != null ? UserModel.fromMap(map['owner']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaygroundRequestModel.fromJson(String source) =>
      PlaygroundRequestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlaygroundRequestModel(playgroundId: $playgroundId, name: $playgroundName, phone: $phone, longitude: $longitude, latitude: $latitude, address: $address, status: $status, rating: $rating, price: $price, description: $description, groundImages: $groundImages, ownershipImages: $ownershipImages, size: $size, availableTime: $availableTime, period: $period, govenrate: $govenrate, accpetingState: $accpetingState, comment: $comment, type: $type, owner: $owner)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is PlaygroundRequestModel &&
        other.playgroundId == playgroundId &&
        other.playgroundName == playgroundName &&
        other.phone == phone &&
        other.longitude == longitude &&
        other.latitude == latitude &&
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
        other.accpetingState == accpetingState &&
        other.comment == comment &&
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
        accpetingState.hashCode ^
        comment.hashCode ^
        type.hashCode ^
        owner.hashCode;
  }
}

class AvailableTime {
  Map<String, List<DateTime>>? data;
  AvailableTime({
    this.data,
  });

  AvailableTime copyWith({
    ValueGetter<Map<String, List<DateTime>>?>? data,
  }) {
    return AvailableTime(
      data: data != null ? data() : this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return data!.map(
      (key, dateTimeList) => MapEntry(
        key,
        dateTimeList
            .map((dateTime) => dateTime.millisecondsSinceEpoch)
            .toList(),
      ),
    );
  }

  factory AvailableTime.fromMap(Map<String, dynamic> map) {
    return AvailableTime(
        data: map.map(
      (key, list) => MapEntry(
        key,
        (list as List<dynamic>)
            .map((millis) => DateTime.fromMillisecondsSinceEpoch(millis as int))
            .toList(),
      ),
    ));
  }

  String toJson() => json.encode(toMap());

  factory AvailableTime.fromJson(String source) =>
      AvailableTime.fromMap(json.decode(source));

  @override
  String toString() => 'AvailableTime(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AvailableTime && mapEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}

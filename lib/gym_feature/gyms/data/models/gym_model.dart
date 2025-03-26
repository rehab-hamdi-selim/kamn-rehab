// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kamn/gym_feature/add_gym/data/models/gym_request_model.dart';

class GymModel {
  final String? id;
  final String? name;
  final String? uniqueName;
  final String? address;
  final List<String>? imageUrl;
  final String? logoUrl;
  final String? description;
  final String? phoneNumber;
  final List<double>? ratings;
  final List<String>? reviews;
  final List<Plan>? offers;
  final List<ScoialMediaLink>? scoialMediaLinks;
  final List<Feature>? features;
  final List<OpenDuration>? openDuration;
  final bool? isFullTimeAccess;
  final String? userId;
  GymModel({
    this.id,
    this.name,
    this.uniqueName,
    this.address,
    this.imageUrl,
    this.logoUrl,
    this.description,
    this.phoneNumber,
    this.ratings,
    this.reviews,
    this.offers,
    this.scoialMediaLinks,
    this.features,
    this.openDuration,
    this.isFullTimeAccess,
    this.userId,
  });

  GymModel copyWith({
    String? id,
    String? name,
    String? uniqueName,
    String? address,
    List<String>? imageUrl,
    String? logoUrl,
    String? description,
    String? phoneNumber,
    List<double>? ratings,
    List<String>? reviews,
    List<Plan>? offers,
    List<ScoialMediaLink>? scoialMediaLinks,
    List<Feature>? features,
    List<OpenDuration>? openDuration,
    bool? isFullTimeAccess,
    String? userId,
  }) {
    return GymModel(
      id: id ?? this.id,
      name: name ?? this.name,
      uniqueName: uniqueName ?? this.uniqueName,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
      logoUrl: logoUrl ?? this.logoUrl,
      description: description ?? this.description,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      ratings: ratings ?? this.ratings,
      reviews: reviews ?? this.reviews,
      offers: offers ?? this.offers,
      scoialMediaLinks: scoialMediaLinks ?? this.scoialMediaLinks,
      features: features ?? this.features,
      openDuration: openDuration ?? this.openDuration,
      isFullTimeAccess: isFullTimeAccess ?? this.isFullTimeAccess,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'uniqueName': uniqueName,
      'address': address,
      'imageUrl': imageUrl,
      'logoUrl': logoUrl,
      'description': description,
      'phoneNumber': phoneNumber,
      'ratings': ratings,
      'reviews': reviews,
      'offers': offers?.map((x) => x.toMap()).toList(),
      'scoialMediaLinks': scoialMediaLinks?.map((x) => x.toMap()).toList(),
      'features': features?.map((x) => x.toMap()).toList(),
      'openDuration': openDuration?.map((x) => x.toMap()).toList(),
      'isFullTimeAccess': isFullTimeAccess,
      'userId': userId,
    };
  }

  factory GymModel.fromMap(Map<String, dynamic> map) {
    return GymModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      uniqueName:
          map['uniqueName'] != null ? map['uniqueName'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      imageUrl: map['imageUrl'] != null
          ? List<String>.from((map['imageUrl'] as List<String>))
          : null,
      logoUrl: map['logoUrl'] != null ? map['logoUrl'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      ratings: map['ratings'] != null
          ? List<double>.from((map['ratings'] as List<double>))
          : null,
      reviews: map['reviews'] != null
          ? List<String>.from((map['reviews'] as List<String>))
          : null,
      offers: map['offers'] != null
          ? List<Plan>.from(
              (map['offers'] as List<int>).map<Plan?>(
                (x) => Plan.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      scoialMediaLinks: map['scoialMediaLinks'] != null
          ? List<ScoialMediaLink>.from(
              (map['scoialMediaLinks'] as List<int>).map<ScoialMediaLink?>(
                (x) => ScoialMediaLink.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      features: map['features'] != null
          ? List<Feature>.from(
              (map['features'] as List<int>).map<Feature?>(
                (x) => Feature.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      openDuration: map['openDuration'] != null
          ? List<OpenDuration>.from(
              (map['openDuration'] as List<int>).map<OpenDuration?>(
                (x) => OpenDuration.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      isFullTimeAccess: map['isFullTimeAccess'] != null
          ? map['isFullTimeAccess'] as bool
          : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GymModel.fromJson(String source) =>
      GymModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GymModel(id: $id, name: $name, uniqueName: $uniqueName, address: $address, imageUrl: $imageUrl, logoUrl: $logoUrl, description: $description, phoneNumber: $phoneNumber, ratings: $ratings, reviews: $reviews, offers: $offers, scoialMediaLinks: $scoialMediaLinks, features: $features, openDuration: $openDuration, isFullTimeAccess: $isFullTimeAccess, userId: $userId)';
  }

  @override
  bool operator ==(covariant GymModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.uniqueName == uniqueName &&
        other.address == address &&
        listEquals(other.imageUrl, imageUrl) &&
        other.logoUrl == logoUrl &&
        other.description == description &&
        other.phoneNumber == phoneNumber &&
        listEquals(other.ratings, ratings) &&
        listEquals(other.reviews, reviews) &&
        listEquals(other.offers, offers) &&
        listEquals(other.scoialMediaLinks, scoialMediaLinks) &&
        listEquals(other.features, features) &&
        listEquals(other.openDuration, openDuration) &&
        other.isFullTimeAccess == isFullTimeAccess &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        uniqueName.hashCode ^
        address.hashCode ^
        imageUrl.hashCode ^
        logoUrl.hashCode ^
        description.hashCode ^
        phoneNumber.hashCode ^
        ratings.hashCode ^
        reviews.hashCode ^
        offers.hashCode ^
        scoialMediaLinks.hashCode ^
        features.hashCode ^
        openDuration.hashCode ^
        isFullTimeAccess.hashCode ^
        userId.hashCode;
  }
}

class Plan {
  final String? id;
  final String? name;
  final OfferType? type;
  final String? duration;
  final String? price;
  final int? freeMonths;
  final double? discountPercentage;
  final DiscountDuration? discountDuration;
  final String? notes;
  final List<OpenDuration>? openDuration;
  final bool? isFullTimeAccess;
  Plan({
    this.id,
    this.name,
    this.type,
    this.duration,
    this.price,
    this.freeMonths,
    this.discountPercentage,
    this.discountDuration,
    this.notes,
    this.openDuration,
    this.isFullTimeAccess,
  });

  Plan copyWith({
    String? id,
    String? name,
    OfferType? type,
    String? duration,
    String? price,
    int? freeMonths,
    double? discountPercentage,
    DiscountDuration? discountDuration,
    String? notes,
    List<OpenDuration>? openDuration,
    bool? isFullTimeAccess,
  }) {
    return Plan(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      freeMonths: freeMonths ?? this.freeMonths,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountDuration: discountDuration ?? this.discountDuration,
      notes: notes ?? this.notes,
      openDuration: openDuration ?? this.openDuration,
      isFullTimeAccess: isFullTimeAccess ?? this.isFullTimeAccess,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type?.name,
      'duration': duration,
      'price': price,
      'freeMonths': freeMonths,
      'discountPercentage': discountPercentage,
      'discountDuration': discountDuration?.toMap(),
      'notes': notes,
      'openDuration': openDuration?.map((x) => x.toMap()).toList(),
      'isFullTimeAccess': isFullTimeAccess,
    };
  }

  factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null
          ? OfferType.values.byName(map['type'] as String)
          : null,
      duration: map['duration'] != null ? map['duration'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      freeMonths: map['freeMonths'] != null ? map['freeMonths'] as int : null,
      discountPercentage: map['discountPercentage'] != null
          ? map['discountPercentage'] as double
          : null,
      discountDuration: map['discountDuration'] != null
          ? DiscountDuration.fromMap(
              map['discountDuration'] as Map<String, dynamic>)
          : null,
      notes: map['notes'] != null ? map['notes'] as String : null,
      openDuration: map['openDuration'] != null
          ? List<OpenDuration>.from(
              (map['openDuration'] as List<int>).map<OpenDuration?>(
                (x) => OpenDuration.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      isFullTimeAccess: map['isFullTimeAccess'] != null
          ? map['isFullTimeAccess'] as bool
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Plan.fromJson(String source) =>
      Plan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Plan(id: $id, name: $name, type: $type, duration: $duration, price: $price, freeMonths: $freeMonths, discountPercentage: $discountPercentage, discountDuration: $discountDuration, notes: $notes, openDuration: $openDuration, isFullTimeAccess: $isFullTimeAccess)';
  }

  @override
  bool operator ==(covariant Plan other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.type == type &&
        other.duration == duration &&
        other.price == price &&
        other.freeMonths == freeMonths &&
        other.discountPercentage == discountPercentage &&
        other.discountDuration == discountDuration &&
        other.notes == notes &&
        listEquals(other.openDuration, openDuration) &&
        other.isFullTimeAccess == isFullTimeAccess;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        duration.hashCode ^
        price.hashCode ^
        freeMonths.hashCode ^
        discountPercentage.hashCode ^
        discountDuration.hashCode ^
        notes.hashCode ^
        openDuration.hashCode ^
        isFullTimeAccess.hashCode;
  }
}

class Feature {
  final String? id;
  final String? name;
  final String? logoId;
  final String? price;
  final FeatureType? pricingOption;
  final String? description;
  Feature({
    this.id,
    this.name,
    this.logoId,
    this.price,
    this.pricingOption,
    this.description,
  });

  Feature copyWith({
    String? id,
    String? name,
    String? logoId,
    String? price,
    FeatureType? pricingOption,
    String? description,
  }) {
    return Feature(
      id: id ?? this.id,
      name: name ?? this.name,
      logoId: logoId ?? this.logoId,
      price: price ?? this.price,
      pricingOption: pricingOption ?? this.pricingOption,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'logoId': logoId,
      'price': price,
      'pricingOption': pricingOption?.name,
      'description': description,
    };
  }

  factory Feature.fromMap(Map<String, dynamic> map) {
    return Feature(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      logoId: map['logoId'] != null ? map['logoId'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      pricingOption: map['pricingOption'] != null
          ? FeatureType.values.byName(map['pricingOption'] as String)
          : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Feature.fromJson(String source) =>
      Feature.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Feature(id: $id, name: $name, logoId: $logoId, price: $price, pricingOption: $pricingOption, description: $description)';
  }

  @override
  bool operator ==(covariant Feature other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.logoId == logoId &&
        other.price == price &&
        other.pricingOption == pricingOption &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        logoId.hashCode ^
        price.hashCode ^
        pricingOption.hashCode ^
        description.hashCode;
  }
}

class OpenDuration {
  final String? id;
  final String? day;
  final String? startTime;
  final String? endTime;
  OpenDuration({
    this.id,
    this.day,
    this.startTime,
    this.endTime,
  });

  OpenDuration copyWith({
    String? id,
    String? day,
    String? startTime,
    String? endTime,
  }) {
    return OpenDuration(
      id: id ?? this.id,
      day: day ?? this.day,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory OpenDuration.fromMap(Map<String, dynamic> map) {
    return OpenDuration(
      id: map['id'] != null ? map['id'] as String : null,
      day: map['day'] != null ? map['day'] as String : null,
      startTime: map['startTime'] != null ? map['startTime'] as String : null,
      endTime: map['endTime'] != null ? map['endTime'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OpenDuration.fromJson(String source) =>
      OpenDuration.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OpenDuration(id: $id, day: $day, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(covariant OpenDuration other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.day == day &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^ day.hashCode ^ startTime.hashCode ^ endTime.hashCode;
  }
}

class DiscountDuration {
  final DateTime? start;
  final DateTime? end;
  DiscountDuration({
    this.start,
    this.end,
  });

  DiscountDuration copyWith({
    DateTime? start,
    DateTime? end,
  }) {
    return DiscountDuration(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'start': start?.millisecondsSinceEpoch,
      'end': end?.millisecondsSinceEpoch,
    };
  }

  factory DiscountDuration.fromMap(Map<String, dynamic> map) {
    return DiscountDuration(
      start: map['start'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['start'] as int)
          : null,
      end: map['end'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['end'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscountDuration.fromJson(String source) =>
      DiscountDuration.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DiscountDuration(start: $start, end: $end)';

  @override
  bool operator ==(covariant DiscountDuration other) {
    if (identical(this, other)) return true;

    return other.start == start && other.end == end;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}

enum OfferType { monthly, annual }

enum FeatureType {
  free,
  month,
  session,
}

class ScoialMediaLink {
  final String? name;
  final String? link;
  ScoialMediaLink({
    this.name,
    this.link,
  });
  ScoialMediaLink copyWith({
    String? name,
    String? link,
  }) {
    return ScoialMediaLink(
      name: name ?? this.name,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'link': link,
    };
  }

  factory ScoialMediaLink.fromMap(Map<String, dynamic> map) {
    return ScoialMediaLink(
      name: map['name'] != null ? map['name'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScoialMediaLink.fromJson(String source) =>
      ScoialMediaLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ScoialMediaLink(name: $name, link: $link)';

  @override
  bool operator ==(covariant ScoialMediaLink other) {
    if (identical(this, other)) return true;

    return other.name == name && other.link == link;
  }

  @override
  int get hashCode => name.hashCode ^ link.hashCode;
}


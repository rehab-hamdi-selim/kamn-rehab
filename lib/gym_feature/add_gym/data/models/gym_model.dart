// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

class GymRequestModel {
  final String? id;
  final String? name;
  final String? uniqueName;
  final String? address;
  final List<String>? imagesUrl;
  final String? logoUrl;
  final String? description;
  final String? phoneNumber;
  final String? contactNumber;
  final List<double>? ratings;
  final List<String>? reviews;
  final List<Plan>? offers;
  final List<ScoialMediaLink>? scoialMediaLinks;
  final List<Feature>? features;
  final List<OpenDuration>? openDuration;
  final bool? isFullTimeAccess;
  final String? userId;
  final String? operationLicenseImageUrl;
  final String? ownerIdPassportImageUrl;
  final String? ownershipContractImageUrl;
  final String? taxRegistrationImageUrl;
  GymRequestModel({
    this.id,
    this.name,
    this.uniqueName,
    this.address,
    this.imagesUrl,
    this.logoUrl,
    this.description,
    this.phoneNumber,
    this.contactNumber,
    this.ratings,
    this.reviews,
    this.offers,
    this.scoialMediaLinks,
    this.features,
    this.openDuration,
    this.isFullTimeAccess,
    this.userId,
    this.operationLicenseImageUrl,
    this.ownerIdPassportImageUrl,
    this.ownershipContractImageUrl,
    this.taxRegistrationImageUrl,
  });

  GymRequestModel copyWith({
    String? id,
    String? name,
    String? uniqueName,
    String? address,
    List<String>? imagesUrl,
    String? logoUrl,
    String? description,
    String? phoneNumber,
    String? contactNumber,
    List<double>? ratings,
    List<String>? reviews,
    List<Plan>? offers,
    List<ScoialMediaLink>? scoialMediaLinks,
    List<Feature>? features,
    List<OpenDuration>? openDuration,
    bool? isFullTimeAccess,
    String? userId,
    String? operationLicenseImageUrl,
    String? ownerIdPassportImageUrl,
    String? ownershipContractImageUrl,
    String? taxRegistrationImageUrl,
  }) {
    return GymRequestModel(
      id: id ?? this.id,
      name: name ?? this.name,
      uniqueName: uniqueName ?? this.uniqueName,
      address: address ?? this.address,
      imagesUrl: imagesUrl ?? this.imagesUrl,
      logoUrl: logoUrl ?? this.logoUrl,
      description: description ?? this.description,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      contactNumber: contactNumber ?? this.contactNumber,
      ratings: ratings ?? this.ratings,
      reviews: reviews ?? this.reviews,
      offers: offers ?? this.offers,
      scoialMediaLinks: scoialMediaLinks ?? this.scoialMediaLinks,
      features: features ?? this.features,
      openDuration: openDuration ?? this.openDuration,
      isFullTimeAccess: isFullTimeAccess ?? this.isFullTimeAccess,
      userId: userId ?? this.userId,
      operationLicenseImageUrl:
          operationLicenseImageUrl ?? this.operationLicenseImageUrl,
      ownerIdPassportImageUrl:
          ownerIdPassportImageUrl ?? this.ownerIdPassportImageUrl,
      ownershipContractImageUrl:
          ownershipContractImageUrl ?? this.ownershipContractImageUrl,
      taxRegistrationImageUrl:
          taxRegistrationImageUrl ?? this.taxRegistrationImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'uniqueName': uniqueName,
      'address': address,
      'imagesUrl': imagesUrl,
      'logoUrl': logoUrl,
      'description': description,
      'phoneNumber': phoneNumber,
      'contactNumber': contactNumber,
      'ratings': ratings,
      'reviews': reviews,
      'offers': offers?.map((x) => x.toMap()).toList(),
      'scoialMediaLinks': scoialMediaLinks?.map((x) => x.toMap()).toList(),
      'features': features?.map((x) => x.toMap()).toList(),
      'openDuration': openDuration?.map((x) => x.toMap()).toList(),
      'isFullTimeAccess': isFullTimeAccess,
      'userId': userId,
      'operationLicenseImageUrl': operationLicenseImageUrl,
      'ownerIdPassportImageUrl': ownerIdPassportImageUrl,
      'ownershipContractImageUrl': ownershipContractImageUrl,
      'taxRegistrationImageUrl': taxRegistrationImageUrl,
    };
  }

  factory GymRequestModel.fromMap(Map<String, dynamic> map) {
    return GymRequestModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      uniqueName:
          map['uniqueName'] != null ? map['uniqueName'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      imagesUrl: map['imagesUrl'] != null
          ? List<String>.from((map['imagesUrl'] as List<String>))
          : null,
      logoUrl: map['logoUrl'] != null ? map['logoUrl'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      contactNumber:
          map['contactNumber'] != null ? map['contactNumber'] as String : null,
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
      operationLicenseImageUrl: map['operationLicenseImageUrl'] != null
          ? map['operationLicenseImageUrl'] as String
          : null,
      ownerIdPassportImageUrl: map['ownerIdPassportImageUrl'] != null
          ? map['ownerIdPassportImageUrl'] as String
          : null,
      ownershipContractImageUrl: map['ownershipContractImageUrl'] != null
          ? map['ownershipContractImageUrl'] as String
          : null,
      taxRegistrationImageUrl: map['taxRegistrationImageUrl'] != null
          ? map['taxRegistrationImageUrl'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GymRequestModel.fromJson(String source) =>
      GymRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GymRequestModel(id: $id, name: $name, uniqueName: $uniqueName, address: $address, imagesUrl: $imagesUrl, logoUrl: $logoUrl, description: $description, phoneNumber: $phoneNumber, contactNumber: $contactNumber, ratings: $ratings, reviews: $reviews, offers: $offers, scoialMediaLinks: $scoialMediaLinks, features: $features, openDuration: $openDuration, isFullTimeAccess: $isFullTimeAccess, userId: $userId, operationLicenseImageUrl: $operationLicenseImageUrl, ownerIdPassportImageUrl: $ownerIdPassportImageUrl, ownershipContractImageUrl: $ownershipContractImageUrl, taxRegistrationImageUrl: $taxRegistrationImageUrl)';
  }

  @override
  bool operator ==(covariant GymRequestModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.uniqueName == uniqueName &&
        other.address == address &&
        listEquals(other.imagesUrl, imagesUrl) &&
        other.logoUrl == logoUrl &&
        other.description == description &&
        other.phoneNumber == phoneNumber &&
        other.contactNumber == contactNumber &&
        listEquals(other.ratings, ratings) &&
        listEquals(other.reviews, reviews) &&
        listEquals(other.offers, offers) &&
        listEquals(other.scoialMediaLinks, scoialMediaLinks) &&
        listEquals(other.features, features) &&
        listEquals(other.openDuration, openDuration) &&
        other.isFullTimeAccess == isFullTimeAccess &&
        other.userId == userId &&
        other.operationLicenseImageUrl == operationLicenseImageUrl &&
        other.ownerIdPassportImageUrl == ownerIdPassportImageUrl &&
        other.ownershipContractImageUrl == ownershipContractImageUrl &&
        other.taxRegistrationImageUrl == taxRegistrationImageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        uniqueName.hashCode ^
        address.hashCode ^
        imagesUrl.hashCode ^
        logoUrl.hashCode ^
        description.hashCode ^
        phoneNumber.hashCode ^
        contactNumber.hashCode ^
        ratings.hashCode ^
        reviews.hashCode ^
        offers.hashCode ^
        scoialMediaLinks.hashCode ^
        features.hashCode ^
        openDuration.hashCode ^
        isFullTimeAccess.hashCode ^
        userId.hashCode ^
        operationLicenseImageUrl.hashCode ^
        ownerIdPassportImageUrl.hashCode ^
        ownershipContractImageUrl.hashCode ^
        taxRegistrationImageUrl.hashCode;
  }
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


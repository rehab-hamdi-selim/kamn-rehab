// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kamn/core/common/entities/user_model.dart';
import 'package:kamn/home_cooked__features/data/models/delivery_model.dart';

import '../../../core/const/services_status_enum.dart';

enum CurrentStatus { PENDING, ACCEPTED, REJECTED }

class HomeCookModel {
  final String? id;
  final String? name;
  final String? address;
  final List<String>? imagesUrl;
  final String? logoUrl;
  final String? description;
  final String? phoneNumber;
  final ServicesStatusEnum? currentStatus;
  final String? contactNumber;
  final List<ScoialMediaLink>? scoialMediaLinks;
  final UserModel? user;
  final String? electricityBill;
  final String? gasBill;
  final String? landlineBill;
  final String? nationalIdFrontImageUrl;
  final String? nationalIdBackImageUrl;
  final String? comment;
  final String? homeAddress;
  final String? street;
  final String? buildingNumber;
  final String? apartment;
  final DeliveryModel? delivery;
  CurrentStatus? status;

  HomeCookModel({
    this.id,
    this.name,
    this.address,
    this.imagesUrl,
    this.logoUrl,
    this.description,
    this.phoneNumber,
    this.currentStatus,
    this.contactNumber,
    this.scoialMediaLinks,
    this.user,
    this.electricityBill,
    this.gasBill,
    this.landlineBill,
    this.nationalIdFrontImageUrl,
    this.nationalIdBackImageUrl,
    this.comment,
    this.homeAddress,
    this.street,
    this.buildingNumber,
    this.apartment,
    this.delivery,
    this.status = CurrentStatus.ACCEPTED, // ✅ optional
  });

  HomeCookModel copyWith({
    String? id,
    String? name,
    String? address,
    List<String>? imagesUrl,
    String? logoUrl,
    String? description,
    String? phoneNumber,
    ServicesStatusEnum? currentStatus,
    String? contactNumber,
    List<ScoialMediaLink>? scoialMediaLinks,
    UserModel? user,
    String? electricityBill,
    String? gasBill,
    String? landlineBill,
    String? nationalIdFrontImageUrl,
    String? nationalIdBackImageUrl,
    String? comment,
    String? homeAddress,
    String? street,
    String? buildingNumber,
    String? apartment,
    DeliveryModel? delivery,
    CurrentStatus? status,
  }) {
    return HomeCookModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      imagesUrl: imagesUrl ?? this.imagesUrl,
      logoUrl: logoUrl ?? this.logoUrl,
      description: description ?? this.description,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      currentStatus: currentStatus ?? this.currentStatus,
      contactNumber: contactNumber ?? this.contactNumber,
      scoialMediaLinks: scoialMediaLinks ?? this.scoialMediaLinks,
      user: user ?? this.user,
      electricityBill: electricityBill ?? this.electricityBill,
      gasBill: gasBill ?? this.gasBill,
      landlineBill: landlineBill ?? this.landlineBill,
      nationalIdFrontImageUrl:
          nationalIdFrontImageUrl ?? this.nationalIdFrontImageUrl,
      nationalIdBackImageUrl:
          nationalIdBackImageUrl ?? this.nationalIdBackImageUrl,
      comment: comment ?? this.comment,
      homeAddress: homeAddress ?? this.homeAddress,
      street: street ?? this.street,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      apartment: apartment ?? this.apartment,
      delivery: delivery ?? this.delivery,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    if (id != null) map['id'] = id;
    if (name != null) map['name'] = name;
    if (address != null) map['address'] = address;
    if (imagesUrl != null) map['imagesUrl'] = imagesUrl;
    if (logoUrl != null) map['logoUrl'] = logoUrl;
    if (description != null) map['description'] = description;
    if (phoneNumber != null) map['phoneNumber'] = phoneNumber;
    if (currentStatus != null) map['currentStatus'] = currentStatus?.name;
    if (contactNumber != null) map['contactNumber'] = contactNumber;
    if (scoialMediaLinks != null)
      map['scoialMediaLinks'] =
          scoialMediaLinks?.map((x) => x.toMap()).toList();
    if (user != null) map['user'] = user?.toMap();
    if (electricityBill != null) map['electricityBill'] = electricityBill;
    if (gasBill != null) map['gasBill'] = gasBill;
    if (landlineBill != null) map['landlineBill'] = landlineBill;
    if (nationalIdFrontImageUrl != null)
      map['nationalIdFrontImageUrl'] = nationalIdFrontImageUrl;
    if (nationalIdBackImageUrl != null)
      map['nationalIdBackImageUrl'] = nationalIdBackImageUrl;
    if (comment != null) map['comment'] = comment;
    if (homeAddress != null) map['homeAddress'] = homeAddress;
    if (street != null) map['street'] = street;
    if (buildingNumber != null) map['buildingNumber'] = buildingNumber;
    if (apartment != null) map['apartment'] = apartment;
    if (delivery != null) map['delivery'] = delivery?.toMap();
    if (status != null)
      map['status'] =
          status.toString().split('.').last; // تحويل الـ enum إلى String
    return map;
  }

  factory HomeCookModel.fromMap(Map<String, dynamic> map) {
    return HomeCookModel(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      address: map['address'] as String? ?? '',
      imagesUrl: map['imagesUrl'] != null
          ? List<String>.from(
              (map['imagesUrl'] as List).map((e) => e.toString()))
          : [],
      logoUrl: map['logoUrl'] as String? ?? '',
      description: map['description'] as String? ?? '',
      phoneNumber: map['phoneNumber'] as String? ?? '',
      currentStatus: map['currentStatus'] != null
          ? ServicesStatusEnum.values.byName(map['currentStatus'] as String)
          : ServicesStatusEnum.pending,
      contactNumber: map['contactNumber'] as String? ?? '',
      scoialMediaLinks: map['scoialMediaLinks'] != null
          ? List<ScoialMediaLink>.from(
              (map['scoialMediaLinks'] as List).map<ScoialMediaLink>(
                (x) => ScoialMediaLink.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      user: map['user'] != null
          ? UserModel.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      electricityBill: map['electricityBill'] as String? ?? '',
      gasBill: map['gasBill'] as String? ?? '',
      landlineBill: map['landlineBill'] as String? ?? '',
      nationalIdFrontImageUrl: map['nationalIdFrontImageUrl'] as String? ?? '',
      nationalIdBackImageUrl: map['nationalIdBackImageUrl'] as String? ?? '',
      comment: map['comment'] as String? ?? '',
      homeAddress: map['homeAddress'] as String? ?? '',
      street: map['street'] as String? ?? '',
      buildingNumber: map['buildingNumber'] as String? ?? '',
      apartment: map['apartment'] as String? ?? '',
      delivery: map['delivery'] != null
          ? DeliveryModel.fromMap(map['delivery'] as Map<String, dynamic>)
          : null,
      status: map['status'] != null
          ? CurrentStatus.values.firstWhere(
              (e) => e.toString().split('.').last == map['status'],
              orElse: () => CurrentStatus.PENDING,
            )
          : CurrentStatus.PENDING,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeCookModel.fromJson(String source) =>
      HomeCookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeCookModel(id: $id, name: $name, address: $address, imagesUrl: $imagesUrl, logoUrl: $logoUrl, description: $description, phoneNumber: $phoneNumber, currentStatus: $currentStatus, contactNumber: $contactNumber, scoialMediaLinks: $scoialMediaLinks, user: $user, electricityBill: $electricityBill, gasBill: $gasBill, landlineBill: $landlineBill, nationalIdFrontImageUrl: $nationalIdFrontImageUrl, nationalIdBackImageUrl: $nationalIdBackImageUrl, comment: $comment, homeAddress: $homeAddress, street: $street, buildingNumber: $buildingNumber, apartment: $apartment, delivery: $delivery )';
  }

  @override
  bool operator ==(covariant HomeCookModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.address == address &&
        listEquals(other.imagesUrl, imagesUrl) &&
        other.logoUrl == logoUrl &&
        other.description == description &&
        other.phoneNumber == phoneNumber &&
        other.currentStatus == currentStatus &&
        other.contactNumber == contactNumber &&
        listEquals(other.scoialMediaLinks, scoialMediaLinks) &&
        other.user == user &&
        other.electricityBill == electricityBill &&
        other.gasBill == gasBill &&
        other.landlineBill == landlineBill &&
        other.nationalIdFrontImageUrl == nationalIdFrontImageUrl &&
        other.nationalIdBackImageUrl == nationalIdBackImageUrl &&
        other.comment == comment &&
        other.homeAddress == homeAddress &&
        other.street == street &&
        other.buildingNumber == buildingNumber &&
        other.apartment == apartment &&
        other.delivery == delivery;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        imagesUrl.hashCode ^
        logoUrl.hashCode ^
        description.hashCode ^
        phoneNumber.hashCode ^
        currentStatus.hashCode ^
        contactNumber.hashCode ^
        scoialMediaLinks.hashCode ^
        user.hashCode ^
        electricityBill.hashCode ^
        gasBill.hashCode ^
        landlineBill.hashCode ^
        nationalIdFrontImageUrl.hashCode ^
        nationalIdBackImageUrl.hashCode ^
        comment.hashCode ^
        homeAddress.hashCode ^
        street.hashCode ^
        buildingNumber.hashCode ^
        apartment.hashCode ^
        delivery.hashCode;
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
    final Map<String, dynamic> map = {};

    if (name != null) map['name'] = name;
    if (link != null) map['link'] = link;

    return map;
  }

  factory ScoialMediaLink.fromMap(Map<String, dynamic> map) {
    return ScoialMediaLink(
      name: map['name'] as String? ?? '',
      link: map['link'] as String? ?? '',
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

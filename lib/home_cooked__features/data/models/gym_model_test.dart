// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

enum CurrentStatus { pending, accepted, rejected }

class HomeCookModel {
  final String? id;
  final String? name;
  final String? address;
  final List<String>? imagesUrl;
  final String? logoUrl;
  final String? description;
  final String? phoneNumber;
  final CurrentStatus? currentStatus;
  final String? contactNumber;
  final List<ScoialMediaLink>? scoialMediaLinks;
  final String? serviceProviderId;
  final String? operationLicenseImageUrl;
  final String? ownerIdPassportImageUrl;
  final String? ownershipContractImageUrl;
  final String? taxRegistrationImageUrl;
  final String? comment;

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
    this.serviceProviderId,
    this.operationLicenseImageUrl,
    this.ownerIdPassportImageUrl,
    this.ownershipContractImageUrl,
    this.taxRegistrationImageUrl,
    this.comment,
  });

  HomeCookModel copyWith({
    String? id,
    String? name,
    String? address,
    List<String>? imagesUrl,
    String? logoUrl,
    String? description,
    String? phoneNumber,
    CurrentStatus? currentStatus,
    String? contactNumber,
    List<ScoialMediaLink>? scoialMediaLinks,
    String? serviceProviderId,
    String? operationLicenseImageUrl,
    String? ownerIdPassportImageUrl,
    String? ownershipContractImageUrl,
    String? taxRegistrationImageUrl,
    String? comment,
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
      serviceProviderId: serviceProviderId ?? this.serviceProviderId,
      operationLicenseImageUrl:
          operationLicenseImageUrl ?? this.operationLicenseImageUrl,
      ownerIdPassportImageUrl:
          ownerIdPassportImageUrl ?? this.ownerIdPassportImageUrl,
      ownershipContractImageUrl:
          ownershipContractImageUrl ?? this.ownershipContractImageUrl,
      taxRegistrationImageUrl:
          taxRegistrationImageUrl ?? this.taxRegistrationImageUrl,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'imagesUrl': imagesUrl,
      'logoUrl': logoUrl,
      'description': description,
      'phoneNumber': phoneNumber,
      'currentStatus': currentStatus?.name,
      'contactNumber': contactNumber,
      'scoialMediaLinks': scoialMediaLinks?.map((x) => x.toMap()).toList(),
      'serviceProviderId': serviceProviderId,
      'operationLicenseImageUrl': operationLicenseImageUrl,
      'ownerIdPassportImageUrl': ownerIdPassportImageUrl,
      'ownershipContractImageUrl': ownershipContractImageUrl,
      'taxRegistrationImageUrl': taxRegistrationImageUrl,
      'comment': comment,
    };
  }

  factory HomeCookModel.fromMap(Map<String, dynamic> map) {
    return HomeCookModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      imagesUrl: map['imagesUrl'] != null
          ? List<String>.from((map['imagesUrl'] as List<String>))
          : null,
      logoUrl: map['logoUrl'] != null ? map['logoUrl'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      currentStatus: map['currentStatus'] != null
          ? CurrentStatus.values.firstWhere(
              (element) => element.name == map['currentStatus'] as String)
          : null,
      contactNumber:
          map['contactNumber'] != null ? map['contactNumber'] as String : null,
      scoialMediaLinks: map['scoialMediaLinks'] != null
          ? List<ScoialMediaLink>.from(
              (map['scoialMediaLinks'] as List<int>).map<ScoialMediaLink?>(
                (x) => ScoialMediaLink.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      serviceProviderId: map['serviceProviderId'] != null
          ? map['serviceProviderId'] as String
          : null,
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
      comment: map['comment'] != null ? map['comment'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeCookModel.fromJson(String source) =>
      HomeCookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GymRequestModel(id: $id, name: $name, address: $address, imagesUrl: $imagesUrl, logoUrl: $logoUrl, description: $description, phoneNumber: $phoneNumber, currentStatus: $currentStatus, contactNumber: $contactNumber, scoialMediaLinks: $scoialMediaLinks, serviceProviderId: $serviceProviderId, operationLicenseImageUrl: $operationLicenseImageUrl, ownerIdPassportImageUrl: $ownerIdPassportImageUrl, ownershipContractImageUrl: $ownershipContractImageUrl, taxRegistrationImageUrl: $taxRegistrationImageUrl, comment: $comment)';
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
        other.serviceProviderId == serviceProviderId &&
        other.operationLicenseImageUrl == operationLicenseImageUrl &&
        other.ownerIdPassportImageUrl == ownerIdPassportImageUrl &&
        other.ownershipContractImageUrl == ownershipContractImageUrl &&
        other.taxRegistrationImageUrl == taxRegistrationImageUrl &&
        other.comment == comment;
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
        serviceProviderId.hashCode ^
        operationLicenseImageUrl.hashCode ^
        ownerIdPassportImageUrl.hashCode ^
        ownershipContractImageUrl.hashCode ^
        taxRegistrationImageUrl.hashCode ^
        comment.hashCode;
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

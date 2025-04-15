class GymDetailsModel {
  final String address;
  final String? comment;
  final String contactNumber;
  final String currentStatus;
  final String description;
  final String id;
  final List<String> imagesUrl;
  final String logoUrl;
  final String name;
  final String operationLicenseImageUrl;
  final String ownerIdPassportImageUrl;
  final String ownershipContractImageUrl;
  final String phoneNumber;
  final List<ScoialMediaLink>? scoialMediaLinks;
  final String? serviceProviderId;
  final String taxRegistrationImageUrl;

  GymDetailsModel({
    required this.address,
    this.comment,
    required this.contactNumber,
    required this.currentStatus,
    required this.description,
    required this.id,
    required this.imagesUrl,
    required this.logoUrl,
    required this.name,
    required this.operationLicenseImageUrl,
    required this.ownerIdPassportImageUrl,
    required this.ownershipContractImageUrl,
    required this.phoneNumber,
    this.scoialMediaLinks,
    this.serviceProviderId,
    required this.taxRegistrationImageUrl,
  });

  factory GymDetailsModel.fromJson(Map<String, dynamic> json) {
    return GymDetailsModel(
      address: json['address'] as String? ?? '',
      comment: json['comment'] as String?,
      contactNumber: json['contactNumber'] as String? ?? '',
      currentStatus: json['currentStatus'] as String? ?? '',
      description: json['description'] as String? ?? '',
      id: json['id'] as String? ?? '',
      imagesUrl: (json['imagesUrl'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      logoUrl: json['logoUrl'] as String? ?? '',
      name: json['name'] as String? ?? '',
      operationLicenseImageUrl: json['operationLicenseImageUrl'] as String? ?? '',
      ownerIdPassportImageUrl: json['ownerIdPassportImageUrl'] as String? ?? '',
      ownershipContractImageUrl: json['ownershipContractImageUrl'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      scoialMediaLinks: (json['scoialMediaLinks'] as List<dynamic>?)
          ?.map((item) => ScoialMediaLink.fromMap(item as Map<String, dynamic>))
          .toList(),
      serviceProviderId: json['serviceProviderId'] as String?,
      taxRegistrationImageUrl: json['taxRegistrationImageUrl'] as String? ?? '',
    );
  }
}

class ScoialMediaLink {
  final String? name;
  final String? link;
  
  ScoialMediaLink({
    this.name,
    this.link,
  });

  factory ScoialMediaLink.fromMap(Map<String, dynamic> map) {
    return ScoialMediaLink(
      name: map['name'] != null ? map['name'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
    );
  }
}

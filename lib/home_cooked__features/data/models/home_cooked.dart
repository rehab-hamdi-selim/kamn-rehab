// // class HomeCooked {
// //   String id;
// //   String fullName;
// //   String email;
// //   String phone;
// //   String profilePictureUrl;
// //   String description;
// //   Map<String, String> socialMedia; // { "Instagram": "url", "Facebook": "url" }
// //   String homeAddress;
// //   String street;
// //   String buildingNumber;
// //   String apartment;
// //   Map<String, String> utilityBills; // { "electricity": "url", "gas": "url", "landline": "url" }
// //   String status; // "pending", "approved", "rejected"
// //   DateTime createdAt;
// //
// //   HomeCooked({
// //     this.id = '',
// //     required this.fullName,
// //     required this.email,
// //     required this.phone,
// //     required this.profilePictureUrl,
// //     required this.description,
// //     required this.socialMedia,
// //     required this.homeAddress,
// //     required this.street,
// //     required this.buildingNumber,
// //     required this.apartment,
// //     required this.utilityBills,
// //     this.status = 'pending',
// //     DateTime? createdAt,
// //   }) : createdAt = createdAt ?? DateTime.now();
// //
// //   // Convert to Map for Firebase
// //   Map<String, dynamic> toMap() {
// //     return {
// //       'fullName': fullName,
// //       'email': email,
// //       'phone': phone,
// //       'profilePictureUrl': profilePictureUrl,
// //       'description': description,
// //       'socialMedia': socialMedia,
// //       'homeAddress': homeAddress,
// //       'street': street,
// //       'buildingNumber': buildingNumber,
// //       'apartment': apartment,
// //       'utilityBills': utilityBills,
// //       'status': status,
// //       'createdAt': createdAt.toIso8601String(),
// //     };
// //   }
// //
// //   // Create object from Firebase snapshot
// //   factory HomeCooked.fromMap(String id, Map<String, dynamic> map) {
// //     return HomeCooked(
// //       id: id,
// //       fullName: map['fullName'] ?? '',
// //       email: map['email'] ?? '',
// //       phone: map['phone'] ?? '',
// //       profilePictureUrl: map['profilePictureUrl'] ?? '',
// //       description: map['description'] ?? '',
// //       socialMedia: Map<String, String>.from(map['socialMedia'] ?? {}),
// //       homeAddress: map['homeAddress'] ?? '',
// //       street: map['street'] ?? '',
// //       buildingNumber: map['buildingNumber'] ?? '',
// //       apartment: map['apartment'] ?? '',
// //       utilityBills: Map<String, String>.from(map['utilityBills'] ?? {}),
// //       status: map['status'] ?? 'pending',
// //       createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
// //     );
// //   }
// // }
//
// class SocialMedia {
//   String instagram;
//   String facebook;
//   String x;
//
//   SocialMedia({
//     required this.instagram,
//     required this.facebook,
//     required this.x,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'instagram': instagram,
//       'facebook': facebook,
//       'x': x,
//     };
//   }
//
//   factory SocialMedia.fromMap(Map<String, dynamic> map) {
//     return SocialMedia(
//       instagram: map['instagram'] ?? '',
//       facebook: map['facebook'] ?? '',
//       x: map['x'] ?? '',
//     );
//   }
// }
//
// class HomeCook {
//   String id;
//   String fullName;
//   String email;
//   String phone;
//   String profilePictureUrl;
//   String description;
//   SocialMedia socialMedia;
//   String homeAddress;
//   String street;
//   String buildingNumber;
//   String apartment;
//   Map<String, String> utilityBills;
//   String status;
//   DateTime createdAt;
//   String serviceProviderId;
//
//   HomeCook({
//     this.id = '',
//     required this.fullName,
//     required this.email,
//     required this.phone,
//     required this.profilePictureUrl,
//     required this.description,
//     required this.socialMedia,
//     required this.homeAddress,
//     required this.street,
//     required this.buildingNumber,
//     required this.apartment,
//     required this.utilityBills,
//     this.status = 'pending',
//     DateTime? createdAt,
//     required this.serviceProviderId,
//   }) : createdAt = createdAt ?? DateTime.now();
//
//   Map<String, dynamic> toMap() {
//     return {
//       'fullName': fullName,
//       'email': email,
//       'phone': phone,
//       'profilePictureUrl': profilePictureUrl,
//       'description': description,
//       'socialMedia': socialMedia.toMap(),
//       'homeAddress': homeAddress,
//       'street': street,
//       'buildingNumber': buildingNumber,
//       'apartment': apartment,
//       'utilityBills': utilityBills,
//       'status': status,
//       'createdAt': createdAt.toIso8601String(),
//       'serviceProviderId': serviceProviderId,
//     };
//   }
//
//   factory HomeCook.fromMap(String id, Map<String, dynamic> map) {
//     return HomeCook(
//       id: id,
//       fullName: map['fullName'] ?? '',
//       email: map['email'] ?? '',
//       phone: map['phone'] ?? '',
//       profilePictureUrl: map['profilePictureUrl'] ?? '',
//       description: map['description'] ?? '',
//       socialMedia: SocialMedia.fromMap(map['socialMedia'] ?? {}),
//       homeAddress: map['homeAddress'] ?? '',
//       street: map['street'] ?? '',
//       buildingNumber: map['buildingNumber'] ?? '',
//       apartment: map['apartment'] ?? '',
//       utilityBills: Map<String, String>.from(map['utilityBills'] ?? {}),
//       status: map['status'] ?? 'pending',
//       createdAt:
//           DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
//       serviceProviderId: map['serviceProviderId'] ?? '',
//     );
//   }
// }

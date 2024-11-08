// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
  final List images;
  final double price;
  final double rating;
  final double size;

  PlaygroundModel({
    required this.longitude,
    required this.latitude,
    required this.description,
    required this.govenrate,
    required this.ownerId,
    required this.playgroundId,
    required this.status,
    required this.images,
    required this.rating,
    required this.size,
    required this.name,
    required this.address,
    required this.price,
  });

  PlaygroundModel copyWith({
    String? name,
    String? address,
    double? price,
    double? longitude,
    double? latitude,
    String? description,
    String? govenrate,
    String? ownerId,
    String? playgroundId,
    String? status,
    List<String>? images,
    double? rating,
    double? size,
  }) {
    return PlaygroundModel(
      name: name ?? this.name,
      address: address ?? this.address,
      price: price ?? this.price,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      description: description ?? this.description,
      govenrate: govenrate ?? this.govenrate,
      ownerId: ownerId ?? this.ownerId,
      playgroundId: playgroundId ?? this.playgroundId,
      status: status ?? this.status,
      images: images ?? this.images,
      rating: rating ?? this.rating,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
      'price': price,
      'longitude': longitude,
      'latitude': latitude,
      'description': description,
      'govenrate': govenrate,
      'ownerId': ownerId,
      'playgroundId': playgroundId,
      'status': status,
      'images': images,
      'rating': rating,
      'size': size,
    };
  }

  factory PlaygroundModel.fromMap(Map<String, dynamic> map) {
    return PlaygroundModel(
      name: map['name'] as String? ?? 'Unknown',
      address: map['address'] as String? ?? 'No address provided',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      longitude: (map['longitude'] as num?)?.toDouble() ?? 0.0,
      latitude: (map['latitude'] as num?)?.toDouble() ?? 0.0,
      description: map['description'] as String? ?? 'No description provided',
      govenrate: map['govenrate'] as String? ?? 'No governorate provided',
      ownerId: map['ownerId'] as String? ?? 'No ownerId provided',
      playgroundId:
          map['playgroundId'] as String? ?? 'No playgroundId provided',
      status: map['status'] as String? ?? 'No status provided',
      images: map['images'] as List ?? [],
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
      size: (map['size'] as num?)?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaygroundModel.fromJson(String source) =>
      PlaygroundModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PlaygroundModel(name: $name,address: $address,price: $price longitude: $longitude,latitude: $latitude,description: $description,govenrate: $govenrate,ownerId: $ownerId,playgroundId: $playgroundId,status: $status,images: $images,rating: $rating,size: $size,)';

  @override
  bool operator ==(covariant PlaygroundModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.address == address &&
        other.price == price &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.description == description &&
        other.govenrate == govenrate &&
        other.ownerId == ownerId &&
        other.playgroundId == playgroundId &&
        other.status == status &&
        other.images == images &&
        other.rating == rating &&
        other.size == size;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      address.hashCode ^
      price.hashCode ^
      size.hashCode ^
      longitude.hashCode ^
      latitude.hashCode ^
      description.hashCode ^
      govenrate.hashCode ^
      ownerId.hashCode ^
      playgroundId.hashCode ^
      status.hashCode ^
      images.hashCode ^
      rating.hashCode;
}

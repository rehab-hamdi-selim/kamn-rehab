// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final DateTime createdAt;
  final String type;
  final String city;
  final String signFrom;
  final String profileImage;
  final String phoneNumber;
  bool _spamer;
  final List<TestMealModel> cartMeals;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.createdAt,
    String? type,
    String? city,
    String? signFrom,
    String? profileImage,
    String? phoneNumber,
    bool? spamer,
    List<TestMealModel>? cartMeals,
  })  : type = type ?? '',
        city = city ?? '',
        signFrom = signFrom ?? '',
        profileImage = profileImage ?? '',
        phoneNumber = phoneNumber ?? '',
        _spamer = spamer ?? false,
        cartMeals = cartMeals ?? [];

  // Getter and setter for spamer
  bool get spamer => _spamer;
  set spamer(bool value) {
    _spamer = value;
  }

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    DateTime? createdAt,
    String? type,
    String? city,
    String? signFrom,
    String? profileImage,
    String? phoneNumber,
    bool? spamer,
    List<TestMealModel>? cartMeals,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      city: city ?? this.city,
      signFrom: signFrom ?? this.signFrom,
      profileImage: profileImage ?? this.profileImage,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      spamer: spamer ?? this.spamer,
      cartMeals: cartMeals ?? this.cartMeals,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'name': name,
      'createdAt': Timestamp.fromDate(createdAt),
      'type': type,
      'city': city,
      'signFrom': signFrom,
      'profileImage': profileImage,
      'phoneNumber': phoneNumber,
      'spamer': spamer,
      'my_healthFood_cart': cartMeals.map((meal) => meal.toJson()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String? ?? '',
      email: map['email'] as String? ?? '',
      name: map['name'] as String? ?? '',
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] is Timestamp
              ? (map['createdAt'] as Timestamp).toDate()
              : DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int))
          : DateTime.now(),
      type: map['type'] as String?,
      city: map['city'] as String?,
      signFrom: map['signFrom'] as String?,
      profileImage: map['profileImage'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      spamer: map['spamer'] as bool?,
      cartMeals: map['my_healthFood_cart'] != null
          ? List<TestMealModel>.from((map['my_healthFood_cart'] as List)
              .map((x) => TestMealModel.fromJson(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, name: $name, createdAt: $createdAt, type: $type, city: $city, signFrom: $signFrom, profileImage: $profileImage, phoneNumber: $phoneNumber, spamer: $spamer, cartMeals: $cartMeals)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.email == email &&
        other.name == name &&
        other.createdAt == createdAt &&
        other.type == type &&
        other.city == city &&
        other.signFrom == signFrom &&
        other.profileImage == profileImage &&
        other.phoneNumber == phoneNumber &&
        other.spamer == spamer &&
        other.cartMeals == cartMeals;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        name.hashCode ^
        createdAt.hashCode ^
        type.hashCode ^
        city.hashCode ^
        signFrom.hashCode ^
        profileImage.hashCode ^
        phoneNumber.hashCode ^
        spamer.hashCode ^
        cartMeals.hashCode;
  }
}

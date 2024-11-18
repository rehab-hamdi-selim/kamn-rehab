// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthUserModel {
  final String uid;
  final String email;
  final String name;
  final DateTime createdAt;
  // Add any other fields you need

  AuthUserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      // Add any other fields
    };
  }

  factory AuthUserModel.fromMap(Map<String, dynamic> map) {
    return AuthUserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      createdAt:
          DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      // Add any other fields
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthUserModel.fromJson(String source) =>
      AuthUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserModel(uid: $uid,email: $email,name: $name,createdAt: $createdAt,)';

  @override
  bool operator ==(covariant AuthUserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.email == email &&
        other.name == name &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode =>
      uid.hashCode ^ email.hashCode ^ name.hashCode ^ createdAt.hashCode;
}

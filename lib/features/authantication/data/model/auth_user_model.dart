// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthUserModel {
  final String name;
  final String type;
  final String userId;
  final String email;

  AuthUserModel({
    required this.type,
    required this.userId,
    required this.email,
    required this.name,
  });

  AuthUserModel copyWith({
    String? name,
    String? userId,
    String? email,
    String? type,
  }) {
    return AuthUserModel(
      name: name ?? this.name,
      type: type ?? this.type,
      userId: userId ?? this.userId,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'longitude': type,
      'userId': userId,
      'email': email,
    };
  }

  factory AuthUserModel.fromMap(Map<String, dynamic> map) {
    return AuthUserModel(
      name: map['name'] as String? ?? 'Unknown',
      type: map['type'] as String?? "Unknown",
      userId: map['userId'] as String? ?? 'No userId provided',
      email:  map['email'] as String? ?? 'No email provided',
      );
  }

  String toJson() => json.encode(toMap());

  factory AuthUserModel.fromJson(String source) =>
      AuthUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserModel(name: $name,type: $type,userId: $userId,email: $email,)';

  @override
  bool operator ==(covariant AuthUserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.type == type &&
        other.userId == userId &&
        other.email == email ;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      type.hashCode ^
      userId.hashCode ^
      email.hashCode ;
}

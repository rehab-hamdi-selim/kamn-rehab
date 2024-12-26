// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/widgets.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final DateTime createdAt;
  final String? type;
  final String? signFrom;
  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.createdAt,
    required this.type,
    required this.signFrom,
  });
  // Add any other fields you need

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    DateTime? createdAt,
    ValueGetter<String?>? type,
    ValueGetter<String?>? signFrom,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      type: type != null ? type() : this.type,
      signFrom: signFrom != null ? signFrom() : this.signFrom,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'type': type,
      'signFrom': signFrom,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      type: map['type'],
      signFrom: map['signFrom'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, name: $name, createdAt: $createdAt, type: $type, signFrom: $signFrom)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.uid == uid &&
      other.email == email &&
      other.name == name &&
      other.createdAt == createdAt &&
      other.type == type &&
      other.signFrom == signFrom;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      email.hashCode ^
      name.hashCode ^
      createdAt.hashCode ^
      type.hashCode ^
      signFrom.hashCode;
  }
}

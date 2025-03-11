// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {
  final String id;
  final String title;
  final String body;
  final DateTime timestamp;
  final String userId;
  final bool isRead;
  NotificationsModel({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    required this.userId,
    this.isRead = false,
  });

  NotificationsModel copyWith({
    String? id,
    String? title,
    String? body,
    DateTime? timestamp,
    String? userId,
    bool? isRead,
  }) {
    return NotificationsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      timestamp: timestamp ?? this.timestamp,
      userId: userId ?? this.userId,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'timestamp': timestamp,
      'isRead': isRead,
      'userId': userId,
    };
  }

  factory NotificationsModel.fromMap(Map<String, dynamic> map) {
    return NotificationsModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      body: map['body'] ?? "",
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      isRead: map['isRead'] ?? false,
      userId: map['userId'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationsModel.fromJson(String source) =>
      NotificationsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NotificationsModel(id: $id, title: $title, body: $body, timestamp: $timestamp, isRead: $isRead, userId: $userId)';

  @override
  bool operator ==(covariant NotificationsModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.body == body &&
        other.timestamp == timestamp &&
        other.isRead == isRead &&
        other.userId == userId;
  }

  @override
  int get hashCode =>
      title.hashCode ^
      body.hashCode ^
      timestamp.hashCode ^
      isRead.hashCode ^
      userId.hashCode;
}

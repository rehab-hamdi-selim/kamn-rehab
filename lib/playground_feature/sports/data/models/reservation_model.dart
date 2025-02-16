import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:kamn/core/common/entities/user_model.dart';
import 'package:kamn/playground_feature/sports/data/models/playground_model.dart';

class ReservationModel {
  String? reservationId;
  UserModel? user;
  PlaygroundModel? ground;
  DateTime? date;
  num? price;
  DateTime? startAt;
  DateTime? endAt;
  String? status;
  List<Session>? sessions;
  String? paymentMethod;
  ReservationModel({
    this.reservationId,
    this.user,
    this.ground,
    this.date,
    this.price,
    this.startAt,
    this.endAt,
    this.status,
    this.sessions,
    this.paymentMethod,
  });

  ReservationModel copyWith({
    ValueGetter<String?>? reservationId,
    ValueGetter<UserModel?>? user,
    ValueGetter<PlaygroundModel?>? ground,
    ValueGetter<DateTime?>? date,
    ValueGetter<num?>? price,
    ValueGetter<DateTime?>? startAt,
    ValueGetter<DateTime?>? endAt,
    ValueGetter<String?>? status,
    ValueGetter<List<Session>?>? sessions,
    ValueGetter<String?>? paymentMethod,
  }) {
    return ReservationModel(
      reservationId: reservationId != null ? reservationId() : this.reservationId,
      user: user != null ? user() : this.user,
      ground: ground != null ? ground() : this.ground,
      date: date != null ? date() : this.date,
      price: price != null ? price() : this.price,
      startAt: startAt != null ? startAt() : this.startAt,
      endAt: endAt != null ? endAt() : this.endAt,
      status: status != null ? status() : this.status,
      sessions: sessions != null ? sessions() : this.sessions,
      paymentMethod: paymentMethod != null ? paymentMethod() : this.paymentMethod,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reservationId': reservationId,
      'user': user?.toMap(),
      'ground': ground?.toMap(),
      'date': date?.millisecondsSinceEpoch,
      'price': price,
      'startAt': startAt?.millisecondsSinceEpoch,
      'endAt': endAt?.millisecondsSinceEpoch,
      'status': status,
      'sessions': sessions?.map((x) => x.toMap()).toList(),
      'paymentMethod': paymentMethod,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      reservationId: map['reservationId'],
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
      ground: map['ground'] != null ? PlaygroundModel.fromMap(map['ground']) : null,
      date: map['date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date']) : null,
      price: map['price'],
      startAt: map['startAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['startAt']) : null,
      endAt: map['endAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['endAt']) : null,
      status: map['status'],
      sessions: map['sessions'] != null ? List<Session>.from(map['sessions']?.map((x) => Session.fromMap(x))) : null,
      paymentMethod: map['paymentMethod'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationModel.fromJson(String source) =>
      ReservationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReservationModel(reservationId: $reservationId, user: $user, ground: $ground, date: $date, price: $price, startAt: $startAt, endAt: $endAt, status: $status, sessions: $sessions, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is ReservationModel &&
      other.reservationId == reservationId &&
      other.user == user &&
      other.ground == ground &&
      other.date == date &&
      other.price == price &&
      other.startAt == startAt &&
      other.endAt == endAt &&
      other.status == status &&
      listEquals(other.sessions, sessions) &&
      other.paymentMethod == paymentMethod;
  }

  @override
  int get hashCode {
    return reservationId.hashCode ^
      user.hashCode ^
      ground.hashCode ^
      date.hashCode ^
      price.hashCode ^
      startAt.hashCode ^
      endAt.hashCode ^
      status.hashCode ^
      sessions.hashCode ^
      paymentMethod.hashCode;
  }
}

class Session {
  DateTime startAt;
  DateTime endAt;
  Session({
    required this.startAt,
    required this.endAt,
  });

  Session copyWith({
    DateTime? startAt,
    DateTime? endAt,
  }) {
    return Session(
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'startAt': startAt.millisecondsSinceEpoch,
      'endAt': endAt.millisecondsSinceEpoch,
    };
  }

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
      startAt: DateTime.fromMillisecondsSinceEpoch(map['startAt']),
      endAt: DateTime.fromMillisecondsSinceEpoch(map['endAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Session.fromJson(String source) =>
      Session.fromMap(json.decode(source));

  @override
  String toString() => 'Interval(startAt: $startAt, endAt: $endAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Session && other.startAt == startAt && other.endAt == endAt;
  }

  @override
  int get hashCode => startAt.hashCode ^ endAt.hashCode;
}

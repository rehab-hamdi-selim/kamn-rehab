import 'dart:convert';

import 'package:flutter/widgets.dart';

class ReservationModel {
  String? reservationId;
  String? userId;
  String? groundId;
  DateTime? date;
  num? price;
  String? startAt;
  String? endAt;
  String? status;
  ReservationModel({
    this.reservationId,
    this.userId,
    this.groundId,
    this.date,
    this.price,
    this.startAt,
    this.endAt,
    this.status,
  });

  ReservationModel copyWith({
    ValueGetter<String?>? reservationId,
    ValueGetter<String?>? userId,
    ValueGetter<String?>? groundId,
    ValueGetter<DateTime?>? date,
    ValueGetter<num?>? price,
    ValueGetter<String?>? startAt,
    ValueGetter<String?>? endAt,
    ValueGetter<String?>? status,
  }) {
    return ReservationModel(
      reservationId:
          reservationId != null ? reservationId() : this.reservationId,
      userId: userId != null ? userId() : this.userId,
      groundId: groundId != null ? groundId() : this.groundId,
      date: date != null ? date() : this.date,
      price: price != null ? price() : this.price,
      startAt: startAt != null ? startAt() : this.startAt,
      endAt: endAt != null ? endAt() : this.endAt,
      status: status != null ? status() : this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reservationId': reservationId,
      'userId': userId,
      'groundId': groundId,
      'date': date?.millisecondsSinceEpoch,
      'price': price,
      'startAt': startAt,
      'endAt': endAt,
      'status': status,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      reservationId: map['reservationId'],
      userId: map['userId'],
      groundId: map['groundId'],
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'])
          : null,
      price: map['price'],
      startAt: map['startAt'],
      endAt: map['endAt'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationModel.fromJson(String source) =>
      ReservationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReservationModel(reservationId: $reservationId, userId: $userId, groundId: $groundId, date: $date, price: $price, startAt: $startAt, endAt: $endAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReservationModel &&
        other.reservationId == reservationId &&
        other.userId == userId &&
        other.groundId == groundId &&
        other.date == date &&
        other.price == price &&
        other.startAt == startAt &&
        other.endAt == endAt &&
        other.status == status;
  }

  @override
  int get hashCode {
    return reservationId.hashCode ^
        userId.hashCode ^
        groundId.hashCode ^
        date.hashCode ^
        price.hashCode ^
        startAt.hashCode ^
        endAt.hashCode ^
        status.hashCode;
  }
}

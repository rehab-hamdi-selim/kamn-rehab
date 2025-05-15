// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

enum MembershipOfferStatus {
  initial,
  loading,
  success,
  error,
  secureStorageSuccess,
  secureStorageError,
  successAddPlan,
  succesGetFeatures
  
}

extension MembershipOfferStateX on MembershipOfferState {
  bool get isInitial => status == MembershipOfferStatus.initial;
  bool get isLoading => status == MembershipOfferStatus.loading;
  bool get isSuccess => status == MembershipOfferStatus.success;
  bool get isError => status == MembershipOfferStatus.error;
  bool get isSecureStorageSuccess => status == MembershipOfferStatus.secureStorageSuccess;
  bool get isSecureStorageError => status == MembershipOfferStatus.secureStorageError;
  bool get isSuccessAddPlan => status == MembershipOfferStatus.successAddPlan;
  bool get isSuccessGetFeatures => status == MembershipOfferStatus.succesGetFeatures;

  bool isDaySelected(String day) {
    if (selectedDays == null) {
      return false;
    }
    return selectedDays!.contains(day);
  }
  bool isFeatureSelected(Feature feature) {
    if (selectedFeature == null) {
      return false;
    }
    return selectedFeature!.contains(feature);
  }

}

class MembershipOfferState {
  final MembershipOfferStatus status;
  final String? gymId;
  final String? errorMessage;
  final String? offerName;
  final String? price;
  final String? priceAfterDiscount;
  final String? notes;
  final bool is24Hours;
  final bool? is247Days;
  final bool? isDiscount;
  final List<String>? selectedDays;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final List<IntervalSelected>? intervals; // Add intervals list
  final PlanDuration? planDuration;
  final DateTime? discountStartDate;
  final DateTime? discountEndDate;
  final List<Feature>? features;
  final List<Feature>? selectedFeature;

  const MembershipOfferState({
    required this.status,
    this.gymId,
    this.errorMessage,
    this.offerName,
    this.price,
    this.priceAfterDiscount,
    this.notes,
    this.is24Hours = false,
    this.is247Days = false,
    this.isDiscount = false,
    this.selectedDays,
    this.startTime,
    this.endTime,
    this.intervals,
    this.planDuration,
    this.discountStartDate,
    this.discountEndDate,
    this.features,
    this.selectedFeature,
  });

  MembershipOfferState copyWith({
    MembershipOfferStatus? status,
    String? gymId,
    String? errorMessage,
    String? offerName,
    String? price,
    String? priceAfterDiscount,
    String? notes,
    bool? is24Hours,
    bool? is247Days,
    bool? isDiscount,
    List<String>? selectedDays,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    List<IntervalSelected>? intervals,
    PlanDuration? planDuration,
    DateTime? discountStartDate,
    DateTime? discountEndDate,
    List<Feature>? features,
    List<Feature>? selectedFeature,
  }) {
    return MembershipOfferState(
      status: status ?? this.status,
      gymId: gymId ?? this.gymId,
      errorMessage: errorMessage ?? this.errorMessage,
      offerName: offerName ?? this.offerName,
      price: price ?? this.price,
      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
      notes: notes ?? this.notes,
      is24Hours: is24Hours ?? this.is24Hours,
      is247Days: is247Days ?? this.is247Days,
      isDiscount: isDiscount ?? this.isDiscount,
      selectedDays: selectedDays ?? this.selectedDays,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      intervals: intervals ?? this.intervals,
      planDuration: planDuration ?? this.planDuration,
      discountStartDate: discountStartDate ?? this.discountStartDate,
      discountEndDate: discountEndDate ?? this.discountEndDate,
      features: features ?? this.features,
      selectedFeature: selectedFeature ?? this.selectedFeature,
    );
  }

  // @override
  // String toString() {
  //   return 'MembershipOfferState(status: $status, gymId: $gymId, errorMessage: $errorMessage, offerName: $offerName, price: $price, priceAfterDiscount: $priceAfterDiscount, notes: $notes, is24Hours: $is24Hours, is247Days: $is247Days, isDiscount: $isDiscount, selectedDays: $selectedDays, startTime: $startTime, endTime: $endTime, intervals: $intervals, planDuration: $planDuration, discountStartDate: $discountStartDate, discountEndDate: $discountEndDate, features: $features, selectedFeature: $selectedFeature)';
  // }
  @override
  String toString() {
    return 'MembershipOfferState(status: $status,)';
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/utils/time_picker.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_state.dart';

@injectable
class AvailableDatesCubit extends Cubit<AvailableDatesState> {
  AvailableDatesCubit({required this.repository})
      : super(AvailableDatesState(state: AvailableDatesStatus.initial));

  ServiceProvidersRepository repository;

  TimeOfDay? startTime;

  TimeOfDay? endTime;

  int period = 60;
  List<String> intervals = [];
  bool isOpened = false;
  bool isSelectAll = false;
  List<String> selectedIntervals = [];

  void onIntervalSelection(String interval) {
    if (selectedIntervals.contains(interval)) {
      selectedIntervals.remove(interval);
    } else {
      selectedIntervals.add(interval);
    }
    emit(state.copyWith(state: AvailableDatesStatus.initial));
  }

  void onSelectAll(bool isSelectAll) {
    if (isSelectAll) {
      selectedIntervals.addAll(intervals);
    } else {
      selectedIntervals.clear();
    }
    this.isSelectAll = isSelectAll;

    emit(state.copyWith(state: AvailableDatesStatus.initial));
  }

  void setStartTime(TimeOfDay? value) {
    if (value != null) {
      startTime = value;
      emit(state.copyWith(startAt: startTime));
    } else {
      emit(state.copyWith(
          state: AvailableDatesStatus.failure,
          erorrMessage: "please select valied time"));
    }
  }

  void setEndTime(TimeOfDay? value) {
    if (value != null) {
      endTime = value;
      emit(state.copyWith(endAt: endTime));
    } else {
      emit(state.copyWith(
          state: AvailableDatesStatus.failure,
          erorrMessage: "please select valied time"));
    }
  }

  void calculateIntervails() {
    if (startTime != null && endTime != null) {
      intervals = calculateIntervals(startTime!, endTime!, period);
      emit(state.copyWith(
          state: AvailableDatesStatus.success, intervials: intervals));
    } else {
      startTime = const TimeOfDay(hour: 0, minute: 0);
      endTime = const TimeOfDay(hour: 24, minute: 0);
      intervals = calculateIntervals(startTime!, endTime!, period);
      emit(state.copyWith(
          state: AvailableDatesStatus.intervalsCalc, intervials: intervals));
    }
  }

  Future<void> onSubmit(
      String playgroundId, Map<String, List<String>> data) async {
    emit(state.copyWith(state: AvailableDatesStatus.loading));
    var response = await repository.updateState(playgroundId, data);
    response.fold((error) {
      emit(state.copyWith(
          state: AvailableDatesStatus.failure,
          erorrMessage: 'faild to add times '));
    }, (success) {
      emit(state.copyWith(
          state: AvailableDatesStatus.success,
          successMessage: "dates added successfully"));
    });
  }
}

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

  bool isOpened = false;
  bool isSelectAll = false;
  List<String> selectedIntervals = [];

  void onIntervalSelection(String interval) {
    if (selectedIntervals.contains(interval)) {
      selectedIntervals.remove(interval);
    } else {
      selectedIntervals.add(interval);
    }
    emit(state.copyWith(state: AvailableDatesStatus.intervalSelected));
  }

  void onSelectAll(bool isSelectAll) {
    if (isSelectAll) {
      selectedIntervals.addAll(state.intervials ?? []);
    } else {
      selectedIntervals.clear();
    }
    this.isSelectAll = isSelectAll;

    emit(state.copyWith(state: AvailableDatesStatus.intervalSelected));
  }

  void setStartTime(TimeOfDay? value) {
    if (value != null) {
      emit(state.copyWith(startAt: value));
    } else {
      emit(state.copyWith(
          state: AvailableDatesStatus.failure,
          erorrMessage: "please select valied time"));
    }
  }

  void setEndTime(TimeOfDay? value) {
    if (value != null) {
      emit(state.copyWith(endAt: value));
    } else {
      emit(state.copyWith(
          state: AvailableDatesStatus.failure,
          erorrMessage: "please select valied time"));
    }
  }

  void calculateIntervails() {
    List<String>? clacIntervails;
    if (state.startAt != null && state.endAt != null) {
      clacIntervails =
          calculateIntervals(state.startAt!, state.endAt!, state.peroid);
      if (clacIntervails != null) {
        emit(state.copyWith(
            state: AvailableDatesStatus.intervalsCalc,
            intervials: clacIntervails));
      } else {
        emit(state.copyWith(
            state: AvailableDatesStatus.failure,
            intervials: [],
            erorrMessage: 'error on selecting dates please check it'));
      }
    } else {
      clacIntervails = calculateIntervals(const TimeOfDay(hour: 0, minute: 0),
          const TimeOfDay(hour: 24, minute: 0), 60);
      emit(state.copyWith(
          state: AvailableDatesStatus.intervalsCalc,
          intervials: clacIntervails));
    }
  }

  Future<void> onSubmit(String playgroundId, Map<String, dynamic> data) async {
    emit(state.copyWith(state: AvailableDatesStatus.loading));
    var response = await repository.updateState(playgroundId, data);
    response.fold((error) {
      emit(state.copyWith(
        state: AvailableDatesStatus.failure,
        erorrMessage: 'faild to add times ',
      ));
    }, (success) {
      emit(state.copyWith(
          state: AvailableDatesStatus.success,
          successMessage: "dates added successfully"));
    });
  }
}

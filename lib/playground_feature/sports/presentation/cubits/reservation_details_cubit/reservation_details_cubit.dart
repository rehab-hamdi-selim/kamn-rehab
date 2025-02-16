import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';
import 'package:kamn/playground_feature/sports/data/repositories/sports_repository.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/reservation_details_cubit/reservation_details_state.dart';

@injectable
class ReservationDetailsCubit extends Cubit<ReservationDetailsState> {
  ReservationDetailsCubit({required this.repository})
      : super(ReservationDetailsState(
          status: ReservationDetailsStatus.initial,
        ));
  final SportsRepository repository;
  late DateTime? targetTime;
  Timer? _timer;
  ValueNotifier<Duration>? countdownDuration;
  setTargetTime(DateTime newTime) {
    targetTime = newTime;
    countdownDuration = ValueNotifier(targetTime!.difference(DateTime.now()));
    changeValue();
  }

  void changeValue() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final remainingDuration = targetTime?.difference(DateTime.now());
      if (remainingDuration!.isNegative) {
        // Stop the timer if the session has ended
        _timer?.cancel();
        countdownDuration?.value = Duration.zero;
      } else {
        countdownDuration?.value = remainingDuration;
      }
      countdownDuration?.value = targetTime!.difference(DateTime.now());
    });
  }

  void changeVisibility() {
    emit(state.copyWith(
        isVisible: !state.isVisible!,
        maxLines: state.maxLines == 10 ? 100 : 10));
  }

  void deleteReservation(ReservationModel reservation) async {

    if (reservation.date?.add(const Duration(minutes: 15)).isAfter(DateTime.now())??false) {
  final result = await repository.delete(reservation);
  result.fold(
      (onLeft) =>
          emit(state.copyWith(status: ReservationDetailsStatus.failed)),
      (success) =>
          emit(state.copyWith(status: ReservationDetailsStatus.deleted)));
}else{

  emit(state.copyWith(status: ReservationDetailsStatus.timeExcessed));
}
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

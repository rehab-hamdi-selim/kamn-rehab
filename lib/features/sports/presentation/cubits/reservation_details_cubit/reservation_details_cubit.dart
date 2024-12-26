import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports/presentation/cubits/reservation_details_cubit/reservation_details_state.dart';

@injectable
class ReservationDetailsCubit extends Cubit<ReservationDetailsState> {
  ReservationDetailsCubit()
      : super(ReservationDetailsState(
          status: ReservationDetailsStatus.initial,
        ));

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
      countdownDuration?.value = targetTime!.difference(DateTime.now());
    });
  }

  void changeVisibility() {
    emit(state.copyWith(
        isVisible: !state.isVisible!,
        maxLines: state.maxLines == 10 ? 100 : 10));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

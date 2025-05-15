import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/gym_feature/add_gym/data/models/gym_request_model.dart';
import 'package:kamn/gym_feature/add_gym/data/repositories/add_gym_repository.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/track_submission/track_submission_state.dart';

@injectable
class TrackSubmissionCubit extends Cubit<TrackSubmissionState> {
  TrackSubmissionCubit({required this.repository})
      : super(TrackSubmissionState(status: TrackSubmissionStatus.initial));
  final AddGymRepository repository;
  Future<void> getGym(String id) async {

    final response = await repository.getGymById(id);
    response.fold(
        (l) => emit(state.copyWith(
            status: TrackSubmissionStatus.error, errorMessage: l.erorr)),
        (r){

          emit(state.copyWith(
            status: TrackSubmissionStatus.success, gymRequestModel: r));});
  }

  void check() {
    final list = state.stepsInfo.mapIndexed((index, step) {
      return step.copyWith(
        status: (index == 0)
            ? StepStatus.completed
            : state.stepsCompleted[index - 1] ?? true
                ? (state.stepsCompleted[index] == null
                    ? StepStatus.current
                    : (state.stepsCompleted[index] ?? true
                        ? StepStatus.completed
                        : StepStatus.failed))
                : StepStatus.pending,
      );
    }).toList();
    emit(state.copyWith(stepsInfo: list));
  }

  void updateStatus() {
    final status = state.gymRequestModel?.currentStatus;
    print("status:$status");
    if (status != null) {
      if (status == CurrentStatus.pending) {
        emit(state.copyWith(
            status: TrackSubmissionStatus.pending,
            stepsCompleted: [true, null, null]));
      } else if (status == CurrentStatus.accepted) {
        emit(state.copyWith(
            status: TrackSubmissionStatus.approved,
            stepsCompleted: [true, true, true]));
      } else if (status == CurrentStatus.rejected) {
        emit(state.copyWith(
            status: TrackSubmissionStatus.rejected,
            stepsCompleted: [true, true, false]));
      }
    }
  }

  void reset() {
    emit(TrackSubmissionState(status: TrackSubmissionStatus.initial));
  }
}
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/gym_feature/gyms/presentation/cubit/track_submission/track_submission_state.dart';

class TrackSubmissionCubit extends Cubit<TrackSubmissionState> {
  TrackSubmissionCubit()
      : super( TrackSubmissionState(
            status: TrackSubmissionStatus.initial)){
              check();
            }

  void updateSubmissionStatus(TrackSubmissionStatus newStatus) {
    emit(state.copyWith(status: newStatus));
  }

  void updateStepProgress(List<bool> completedSteps, int currentStep) {
    emit(state.copyWith(
      stepsCompleted: completedSteps,
    ));
  }

  void setError(String message) {
    emit(state.copyWith(
      status: TrackSubmissionStatus.error,
      errorMessage: message,
    ));
  }
void check(){
  final list=state.stepsInfo?.mapIndexed((index,step){
    return step.copyWith(status:  (index == 0)
                                ? StepStatus.completed
                                : state.stepsCompleted[index - 1]!
                                    ? (state.stepsCompleted[index] == null
                                        ? StepStatus.current
                                        : (state.stepsCompleted[index]!
                                            ? StepStatus.completed
                                            : StepStatus.failed))
                                    : StepStatus.pending,);
  }).toList();
  emit(state.copyWith(status: TrackSubmissionStatus.success, stepsInfo: list));
}
  void reset() {
    emit( TrackSubmissionState(status: TrackSubmissionStatus.initial));
  }
}
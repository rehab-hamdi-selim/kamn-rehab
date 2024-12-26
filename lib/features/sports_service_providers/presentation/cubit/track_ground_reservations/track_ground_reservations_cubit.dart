import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/track_ground_reservations/track_ground_reservations_states.dart';

@injectable
class TrackGroundReservationsCubit extends Cubit<TrackGroundsState> {
  TrackGroundReservationsCubit({required this.repository})
      : super(TrackGroundsState(state: TrackGroundsStatus.initial)) {
    String ownerId = '';
    getPlaygroundsByOwnerId(ownerId);
  }
  ServiceProvidersRepository repository;

  Future<void> getPlaygroundsByOwnerId(String ownerId) async {
    emit(TrackGroundsState(state: TrackGroundsStatus.loading));
    final result = await repository.getPlaygroundsByOwnerId(ownerId);
    print('${result},resultt');
    result.fold((error) {
      print(error.erorr);

      emit(TrackGroundsState(
        state: TrackGroundsStatus.failure,
        erorrMessage: error.erorr,
      ));
    }, (success) {
      emit(TrackGroundsState(
        state: TrackGroundsStatus.success,
        playgrounds: success,
      ));
    });
  }
}

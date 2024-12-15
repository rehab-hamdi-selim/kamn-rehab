import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/track_ground_reservation_details/track_ground_reservation_details_states.dart';

@injectable
class TrackGroundReservationsDetailsCubit
    extends Cubit<TrackGroundsReservationDetailsState> {
  TrackGroundReservationsDetailsCubit({required this.repository})
      : super(TrackGroundsReservationDetailsState(
            state: TrackGroundsReservationDetailsStatus.initial)) {
    String ownerId = '';
    getPlaygroundsDetailsById(ownerId);
  }
  ServiceProvidersRepository repository;

  Future<void> getPlaygroundsDetailsById(String playgroundId) async {
    emit(TrackGroundsReservationDetailsState(
        state: TrackGroundsReservationDetailsStatus.loading));
    final result =
        await repository.getPlaygroundsReservationDetailsById(playgroundId);
    print('${result},resultt');
    result.fold((error) {
      print(error.erorr);

      emit(TrackGroundsReservationDetailsState(
        state: TrackGroundsReservationDetailsStatus.failure,
        erorrMessage: error.erorr,
      ));
    }, (success) {
      emit(TrackGroundsReservationDetailsState(
        state: TrackGroundsReservationDetailsStatus.success,
        playgroundsReservationDetails: success,
      ));
    });
  }
}

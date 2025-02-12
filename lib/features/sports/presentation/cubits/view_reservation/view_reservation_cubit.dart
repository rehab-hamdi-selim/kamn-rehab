import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports/data/repositories/sports_repository.dart';
import 'package:kamn/features/sports/presentation/cubits/view_reservation/view_reservation_state.dart';

@injectable
class ViewReservationCubit extends Cubit<ViewReservationState> {
  final SportsRepository _sportsRepository;
  ViewReservationCubit({required SportsRepository sportsRepository})
      : _sportsRepository = sportsRepository,
        super(ViewReservationState(state: ViewReservationStatus.intial));

  void getUserResevation(String userId) async {
    emit(ViewReservationState(
      state: ViewReservationStatus.loading,
    ));
    var result = await _sportsRepository.getUserReservations(userId);
    result.fold((error) {
      emit(ViewReservationState(
          state: ViewReservationStatus.failure, error: error.erorr));
    }, (success) {
      emit(ViewReservationState(
          state: ViewReservationStatus.success, reservations: success));
    });
  }
  Future<void> addRating(String reservationId, double rating) async {
    var result = await _sportsRepository.setData(reservationId, {'rating': rating});
    result.fold((error) {
      emit(state.copyWith(
          state: ViewReservationStatus.failure, error: error.erorr));
    }, (success) {
      emit(state.copyWith(
          state: ViewReservationStatus.settedData,));
    });
}
}
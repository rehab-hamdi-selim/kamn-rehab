import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/playground_feature/sports_service_providers/domain/usecase/filter_search_data_use_case.dart';
import 'package:kamn/playground_feature/sports_service_providers/domain/usecase/get_services_from_firebase_usecase.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_state.dart';

@injectable
class ServiceProviderGroundsCubit extends Cubit<ServiceProviderGroundsState> {
  ServiceProviderGroundsCubit(
      {required this.getPlaygroundUsecase,
      required this.searchDataUseCase})
      : super(ServiceProviderGroundsState(
            state: ServiceProviderGroundsStatus.initial)) {
    if (state.playgrounds == null) {
      getPlaygroundsRequests();
    }
  }
  final GetServicesFromFirebaseUsecase getPlaygroundUsecase;
  final FilterSearchDataUseCase searchDataUseCase;

  Future<void> getPlaygroundsRequests() async {
    emit(ServiceProviderGroundsState(
        state: ServiceProviderGroundsStatus.loading));
    final result = await getPlaygroundUsecase.invoke();
    result.fold((error) {
      emit(ServiceProviderGroundsState(
        state: ServiceProviderGroundsStatus.failure,
        erorrMessage: error.erorr,
      ));
    }, (success) {
      emit(ServiceProviderGroundsState(
          state: ServiceProviderGroundsStatus.success, playgrounds: success));
    });
  }

  Future<void> searchByQuery(String query, String type) async {
    emit(state.copyWith(state: ServiceProviderGroundsStatus.loading));

    final result = await searchDataUseCase.invoke(query, type);
    result.fold((l) {
      emit(state.copyWith(
        state: ServiceProviderGroundsStatus.failure,
        erorrMessage: l.erorr,
      ));
    }, (r) {
      emit(state.copyWith(
        state: ServiceProviderGroundsStatus.success,
        playgrounds: r,
      ));
    });
  }
}

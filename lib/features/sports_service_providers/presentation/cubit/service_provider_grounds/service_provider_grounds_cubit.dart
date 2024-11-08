import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_state.dart';

@injectable
class ServiceProviderGroundsCubit extends Cubit<ServiceProviderGroundsState> {
  ServiceProviderGroundsCubit({required this.repository})
      : super(ServiceProviderGroundsState(
            state: ServiceProviderGroundsStatus.initial)) {
    getPlaygroundsRequests();
  }
  ServiceProvidersRepository repository;

  Future<void> getPlaygroundsRequests() async {
    emit(ServiceProviderGroundsState(
        state: ServiceProviderGroundsStatus.loading));
    final result = await repository.getPlaygroundsRequests();
    result.fold((error) {
      print(error.erorr);

      emit(ServiceProviderGroundsState(
        state: ServiceProviderGroundsStatus.failure,
        erorrMessage: error.erorr,
      ));
    }, (success) {
      emit(ServiceProviderGroundsState(
        state: ServiceProviderGroundsStatus.success,
        playgrounds: success,
      ));
    });
  }
}

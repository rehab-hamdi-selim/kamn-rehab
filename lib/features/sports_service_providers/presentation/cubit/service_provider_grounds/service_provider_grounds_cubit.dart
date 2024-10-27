import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_provider_grounds_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_state.dart';

@injectable
class ServiceProviderGroundsCubit extends Cubit<ServiceProviderGroundsState> {
  ServiceProviderGroundsCubit({required this.repository})
      : super(ServiceProviderGroundsState(
            state: ServiceProviderGroundsStatus.initial));
  ServiceProviderGroundsRepository repository;

  Future<void> getPlaygrounds() async {
    final result = await repository.getPlaygroundsRequests();
    result.fold(
        (error) => emit(ServiceProviderGroundsState(
              state: ServiceProviderGroundsStatus.failure,
              erorrMessage: error.erorr,
            )),
        (success) => emit(ServiceProviderGroundsState(
              state: ServiceProviderGroundsStatus.success,
              playgrounds: success,
            )));
  }
}

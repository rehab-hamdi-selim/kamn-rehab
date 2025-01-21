import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_state.dart';

@injectable
class ServiceProviderGroundDetailsCubit
    extends Cubit<ServiceProviderGroundDetailsState> {
  ServiceProviderGroundDetailsCubit({required this.repository})
      : super(ServiceProviderGroundDetailsState(
            state: ServiceProviderGroundDetailsStatus.initial));

  ServiceProvidersRepository repository;

  TextEditingController commentController = TextEditingController();

  int maxLines = 10;
  bool isVisible = true;
  void onPressReadMore() {
    if (maxLines <= 10) {
      maxLines = 1000;
      isVisible = false;
    } else {
      maxLines = 10;
      isVisible = true;
    }
    emit(ServiceProviderGroundDetailsState(
        state: ServiceProviderGroundDetailsStatus.textExtended));
  }

  Future<void> accept(PlaygroundRequestModel playground,String userId) async {
    var response = await repository.addWithTransactionToFirebase(playground,userId);
    response.fold((error) {
      emit(ServiceProviderGroundDetailsState(
          state: ServiceProviderGroundDetailsStatus.failure,
          erorrMessage: error.erorr));
    }, (sucess) {
      emit(ServiceProviderGroundDetailsState(
          state: ServiceProviderGroundDetailsStatus.success,
          successMessage: 'this play ground accepted'));
    });
  }

  Future<void> decline(String playgroundId, Map<String, dynamic> data) async {
    var response = await repository.updateState(playgroundId, data);
    response.fold((error) {
      emit(ServiceProviderGroundDetailsState(
          state: ServiceProviderGroundDetailsStatus.failure,
          erorrMessage: error.erorr));
    }, (sucess) {
      emit(ServiceProviderGroundDetailsState(
          state: ServiceProviderGroundDetailsStatus.success,
          successMessage: 'this play ground decline'));
    });
  }
}

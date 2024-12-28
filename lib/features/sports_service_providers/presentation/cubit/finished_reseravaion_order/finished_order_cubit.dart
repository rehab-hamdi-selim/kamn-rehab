import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';

import 'package:kamn/features/sports_service_providers/presentation/cubit/finished_reseravaion_order/finished_order_state.dart';
@injectable
class FinishedOrdersCubit extends Cubit<FinishedOrdersState> {
 final ServiceProvidersRepository repository;

  FinishedOrdersCubit({required this.repository})
      : super(FinishedOrdersState(state: FinishedOrdersStatus.initial));

  void fetchOrdersForCategory(String category) async {
    emit(state.copyWith(state: FinishedOrdersStatus.loading));
    final result = await repository.getFinishedOrdersByCategory(category);

    result.fold(
      (failure) => emit(state.copyWith(state: FinishedOrdersStatus.failure, errorMessage: failure.erorr),),
      (orders) => emit(state.copyWith(state: FinishedOrdersStatus.success, reservations: orders))
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/current_reseravaion_order/current_orders_state.dart';

@injectable
class CurrentOrdersCubit extends Cubit<CurrentOrdersState> {
  final ServiceProvidersRepository repository;

  CurrentOrdersCubit({required this.repository})
      : super(CurrentOrdersState(state: CurrentOrdersStatus.initial));

  void fetchOrdersForCategory(String category,String userId) async {
    emit(state.copyWith(state: CurrentOrdersStatus.loading));
    final result = await repository.getCurrentOrdersByCategory(category,userId);

    result.fold(
        (failure) => emit(
              state.copyWith(
                  state: CurrentOrdersStatus.failure,
                  errorMessage: failure.erorr),
            ), (orders) {
      print('###########$orders');
      emit(state.copyWith(
          state: CurrentOrdersStatus.success, reservations: orders));
    });
  }
}

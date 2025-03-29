import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/home_cooked__features/data/data_source/homeCooked_remote_data_source.dart';
import 'package:kamn/home_cooked__features/data/models/delivery_model.dart';
import 'package:kamn/home_cooked__features/data/models/home_cook_model_test.dart';
import 'package:kamn/home_cooked__features/data/repositories/home_cook_repository.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/order_options/order_options_state.dart';

class OrderOptionsCubit extends Cubit<OrderOptionsState> {
  OrderOptionsCubit()
      //{required this.repository}

      : super(OrderOptionsState(state: OrderOptionStatus.initial));

  AddHomeCookRepository repository =
      AddHomeCookRepositoryImpl(dataSource: AddHomeCookRemoteDataSourceImpl());
  TextEditingController? deliveryFeeController = TextEditingController();
  // bool isDeliverySelected = false;
  // bool isPickupSelected = false;
  final deliveryformKey = GlobalKey<FormState>();

  Future<void> uploadDeliveryOption(HomeCookModel homeCookModel) async {
    emit(state.copyWith(state: OrderOptionStatus.loading));

    final result = await repository
        .updateServiceProviderHomeCookAddDeliveryData(homeCookModel);

    result.fold((error) {
      emit(state.copyWith(
        state: OrderOptionStatus.error,
        error: error.erorr,
      ));
    }, (success) {
      emit(state.copyWith(state: OrderOptionStatus.success));
    });

    // if (result != null) {
    //   emit(state.copyWith(state: OrderOptionStatus.success, meal: result));
    // } else {
    //   emit(state.copyWith(
    //     state: OrderOptionStatus.error,
    //     error: "Error",
    //   ));
    // }
  }

  void togglePickupOption(bool isPickupSelected) {
    emit(state.copyWith(isPickupSelected: isPickupSelected));
  }

  void toggleDeliveryOption(bool isDeliverySelected) {
    emit(state.copyWith(isDeliverySelected: isDeliverySelected));
  }

  // void valiadteDeliveryFee() {
  //   if (state.isDeliverySelected || state.isPickupSelected) {
  //     if (state.isDeliverySelected) {
  //       //delivery
  //       if (deliveryformKey.currentState!.validate()) {
  //         uploadDeliveryOption(HomeCookModel(
  //             delivery: DeliveryModel(
  //                 isDelivery: state.isDeliverySelected,
  //                 isPickup: state.isPickupSelected,
  //                 deliveryFee: double.tryParse(deliveryFeeController!.text))));
  //         // emit(state.copyWith(checkboxerror: false));
  //       }
  //     } else {
  //       //bickup
  //       uploadDeliveryOption(HomeCookModel(
  //           delivery: DeliveryModel(
  //         isDelivery: state.isDeliverySelected,
  //         isPickup: state.isPickupSelected,
  //       )));

  //     }
  //   } else {
  //     emit(state.copyWith(checkboxerror: true));
  //   }
  // }
}

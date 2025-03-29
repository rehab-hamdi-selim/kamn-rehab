import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/order_options/order_options_cubit.dart';

import '../../../core/utils/alert_dialog_utils.dart';
import '../cubits/order_options/order_options_state.dart';

class CustomMealCubitListner extends StatelessWidget {
  final Widget child;

  const CustomMealCubitListner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderOptionsCubit, OrderOptionsState>(
        listener: (context, state) {
          if (state.isLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          } else if (state.isSuccess) {
            Navigator.of(context).pop(); // Close the loading dialog
            AlertDialogUtils.showAlert(
              context: context,
              content: "Delivery option added successfully!",
              title: "Success",
            );
          } else if (state.isError) {
            Navigator.of(context).pop();
            AlertDialogUtils.showAlert(
              context: context,
              content: state.error ?? "Error",
              title: "Error",
              firstbutton: "OK",
            );
          }
        },
        child: child);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';

import '../../cubits/sports_grounds/sports_ground_cubit.dart';
import '../../cubits/sports_grounds/sports_ground_state.dart';

class CustomGroundsBlocListner extends StatelessWidget {
  final Widget child;
  const CustomGroundsBlocListner({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SportsGroundsCubit, SportsGroundsState>(
      listener: (context, state) {
        if (state.state == SportsGroundsStatus.initial) {
          SportsGroundsCubit.get(context).getPlaygrounds();
        }
        if (state.isFailure) {
          showSnackBar(
              context, state.erorrMessage ?? "There is un expected error");
          print(state.erorrMessage);
        }
      },
      child: child,
    );
  }
}

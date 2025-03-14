import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';

class CustomAddGymBlocListener extends StatelessWidget {
  const CustomAddGymBlocListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddGymCubit>();
    return BlocListener<AddGymCubit, AddGymState>(
      listener: (context, state) {
        if (state.isUploadImagesSuccess) {
          cubit.addGymRequest();
        }
        if(state.isAddGymSuccess){
          print("success adding gym");
        }
      },
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/screen/home_cook_screen.dart';
import 'package:kamn/home_cooked__features/presentation/screen/meal_info_screen.dart';

import '../cubits/add_home_cook/add_home_cook_cubit.dart';
import '../cubits/add_home_cook/add_home_cook_state.dart';

class HomeCookWrapperScreen extends StatelessWidget {
  const HomeCookWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<AddHomeCookCubit, AddHomeCookState>(
            listener: (context, state) {
              if (state.state == AddHomeCookStatus.success) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeCookScreen()));
              } 
            },
            builder: (context, state) {
              if (state.state == AddHomeCookStatus.getHomeCookLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (state.state == AddHomeCookStatus.getHomeCookSuccess) {
                 BlocProvider(
                            create: (context) => getIt<MealCubit>()
                              ..getMeals(state.homeCookModel!.id!
                                    //"u0cBRLRyHcppREpHYdNf"
                                  )
                                  ..initServiceProviderHomeCook(
                                      state.homeCookModel!),
                                child: MealInfoScreen()
                              //AddMealTest(),
                            );
              }
              return const Center(
                  child: Text('Welcome we will navigate to the next screen'));
            },
          ),
        ],
      ),
    );
  }
}

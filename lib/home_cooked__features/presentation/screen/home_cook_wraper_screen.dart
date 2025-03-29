import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/home_cooked__features/data/data_source/homeCooked_remote_data_source.dart';
import 'package:kamn/home_cooked__features/data/repositories/home_cook_repository.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/screen/add_meal_test.dart';
import 'package:kamn/home_cooked__features/presentation/screen/food_etails_info_screen.dart';
import 'package:kamn/home_cooked__features/presentation/screen/home_cook_screen.dart';
import 'package:kamn/home_cooked__features/presentation/screen/order_options_screen.dart';

import '../cubits/add_home_cook/add_home_cook_cubit.dart';
import '../cubits/add_home_cook/add_home_cook_state.dart';

class HomeCookWrapperScreen extends StatelessWidget {
  const HomeCookWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocConsumer<AddHomeCookCubit, AddHomeCookState>(
            listener: (context, state) {
              if (state.state == AddHomeCookStatus.getHomeCookError) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeCookScreen()));
              } else if (state.state == AddHomeCookStatus.getHomeCookSuccess) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => MealCubit(AddHomeCookRepositoryImpl(dataSource: AddHomeCookRemoteDataSourceImpl()))..getMeals("u0cBRLRyHcppREpHYdNf"),
                              child: AddMealTest(),
                            )));
              }
            },
            builder: (context, state) {
              if (state.state == AddHomeCookStatus.getHomeCookLoading) {
                return const Center(child: CircularProgressIndicator());
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

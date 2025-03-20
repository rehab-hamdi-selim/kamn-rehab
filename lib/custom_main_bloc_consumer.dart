import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/routing/app_router.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/gym_feature/gyms/presentation/screen/choose_plan_screen.dart';
import 'package:kamn/healthy_food_features/presentation/screens/searching_ui_screen.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_review_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/screen/meal_review_screen.dart';
import 'package:kamn/home_cooked__features/presentation/screen/order_options_screen.dart';
import 'package:kamn/playground_feature/authentication/presentation/screens/on_boarding_screen.dart';

import 'core/common/cubit/app_user/app_user_cubit.dart';
import 'core/common/widget/main_loader.dart';

class CustomMainBlocConsumer extends StatelessWidget {
  const CustomMainBlocConsumer({super.key});

  //////

  @override
  Widget build(BuildContext context) {
    final appUserCubit = context.read<AppUserCubit>();

    return BlocConsumer<AppUserCubit, AppUserState>(
      listener: (context, state) async {
        if (state.isInstalled()) {
          appUserCubit.isUserLoggedIn();
        } else if (state.isLoggedIn()) {
          await appUserCubit.getUser(uid: state.user!.uid);
        } else if (state.isGettedData()) {
          appUserCubit.saveUserData(state.user!);
        } else if (state.isFailureSaveData()) {
          showSnackBar(context, state.errorMessage ?? "UnExpected error");
          appUserCubit.signOut();
        } else if (state.isFailure()) {
          showSnackBar(context, state.errorMessage ?? "UnExpected error");
        } else if (state.isSignOut()) {
          appUserCubit.clearUserData();
        } else if (state.isClearUserData()) {
          appUserCubit.isUserLoggedIn();
        }
      },
      builder: (context, state) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: AppRouter.generateRoute,
            home: BlocProvider(
                create: (context) => MealReviewCubit(),
                child: MealReviewScreen())
            //OrderOptionsHomecook()
            // MealReviewScreen()
            );
        //home: _buildHomeWidget(state, appUserCubit));
      },
    );
  }

  Widget _buildHomeWidget(AppUserState state, AppUserCubit appUserCubit) {
    if (state.isInitial()) {
      return const MainLoader();

      //////////////////
    }
    if (state.isNotInstalled()) {
      return const OnBoardingScreen();
    }
    if (state.isLoggedIn() || state.isGettedData() || state.isSuccess()) {
      return const ChoosePlanScreen();
      // return BlocProvider(
      //   create:(context)=> getIt<SelectCategoryCubit>()..getPlaygrounds(),
      //   child: const SelectCategoryScreen(),
      // );
    }
    if (state.isNotLoggedIn() || state.isClearUserData()) {
      return const SearchingUiScreen();
      // return BlocProvider(
      //   create: (context) => getIt<SignInCubit>(),
      //   child: const SignInScreen(),
      // );
    }
    return const MainLoader();
  }
}

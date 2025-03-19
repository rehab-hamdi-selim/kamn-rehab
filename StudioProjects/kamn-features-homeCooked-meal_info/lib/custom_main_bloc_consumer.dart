import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/routing/app_router.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/healthy_food_features/presentation/screens/searching_ui_screen.dart';

import 'core/common/cubit/app_user/app_user_cubit.dart';

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
            home: const SearchingUiScreen());
            //home: _buildHomeWidget(state, appUserCubit));
      },
    );
  }

}

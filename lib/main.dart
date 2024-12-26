// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/class/custom_splash_screen.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/common/widget/upgrader.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/routing/app_router.dart';
import 'package:kamn/init_dependencies.dart';
import 'package:upgrader/upgrader.dart';
import 'analitics.dart';
import 'core/common/cubit/firebase_remote_config/firebase_remote_config_cubit.dart';
import 'core/routing/routes.dart';

void main() async {
  await initDependencies();

  // Configure dependencies before using GetIt
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<AppUserCubit>()
              ..isFirstInstallation()
              ..isUserLoggedIn()),
        BlocProvider(
            create: (context) => FirebaseRemoteConfigCubit()
              ..initListner()
              ..getStringValue('test')
              ..getStringValue('app_version')),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute : AppRouter.generateRoute,
          home: BlocListener<AppUserCubit, AppUserState>(
            listener: (context, state) async {
              await Future.delayed(const Duration(seconds: 2));

              if (state.isNotInstalled()) {
                Navigator.pushNamed(context, Routes.onBoardingScreen);
                context.read<AppUserCubit>().saveInstallationFlag();
              } else {
                if (state.isLoggedIn()) {
                  await context
                      .read<AppUserCubit>()
                      .getUser(uid: state.user!.uid);
                } else if (state.isGettedData()) {
                  context.read<AppUserCubit>().saveUserData(
                        state.user!,
                      );
                } else if (state.isSuccess()) {
                  Navigator.pushNamed(context, Routes.groundsScreen);
                } else if (state.isNotLoggedIn()) {
                  Navigator.pushNamed(context, Routes.signInScreen);
                }
              }
            },
            child: const CustomSplashScreen(),
          ),
        ),
      ),
    );
  }
}


// BlocListener<AppUserCubit, AppUserState>(
//             listener: (context, state) async {
//               await Future.delayed(const Duration(seconds: 2));

//               if (state.isLoggedIn()) {
//                 if (state.user?.type == 'normal') {
//                   Navigator.pushNamed(context, Routes.groundsScreen);
//                 } else {
//                   Navigator.pushNamed(context, Routes.serviceSelection);
//                 }
//               } else if (state.isNotLoggedIn()) {
//                 Navigator.pushNamed(context, Routes.onBoardingScreen);
//               }
//             },
//             child: const CustomSplashScreen(),
//           ),
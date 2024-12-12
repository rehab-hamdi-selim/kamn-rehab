import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc/bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/helpers/bloc_observer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/features/authentication/presentation/screens/on_boarding_screen.dart';

import 'package:kamn/firebase_options.dart';
import 'package:kamn/test_login.dart';
import 'core/routing/app_router.dart';

import 'features/authentication/data/data_source/auth_remote_data_source.dart';
import 'features/authentication/data/repositories/auth_repository.dart';
import 'features/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'features/authentication/presentation/cubits/sign_up_cubit/sign_up_view_model.dart';
import 'features/authentication/presentation/screens/sign_in_screen.dart';
import 'features/authentication/presentation/screens/sign_up_screen.dart';

import 'features/sports_service_providers/presentation/screens/service_provider_available_dates.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configure dependencies before using GetIt
  configureDependencies();

  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppUserCubit()..isUserLoggedIn(),
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
          home: BlocListener<AppUserCubit, AppUserState>(
            listener: (context, state) {
              if (state.isLoggedIn()) {
                Navigator.pushNamed(context, Routes.groundsScreen);
              } else if (state.isNotLoggedIn()) {
                Navigator.pushNamed(context, Routes.groundsScreen);
              }
              // Loading state or other states
            },
            child: const OnBoardingScreen(),
          ),
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}

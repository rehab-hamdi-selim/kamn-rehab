import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
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
            create: (context) => getIt<AppUserCubit>()..isUserLoggedIn()),
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
          initialRoute: Routes.groundsScreen,
          onGenerateRoute: AppRouter.generateRoute,
          // home: const CustomUpgrader(
          //   child: FirebaseAnalitics(),
          // ),
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
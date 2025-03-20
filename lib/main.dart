import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/healthy_food_features/presentation/screens/home_page_screen.dart';
import 'package:kamn/init_dependencies.dart';

void main() async {
  await initDependencies();
  configureDependencies();

//  await initDependencies();
//  configureDependencies();
  // runApp(  DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(), // Wrap your app
  // ),);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          );
        },
        child: HomePageHealthyFoodScreen());
    // return  ScreenUtilInit(
    //   designSize: Size(375, 812),
    //   minTextAdapt: true,
    //   splitScreenMode: true,
    //   child: HomePageHealthyFoodScreen(),
    // );

    //   MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (context) => getIt<AppUserCubit>()..isFirstInstallation(),
    //     ),
    //     BlocProvider(
    //       create: (context) => FirebaseRemoteConfigCubit()
    //         ..initListner()
    //         ..getStringValue('test')
    //         ..getStringValue('app_version'),
    //     ),
    //   ],
    //   child: const ScreenUtilInit(
    //     designSize: Size(375, 812),
    //     minTextAdapt: true,
    //     splitScreenMode: true,
    //     child: CustomMainBlocConsumer(),
    //   ),
    // );
  }
}

// ignore_for_file: use_build_context_synchronously

// void main() async {
//   await initDependencies();
//   configureDependencies();
//   // runApp(  DevicePreview(
//   //   enabled: !kReleaseMode,
//   //   builder: (context) => const MyApp(), // Wrap your app
//   // ),);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => getIt<AppUserCubit>()..isFirstInstallation(),
//         ),
//         BlocProvider(
//           create: (context) => FirebaseRemoteConfigCubit()
//             ..initListner()
//             ..getStringValue('test')
//             ..getStringValue('app_version'),
//         ),
//       ],
//       child: const ScreenUtilInit(
//         designSize: Size(375, 812),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         child: CustomMainBlocConsumer(),
//       ),
//     );
//   }
// }

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

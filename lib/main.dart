// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/healthy_food_features/presentation/screens/my_cart_screen.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: MyCartScreen(),
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            // Optional: prevent font scaling across devices
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
        );
      },
    );
  }
}

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
//           create: (context) => getIt<AppUserCubit>()
//             ..getUser(uid: "uGTn2GsdCMeTTjsrIERAfbLXaYW2"),
//         ),
//         BlocProvider(create: (context) => CartCubit()),
//         BlocProvider(
//           create: (context) => OrderCubit(OrderRepositoryImpl()),
//         ),
//         BlocProvider(
//             create: (context) => TestMealsCubit(TestMealsRepositoryImpl(
//                 TestMealsDataSourceImpl(FirebaseFirestore.instance)))),
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
//           ),

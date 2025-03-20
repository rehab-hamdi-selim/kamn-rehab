import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kamn/home_cooked__features/presentation/screen/meal_info_screen.dart';
void main() async{
   WidgetsFlutterBinding.ensureInitialized(); 
  await initializeDateFormatting('en'); 
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MealInfoScreen(),
        );
      },
    ),
  );
}


// ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
// import 'package:kamn/core/di/di.dart';
// import 'package:kamn/custom_main_bloc_consumer.dart';
// import 'package:kamn/init_dependencies.dart';

// import 'core/common/cubit/firebase_remote_config/firebase_remote_config_cubit.dart';

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
//       child:  ScreenUtilInit(
//         designSize: Size(375, 812),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         child: MealInfoScreen(),
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
//),
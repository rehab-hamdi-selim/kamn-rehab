// ignore_for_file: use_build_context_synchronously

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kamn/home_cooked__features/presentation/screen/test.dart';

// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     ScreenUtilInit(
//       designSize: const Size(375, 812), // Adjust based on your design
//       minTextAdapt: true,  // Ensures proper text scaling
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: HomeCookedScreen(),
//         );
//       },
//     ),
//   );
// }




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Cook Registration',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: PersonalInfoScreen(),
    );
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
//           ),
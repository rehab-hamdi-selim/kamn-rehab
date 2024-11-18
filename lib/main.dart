import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/firebase_options.dart';
import 'package:kamn/features/authantication/presentation/screens/sign_in_screen.dart';
import 'package:kamn/test_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Check if user is logged in and get token
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    // Get the token
    final token = await currentUser.getIdToken();
    print('User is logged in');
    print('User ID: ${currentUser.uid}');
    print('User Email: ${currentUser.email}');
    print('User Token: $token');
  } else {
    print('No user is logged in');
  }

  configureDependencies();
  await ScreenUtil.ensureScreenSize();
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              return const LogoutScreen(); // User is logged in
            }

            return const SignInScreen(); // User is not logged in
          },
        ),
      ),
    );
  }
}//

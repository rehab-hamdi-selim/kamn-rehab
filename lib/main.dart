import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/firebase_options.dart';
import 'features/sports/presentation/screens/grounds_screen.dart';
import 'init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDependencies();
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
        // home: BlocProvider(
        //   create: (context) => ServiceProviderCubit(
        //       repository: ServiceProvidersRepositoryImpl(
        //           dataSource: ServiceProvidersRemoteDataSourceImpl(
        //               storage: FirebaseStorage.instance,
        //               firestore: FirebaseFirestore.instance))),
        //   child:  const GroundsScreen(),
        // ),
        home: const GroundsScreen(),
      ),
    );
  }
}

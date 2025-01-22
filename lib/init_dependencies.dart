import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/firebase_options.dart';

import 'core/erorr/custom_error_screen.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/utils/location_permission_handler.dart';

Future<void> initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  // Request both permissions and location check
  await LocationPermissionHandler.checkAndRequestPermission();
  await LocationPermissionHandler.handleLocationPermission();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //custom error screen
  customErorrScreen();

  //system ui mode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  //bloc observer

  Bloc.observer = MyBlocObserver();

  //crashlytics
  // FlutterError.onError = (details) {
  //   FirebaseCrashlytics.instance.recordFlutterError(details);
  // };
  // PlatformDispatcher.instance.onError = (error, stackTrace) {
  //   FirebaseCrashlytics.instance.recordError(error, stackTrace);
  //   return true;
  // };

  //remote config

  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  await FirebaseRemoteConfig.instance.setDefaults({
    "test": "test",
    // Add other default values here
  });

  await FirebaseRemoteConfig.instance.fetchAndActivate();
}

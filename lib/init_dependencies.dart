import 'package:bloc/bloc.dart';

import 'package:flutter/services.dart';

import 'package:get_it/get_it.dart';

import 'core/common/cubit/app_user/app_user_cubit.dart';
import 'core/erorr/custom_error_screen.dart';
import 'core/helpers/bloc_observer.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  customErorrScreen();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  Bloc.observer = MyBlocObserver();

  // serviceLocator.registerLazySingleton(() => AppUserCubit());
}

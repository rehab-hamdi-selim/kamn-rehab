import 'package:bloc/bloc.dart';

import 'package:flutter/services.dart';

import 'package:get_it/get_it.dart';
import 'package:kamn/core/common/class/firestore_services.dart';

import 'core/common/cubit/app_user/app_user_cubit.dart';
import 'core/erorr/custom_error_screen.dart';
import 'core/helpers/bloc_observer.dart';
import 'mvc/controller/playgrounds_controller.dart';
import 'mvc/model/playgrounds_data_source_mvc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  customErorrScreen();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  Bloc.observer = MyBlocObserver();

  //serviceLocator.registerLazySingleton(() => AppUserCubit());

  // Register FirestoreService
  serviceLocator
      .registerLazySingleton<FirestoreService>(() => FirestoreService());

  // Register GetGroundsDataSource
  serviceLocator.registerLazySingleton<GetGroundsDataSourceMVC>(() =>
      GetGroundsDataSourceMVC(
          firestoreServices: serviceLocator<FirestoreService>()));

  // Register GetGroundsController
  serviceLocator.registerFactory<GetGroundsControllerMVC>(() =>
      GetGroundsControllerMVC(
          dataSource: serviceLocator<GetGroundsDataSourceMVC>()));
}

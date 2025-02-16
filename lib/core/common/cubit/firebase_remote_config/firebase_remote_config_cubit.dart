import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';
import 'firebase_remote_config_state.dart';

@injectable
class FirebaseRemoteConfigCubit extends Cubit<FirebaseRemoteConfigState> {
  final FirebaseRemoteConfig _remoteConfig;

  FirebaseRemoteConfigCubit({FirebaseRemoteConfig? remoteConfig})
      : _remoteConfig = remoteConfig ?? FirebaseRemoteConfig.instance,
        super(FirebaseRemoteConfigState(
            state: FirebaseRemoteConfigStatus.initial));

  void initListner() {
    _remoteConfig.onConfigUpdated.listen((event) async {
      // Activate the fetched values
      await _remoteConfig.activate();

      // Get updated value
      getStringValue(event.updatedKeys.first);
    });
  }

  bool getBoolValue(String key) {
    try {
      final value = _remoteConfig.getBool(key);
      emit(state.copyWith(
        state: FirebaseRemoteConfigStatus.getValue,
        isEnabled: value,
      ));
      return value;
    } catch (e) {
      emit(state.copyWith(
        state: FirebaseRemoteConfigStatus.failure,
        errorMessage: e.toString(),
      ));
      return false;
    }
  }

  void getStringValue(String key) {
    try {
      emit(state.copyWith(state: FirebaseRemoteConfigStatus.loading));
      String value = _remoteConfig.getString(key);

      // Initialize configValues if it's null
      final updatedConfigValues = state.configValues ?? {};
      updatedConfigValues[key] = value; // Add the new value

      emit(state.copyWith(
        state: FirebaseRemoteConfigStatus.getValue,
        configValues: updatedConfigValues, // Use the updated map
      ));
    } catch (e) {
      emit(state.copyWith(
        state: FirebaseRemoteConfigStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  int getIntValue(String key) {
    try {
      return _remoteConfig.getInt(key);
    } catch (e) {
      emit(state.copyWith(
        state: FirebaseRemoteConfigStatus.failure,
        errorMessage: e.toString(),
      ));
      return 0;
    }
  }

  double getDoubleValue(String key) {
    try {
      return _remoteConfig.getDouble(key);
    } catch (e) {
      emit(state.copyWith(
        state: FirebaseRemoteConfigStatus.failure,
        errorMessage: e.toString(),
      ));
      return 0.0;
    }
  }

  @override
  Future<void> close() {
    _remoteConfig.onConfigUpdated.listen((event) {}).cancel();
    return super.close();
  }
}

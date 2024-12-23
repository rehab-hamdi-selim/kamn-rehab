import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' show Platform;
import 'package:upgrader/upgrader.dart';

import '../cubit/firebase_remote_config/firebase_remote_config_cubit.dart';
import '../cubit/firebase_remote_config/firebase_remote_config_state.dart';

class CustomUpgrader extends StatelessWidget {
  final Widget child;
  const CustomUpgrader({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseRemoteConfigCubit, FirebaseRemoteConfigState>(
      builder: (context, state) {
        print(state.configValues?['app_version']);
        return UpgradeAlert(
          dialogStyle: Platform.isAndroid
              ? UpgradeDialogStyle.material
              : UpgradeDialogStyle.cupertino,
          upgrader: Upgrader(
            debugLogging: true,
            debugDisplayAlways: true,
            languageCode: "ar",
            messages: UpgraderMessages(code: "ar"),
            countryCode: "EG",
            minAppVersion: state.configValues?['app_version'] ?? 'def',
          ),
          onUpdate: () {
            if (Platform.isAndroid) {
            } else {}
            return true; // Ensure to return a boolean value
          },
          child: child,
        );
      },
    );
  }
}

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/cubit/firebase_remote_config/firebase_remote_config_cubit.dart';
import 'core/common/cubit/firebase_remote_config/firebase_remote_config_state.dart';

class FirebaseAnalitics extends StatefulWidget {
  const FirebaseAnalitics({super.key});

  @override
  State<FirebaseAnalitics> createState() => _FirebaseAnaliticsState();
}

class _FirebaseAnaliticsState extends State<FirebaseAnalitics> {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
  }

  void logEvent(String eventName) {
    final timestamp = DateTime.now().toIso8601String();

    analytics.logEvent(name: eventName, parameters: {
      "Time": timestamp,
      "eventType": "osmama",
    });
    print("Event logged: $eventName at $timestamp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      BlocBuilder<FirebaseRemoteConfigCubit, FirebaseRemoteConfigState>(
        builder: (context, state) {
          return Text(state.configValues?['test'] ?? 'def');
        },
      ),
      const Text("test"),
      ElevatedButton(
          onPressed: () => logEvent("test"),
          child: const Text("Firebase Analytics")),
      ElevatedButton(
          onPressed: () => FirebaseCrashlytics.instance.crash(),
          child: const Text("Firebase Crashlytics"))
    ])));
  }
}

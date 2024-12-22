import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

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
            child: ElevatedButton(
                onPressed: () => logEvent("test"),
                child: const Text("Firebase Analytics"))));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: RiveAnimation.asset(
          "assets/images/loading.riv",
        ),
      ),
    );
  }
}

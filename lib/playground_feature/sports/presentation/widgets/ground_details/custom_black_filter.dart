import 'package:flutter/material.dart';

class CustomBlackFilter extends StatelessWidget {
  const CustomBlackFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.transparent],
              stops: [0.03, 0.1]),
        ),
      ),
    );
  }
}

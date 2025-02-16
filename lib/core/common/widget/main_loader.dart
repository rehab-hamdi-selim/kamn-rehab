import 'package:flutter/material.dart';
import 'package:kamn/core/common/widget/loader.dart';

class MainLoader extends StatelessWidget {
  const MainLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Loader(),
      ),
    );
  }
}

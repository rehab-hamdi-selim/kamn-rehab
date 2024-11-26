import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_app_bar.dart';

class ProceedPaymentScreen extends StatelessWidget {
  const ProceedPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomAppBar.appBar(
          arrowFunction: () {},
          notificationIconFunction: () {},
          profileFunction: () {},
          badgesIconFunction: () {},
          backGroundColor: AppPallete.whiteColor),
      body: const Column(
        children: [Text('Create')],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_gym_app_bar.dart';

class AddGymScreen extends StatelessWidget {
  const AddGymScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGymAppBar.appBar(
          color: AppPallete.whiteColor,
          context: context,
          notificationIconFunction: () {},
          badgesIconFunction: () {},
        ),
      body: Column(children: [
        
      ],),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/admin/presentation/widgets/welcome_admin_screen/custom_elevation_button.dart';

class WelcomeAdminPage extends StatelessWidget {
  const WelcomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Lightning bolt icon from assets (PNG or JPG)
          Image.asset(
            alignment: Alignment.topRight,
            ImageLinks.welcomeImg, // Path to your asset
            height: 625.66,
            width: 243,
          ),

          // Welcome text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Constants.welcomeToManagementSystem,
              textAlign: TextAlign.left,
              style: TextStyles.font24BlackInterColorMedium,
            ),
          ),
          verticalSpace(40),

          // Next button
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: const CustomWelcomeElevationButton(),
          ),
        ],
      ),
    );
  }
}

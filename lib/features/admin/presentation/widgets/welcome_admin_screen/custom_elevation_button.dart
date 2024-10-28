import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/admin/presentation/screens/login_screen/login.dart';

class CustomWelcomeElevationButton extends StatelessWidget {
  const CustomWelcomeElevationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 308,
      child: ElevatedButton(
        iconAlignment: IconAlignment.start,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.mainColor, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Next', style: TextStyles.font24WhiteInterColorMedium),
            // SizedBox(width: 8),
            verticalSpace(8),

            Icon(
              color: AppPallete.whiteColor,
              weight: 600,
              size: 25,
              Icons.arrow_forward,
            ),
          ],
        ),
      ),
    );
  }
}

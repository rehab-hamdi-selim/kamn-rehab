import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class ChooseAtLeastOnePlan extends StatelessWidget {
  const ChooseAtLeastOnePlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // Add rounded corners
        image: const DecorationImage(
          image: AssetImage('assets/images/Frame_membership_offer.png'),
          fit: BoxFit.fill,
        ),
      ),
      clipBehavior: Clip.hardEdge, // Ensures image follows border radius
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20, right: 20),
        child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Ensures left alignment
            children: [
              Text(
                'Choose at least 1 plan',
                textAlign: TextAlign.left,
                style: TextStyles.fontCircularSpotify16BlackMedium
                    .copyWith(color: AppPallete.whiteColor),
              ),
              SizedBox(height: 5.h), // Add spacing between texts if needed
              Text(
                'To make your gym available for users to book, you must add at least one membership plan',
                textAlign: TextAlign.left,
                style: TextStyles.fontCircularSpotify12BlackMedium
                    .copyWith(color: AppPallete.lightGreyColor),
              ),
              SizedBox(height: 5.h),
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class AddMempershipOfferCard extends StatelessWidget {
  const AddMempershipOfferCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // Add rounded corners
          image: const DecorationImage(
            image: AssetImage('assets/images/Frame_offer_card.png'),
            fit: BoxFit.fill,
          ),
        ),
        clipBehavior: Clip.hardEdge, // Ensures image follows border radius
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 20.0, left: 30, right: 30),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Ensures left alignment
            children: [
              Text(
                'Next Step: Add Membership Offer',
                textAlign: TextAlign.left,
                style: TextStyles.fontCircularSpotify16BlackMedium
                    .copyWith(color: AppPallete.whiteColor),
              ),
              SizedBox(height: 5.h), // Add spacing between texts if needed
              Text(
                'Add Membership Plans to Publish Your Gym',
                textAlign: TextAlign.left,
                style: TextStyles.fontCircularSpotify12BlackMedium
                    .copyWith(color: AppPallete.lightGreyColor),
              ),
              SizedBox(height: 5.h), // Add spacing between texts if needed
              SizedBox(height: 10.h),
              Text(
                'To make your gym available for users to book, you must add at least one membership plan. Provide clear details, including duration, price, and benefits, to attract potential members.',
                textAlign: TextAlign.left,
                style: TextStyles.fontCircularSpotify12BlackRegular
                    .copyWith(color: AppPallete.lightWiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}

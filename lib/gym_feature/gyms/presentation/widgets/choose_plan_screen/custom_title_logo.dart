import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomTitleLogo extends StatelessWidget {
  const CustomTitleLogo({super.key, required this.logo});
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Choose Membership Plan",
          style: TextStyle(
            fontFamily: 'CircularSpotify',
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20.sp, // Use ScreenUtil for font size
          ),
        ),
        Text(
          "Select a plan that suits your fitness goals!",
          style: TextStyle(
            fontFamily: 'CircularSpotify',
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
            fontSize: 10.sp, // Use ScreenUtil for font size
          ),
        ),
        SizedBox(height: 30.h),
        Center(
          child: CircleAvatar(
            radius: 30.w, // Responsive radius using ScreenUtil
            backgroundColor:
                Colors.transparent, // Optional: Transparent background
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: logo,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        Text(
          "Gold's Gym",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp, // Use ScreenUtil for font size
            fontWeight: FontWeight.w500,
            fontFamily: 'CircularSpotify',
          ),
        ),
        Text(
          "@goldsgymalex",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.sp, // Use ScreenUtil for font size
            fontWeight: FontWeight.w400,
            fontFamily: 'CircularSpotify',
          ),
        ),
          Text(
                "Select features for your membership, adjust sessions or months, and see the total price update instantly. You can modify features before finalizing your plan.",
                style: TextStyle(
                  fontSize: 10.sp, // Use ScreenUtil for font size
                  fontWeight: FontWeight.bold,
                ),
              ),
      ],
    );
  }
}

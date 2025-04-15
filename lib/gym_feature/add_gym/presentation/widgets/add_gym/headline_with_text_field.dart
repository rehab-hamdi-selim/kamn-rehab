import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class HeadlineWithTextField extends StatelessWidget {
  const HeadlineWithTextField({
    super.key,
    required this.headLine,
    required this.subtitle,
    required this.hintText,
  });

  final String headLine;
  final String subtitle;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      headLine,
                      textAlign: TextAlign.center,
                      style: TextStyles.fontCircularSpotify16BlackMedium
                          .copyWith(color: AppPallete.accentBlackColor),
                    ),
                    Text(
                      subtitle,
                      style: TextStyles
                          .fontCircularSpotify10darkGreyColorRegular
                          .copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 14.89.h,
                          vertical: 11.75.h,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.75.h),
                          borderSide: const BorderSide(
                            width: 0.50,
                            color: AppPallete.witeColorShade,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.75.h),
                          borderSide: const BorderSide(
                            width: 0.50,
                            color: AppPallete.witeColorShade,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.75.h),
                          borderSide: const BorderSide(
                            width: 0.50,
                            color: AppPallete.witeColorShade,
                          ),
                        ),
                      ),
                      style: TextStyles.fontCircularSpotify12BlackRegular,
                      initialValue: hintText,
                      //  readOnly: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

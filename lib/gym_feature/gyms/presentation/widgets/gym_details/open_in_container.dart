import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme/style.dart';

class OpenInContainer extends StatelessWidget {
  const OpenInContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: AppPallete.shadeOfGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Open in:", style: TextStyles.fontCircularSpotify16BlackMedium),
          const SizedBox(height: 8),
          Container(
            width: 350.w,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppPallete.lightGreyColor),
                        borderRadius: BorderRadius.circular(10),
                        color: AppPallete.shadeOfGray),
                    child: Text(
                      "Saturday & Sunday",
                      style: TextStyles.fontCircularSpotify10BlackRegular,
                    )),
                Row(
                  spacing: 5,
                  children: [
                    const Icon(Icons.wb_sunny_outlined, size: 10),
                    Text(
                      "10:00",
                      style: TextStyles.fontCircularSpotify10BlackMedium
                          .copyWith(fontWeight: FontWeightHelper.semiBold),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      size: 15,
                    ),
                    const Icon(
                      Icons.dark_mode_outlined,
                      size: 15,
                    ),
                    Text(
                      "4:00",
                      style: TextStyles.fontCircularSpotify10BlackMedium
                          .copyWith(fontWeight: FontWeightHelper.semiBold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 350.w,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppPallete.lightGreyColor),
                        borderRadius: BorderRadius.circular(10),
                        color: AppPallete.shadeOfGray),
                    child: Text(
                      "Monday & Friday",
                      style: TextStyles.fontCircularSpotify10BlackRegular,
                    )),
                Row(
                  spacing: 5,
                  children: [
                    const Icon(Icons.wb_sunny_outlined, size: 10),
                    Text(
                      "05:00",
                      style: TextStyles.fontCircularSpotify10BlackMedium
                          .copyWith(fontWeight: FontWeightHelper.semiBold),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      size: 15,
                    ),
                    const Icon(
                      Icons.dark_mode_outlined,
                      size: 15,
                    ),
                    Text(
                      "11:00",
                      style: TextStyles.fontCircularSpotify10BlackMedium
                          .copyWith(fontWeight: FontWeightHelper.semiBold),
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

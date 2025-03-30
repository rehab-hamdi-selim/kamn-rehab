import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme/style.dart';

Widget buildSocialLink({
  required IconData icon,
  required String text,
  Color? color,
  LinearGradient? gradient,
}) {
  return Container(
    width: 400.w,
    height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      gradient: gradient ?? LinearGradient(colors: [color!, color]),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(icon, color: Colors.white),
          label: Text(text,
              style: TextStyles.fontCircularSpotify10BlackMedium.copyWith(
                  color: Colors.white, fontWeight: FontWeightHelper.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ).copyWith(
            foregroundColor: WidgetStateProperty.all(Colors.transparent),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            overlayColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ),
        const Icon(
          Icons.arrow_outward_sharp,
          color: Colors.white,
          size: 20,
        )
      ],
    ),
  );
}

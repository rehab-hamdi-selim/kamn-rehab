import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({
    super.key,
    required this.features,
  });

  final List features;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 900.w,
      height: 240,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 15,
              childAspectRatio: 6),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  color: AppPallete.shadeOfGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  features[index],
                  style: TextStyles.fontCircularSpotify8AccentBlackRegular
                      .copyWith(fontSize: 10, fontWeight: FontWeight.w500),
                  textDirection: TextDirection.ltr,
                ),
              ),
            );
          }),
    );
  }
}

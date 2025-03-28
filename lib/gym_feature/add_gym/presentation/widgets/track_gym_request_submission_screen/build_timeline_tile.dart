import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:timeline_tile/timeline_tile.dart';

class BuildTimelineTile extends StatelessWidget {
  const BuildTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.titleColor,
    required this.description,
    required this.descriptionColor,
    this.isNextGray = true,
    this.isDone = false,
    this.isReview = false,
    this.isCancel = false,
  });

  final bool isFirst;
  final bool isLast;
  final bool isDone;
  final bool isReview;
  final bool isNextGray;
  final bool isCancel;
  final Widget icon;
  final Color iconColor;
  final String title;
  final Color titleColor;
  final String description;
  final Color descriptionColor;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: const LineStyle(color: Colors.transparent, thickness: 0),
      afterLineStyle:
          const LineStyle(color: AppPallete.greenColor, thickness: 2),
      indicatorStyle: IndicatorStyle(
        indicator: icon,
        indicatorXY: 0.1,
        width: 24,
        color: iconColor,

        // iconStyle: IconStyle(
        //   iconData: icon,
        //   color: Colors.white,
        // ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.fontCircularSpotify16Regular.copyWith(
                color: isDone
                    ? AppPallete.greenColor
                    : isReview
                        ? AppPallete.lightDeepOrangeColor
                        : isCancel
                            ? AppPallete.redFontColor
                            : AppPallete.darkGreyColor, // Default color
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyles.fontCircularSpotify12RegularDarkGreyColor,
            ),
          ],
        ),
      ),
    );
  }
}

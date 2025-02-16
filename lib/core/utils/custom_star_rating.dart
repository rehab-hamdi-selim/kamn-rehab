import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomStarRating extends StatelessWidget {
  final double rating; // Current rating
  final double maxRating; // Maximum possible rating
  final int starCount; // Total stars displayed
  final Color filledStarColor; // Color for filled stars
  final Color unfilledStarColor; // Color for unfilled stars
  final double starSize; // Size of stars

  const CustomStarRating({
    super.key,
    required this.rating,
    this.maxRating = 5.0,
    this.starCount = 5,
    this.filledStarColor = AppPallete.lightyellowColor,
    this.unfilledStarColor = Colors.grey,
    this.starSize = 13.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(starCount, (index) {
        // Determine star filling logic
        if (index + 1 < rating.floor()) {
          return Icon(Icons.star,
              color: filledStarColor, size: starSize); // Fully filled star
        } else if (index + 1 < rating) {
          return Icon(Icons.star_half,
              color: filledStarColor, size: starSize); // Half filled star
        } else {
          return Icon(Icons.star_border,
              color: unfilledStarColor, size: starSize); // Empty star
        }
      }),
      horizontalSpace(5.w),
      Text(
        '$rating/$maxRating',
        style: TextStyles.font7InterDimGraySemiBold,
      )
    ]);
  }
}

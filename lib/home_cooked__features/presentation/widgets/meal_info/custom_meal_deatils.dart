import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_duration_cook.dart';

class CustomMealDetails extends StatelessWidget {
  const CustomMealDetails({
    super.key,
    required this.meal,
  });

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 61.w,
          height: 51.h,
          decoration: BoxDecoration(
            color: AppPallete.ofWhiteColor4,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: meal.imageUrls.isNotEmpty && meal.imageUrls[0].isNotEmpty
                ? Image.network(
                    meal.imageUrls[0],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // alternative image in case of error
                      return Image.asset(ImageLinks.emptyimg,
                          fit: BoxFit.cover);
                    },
                  )
                : Image.asset(
                    ImageLinks.emptyimg,
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        horizontalSpace(5),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            meal.name,
            style: TextStyles.fontCircularSpotify10BlackMedium,
          ),
          verticalSpace(4),
          Row(
            children: [
              Text(
                "# ${meal.type}",
                style: TextStyles.fontCircularSpotify10Gray2Regular,
              ),
              horizontalSpace(2),
              CustomDurationCook(
                children: [
                  SvgPicture.asset(IconLinks.durationCook),
                  SizedBox(width: 5.w),
                  Text("${meal.prepTime.toString()} min",
                      style: TextStyles.fontCircularSpotify8AccentBlackRegular),
                ],
              ),
            ],
          ),
          verticalSpace(4),
          CustomDurationCook(children: [
            Text(
              "${meal.calories} 🔥Kcal",
              style: TextStyles.fontCircularSpotify8StealGrayBold,
            )
          ])
        ]),
        horizontalSpace(5),
        Positioned(
            bottom: 1.h,
            child: Row(
              children: [
                Text(
                  Constants.eGP,
                  style: TextStyles.fontCircularSpotify14GreenRegular,
                ),
                Text(
                  meal.price.toString(),
                  style: TextStyles.fontCircularSpotify14BlackRegular,
                )
              ],
            ))
      ],
    );
  }
}

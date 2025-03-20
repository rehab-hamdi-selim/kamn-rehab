import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/style.dart';

class CustomCategories extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final String calories;
  final String description;
  final VoidCallback? onTap;

  const CustomCategories({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.calories,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 60.h,

              child: Container(
                width: 160.w,
                height: 200.h,
                padding:
                const EdgeInsets.only(top: 92, bottom: 2, right: 20, left: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 6,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 2.h),
                    Text(
                      title,
                      style: TextStyles.circularSpotify16BoldDarkBlack,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      description,
                      style: TextStyles.circularSpotify10LightGrey,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '🔥 ',
                                style: TextStyles.circularSpotify10LightGrey,
                              ),
                              TextSpan(
                                text: '$calories kcal',
                                style: TextStyles.circularSpotify10LightGrey,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '$price ',
                                style:
                                    TextStyles.circularSpotify14BoldDarkBlack,
                              ),
                              TextSpan(
                                text: '£GP ',
                                style: TextStyles.circularSpotify10Green,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              child: CircleAvatar(

                radius: 60,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  image,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

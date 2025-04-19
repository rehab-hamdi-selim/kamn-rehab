import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/common/entities/meal_cart_model.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/order_model.dart';
import 'package:kamn/healthy_food_features/presentation/screens/track_order.dart';

class CardInProgress extends StatefulWidget {
  CardInProgress({
    super.key,
    required this.item,
    // required this.meals,
    // required this.index
  });
  final OrderModel item;

  @override
  State<CardInProgress> createState() => _CardInProgressState();
}

class _CardInProgressState extends State<CardInProgress> {
  // final List<MealCartModel> meals;
  @override
  Widget build(BuildContext context) {
    String? selectedMeal;
    final meals = widget.item.meals;
    return Container(
      padding: EdgeInsets.all(10.w),
      width: 343.w,
      height: 170.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.item.createdAt.toString(),
                style: TextStyles.fontCircularSpotify10BlackMedium,
              ),
              Container(
                  width: 62.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    color: AppPallete.warmYellow,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: Center(
                    child: Text(
                      widget.item.status,
                      style:
                          TextStyles.fontCircularSpotify10BlackMedium.copyWith(
                        color: AppPallete.goldenbrown,
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                width: 61.w,
                height: 51.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage(widget.item.meals.first.imageUrls.first),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16.sp)),
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 254.w,
                    child: Row(
                      children: [
                        Text(
                          widget.item.meals.first.name,
                          style: TextStyles.fontCircularSpotify12BlackMedium,
                          softWrap: true,
                        ),
                        Spacer(
                          flex: 3,
                        ),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedMeal,
                              hint: Text(
                                '1- Item',
                                style: TextStyles.circularSpotify10LightGrey,
                              ),
                              isExpanded: true,
                              icon: SvgPicture.asset(
                                'assets/icons/drop_dwon.svg',
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMeal = newValue;
                                });
                              },
                              items: meals.map((meal) {
                                return DropdownMenuItem<String>(
                                  value: meal.name,
                                  child: Text(meal.name),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('Kitchen: Sarah’s House',
                      style: TextStyles.fontCircularSpotify10StealGrayMedium),
                  Text(widget.item.orderId,
                      style: TextStyles.fontCircularSpotify10StealGrayMedium),
                ],
              ),
              // Spacer(),
              // Text(
              //   '1- Item',
              //   style: TextStyles.circularSpotify10LightGrey,
              // ),
              // SvgPicture.asset(
              //   'assets/icons/drop_dwon.svg',
              // )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('£GP ',
                          style: TextStyles.fontCircularSpotify12BlackMedium
                              .copyWith(
                            color: AppPallete.darkGreenColor,
                          )),
                      Text(
                        widget.item.meals.first.price.toString(),
                        style: TextStyles.fontCircularSpotify12BlackMedium,
                      ),
                    ],
                  ),
                  Text(
                    'View details',
                    style: TextStyles.fontCircularSpotify10StealGrayMedium,
                  )
                ],
              ),
              SizedBox(width: 95.w),
              Text('Cancel',
                  style: TextStyles.fontCircularSpotify14AccentBlackMedium
                      .copyWith(color: AppPallete.redColor)),
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {
                  print(
                      "+++++++++++++++++++++++++++++++++++++++++++++++${widget.item.meals}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TrackOrderScreen(id: widget.item.orderId),
                    ),
                  );
                },
                child: Container(
                  width: 91.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                    color: AppPallete.blackColor,
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  child: Center(
                    child: Text(
                      ' Track Order',
                      style: TextStyles.fontCircularSpotify12BlackMedium
                          .copyWith(color: AppPallete.whiteColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
    ;
  }
}

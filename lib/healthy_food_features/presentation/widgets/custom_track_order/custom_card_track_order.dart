import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/common/entities/meal_cart_model.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/order_model.dart';

class CustomCardTrackOrder extends StatefulWidget {
  CustomCardTrackOrder({
    super.key,
    required this.item,
    // required this.order,
    // required this.meals,
    // required this.index
  });
  final MealCartModel item;
  // final OrderModel order;

  @override
  State<CustomCardTrackOrder> createState() => _CustomCardTrackOrderState();
}

class _CustomCardTrackOrderState extends State<CustomCardTrackOrder> {
  // final List<MealCartModel> meals;
  @override
  Widget build(BuildContext context) {
    String? selectedMeal;
    // final meals = widget.item;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        width: 315.w,
        height: 65.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Row(
          children: [
            Container(
              width: 61.w,
              height: 51.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.item.imageUrls.first),
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
                Text(
                  widget.item.name,
                  style: TextStyles.fontCircularSpotify12BlackMedium,
                  softWrap: true,
                ),
                Text('Kitchen: Sarah’s House',
                    style: TextStyles.fontCircularSpotify10StealGrayMedium),
                Text(widget.item.id,
                    style: TextStyles.fontCircularSpotify10StealGrayMedium),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(widget.item.quantity.toString()),
                    Text("item")
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
                Row(
                  children: [
                    Text('£GP ',
                        style: TextStyles.fontCircularSpotify12BlackMedium
                            .copyWith(
                          color: AppPallete.darkGreenColor,
                        )),
                    Text(
                      widget.item.price.toString(),
                      style: TextStyles.fontCircularSpotify12BlackMedium,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

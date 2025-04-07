import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_my_cart/custom_app_bar.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_my_cart/custom_mycart_card.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            CustomCartAppBar(),
            Dismissible(
                key: Key("A"),
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    border: Border(
                        right: BorderSide(
                      color: Color(0xffF8DB8A),
                      width: 5.sp,
                    )),
                    color: Color(0xffFFDB81),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  child: SvgPicture.asset(
                    "assets/icons/pen.svg",
                  ),
                ),
                secondaryBackground: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    border: Border(
                        right: BorderSide(
                      color: AppPallete.redColor,
                      width: 5.sp,
                    )),
                    color: Color(0xffF8C0C0),
                  ),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    "assets/icons/delete.svg",
                  ),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                  } else if (direction == DismissDirection.endToStart) {}
                },
                child: CardMycart())
          ],
        ),
      ),
    );
  }
}

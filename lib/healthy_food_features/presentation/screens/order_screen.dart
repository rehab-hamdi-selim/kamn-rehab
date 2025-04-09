import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_order_screen/custom_app_bar.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_order_screen/custom_tap_bar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            CustomAppBar(),
            CustomTabScreen(),
          ],
        ),
      ),
    );
  }
}

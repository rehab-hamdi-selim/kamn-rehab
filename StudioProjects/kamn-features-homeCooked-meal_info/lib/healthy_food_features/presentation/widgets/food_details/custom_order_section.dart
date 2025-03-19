import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_text.dart';

class CustomOrderSection extends StatefulWidget {
  const CustomOrderSection({super.key});

  @override
  State<CustomOrderSection> createState() => _CustomHealthyFoodState();
}

class _CustomHealthyFoodState extends State<CustomOrderSection> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () =>
                    setState(() => quantity = quantity > 1 ? quantity - 1 : 1)),
            CustomText(quantity.toString(), 14.sp, FontWeight.bold),
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => setState(() => quantity++)),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r))),
          child: CustomText(
              "Order for \${150 * quantity} £GP", 14.sp, FontWeight.bold),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  color: Colors.green,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.check, color: Colors.white),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    // سحب من اليسار لليمين
                  } else if (direction == DismissDirection.endToStart) {
                    // سحب من اليمين لليسار
                  }
                },
                child: CardMycart())
          ],
        ),
      ),
    );
  }
}

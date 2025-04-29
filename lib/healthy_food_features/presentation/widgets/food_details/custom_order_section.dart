import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/common/widget/loader.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';
import 'package:kamn/healthy_food_features/presentation/screens/my_cart_screen.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_my_cart/counter.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_text.dart';
import 'package:kamn/healthy_food_features/presentation/screens/cart_screen.dart';

class CustomOrderSection extends StatefulWidget {
  final double price;
  final TestMealModel meal;

  const CustomOrderSection({
    super.key,
    required this.price,
    required this.meal,
  });

  @override
  State<CustomOrderSection> createState() => _CustomOrderSectionState();
}

class _CustomOrderSectionState extends State<CustomOrderSection> {
  int quantity = 1;

  void decreaseQuantity() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (quantity > 0) {
        setState(() {
          quantity--;
        });
      }
    });
  }

  void increaseQuantity() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        quantity++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        return Container(
          width: 375.w,
          height: 74.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 0,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Row(
            children: [
              Counter(
                counter: quantity,
                onDecrease: decreaseQuantity,
                onIncrease: increaseQuantity,
              ),
              Spacer(
                flex: 1,
              ),
              ElevatedButton(
                onPressed: () {
                  _handleOrder(context, true);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: CustomText(
                  "Order for ${widget.price * quantity} £GP",
                  14.sp,
                  FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10.w,
              )
            ],
          ),
        );
      },
    );
  }

  void _handleOrder(BuildContext context, bool isGoToCart) {
    if (isGoToCart) {
      context.read<AppUserCubit>().getCartWithQuantities();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyCartScreen()),
      );
    } else {
      context.read<AppUserCubit>().addToCart(widget.meal);
    }
  }
}

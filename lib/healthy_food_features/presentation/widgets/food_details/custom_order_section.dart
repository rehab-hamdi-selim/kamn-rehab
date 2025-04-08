import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/common/widget/loader.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_text.dart';
import 'package:kamn/healthy_food_features/presentation/screens/cart_screen.dart';

class CustomOrderSection extends StatelessWidget {
  final double price;
  final TestMealModel meal;

  const CustomOrderSection({
    super.key,
    required this.price,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        final quantity = state.currentMealQuantity ?? 1;
        if (state.isLoadingCart()) {
          return const CircularProgressIndicator();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 0) {
                      context.read<AppUserCubit>().removeFromCart(meal);
                    }
                  },
                ),
                CustomText(quantity.toString(), 14.sp, FontWeight.bold),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _handleOrder(context, false);
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _handleOrder(context, true);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: CustomText(
                "Order for ${price * quantity} £GP",
                14.sp,
                FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleOrder(BuildContext context, bool isGoToCart) {
    if (isGoToCart) {
      context.read<AppUserCubit>().getCartWithQuantities();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CartScreen()),
      );
    } else {
      context.read<AppUserCubit>().addToCart(meal);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_state.dart';

class CustomDiscounteBox extends StatelessWidget {
  const CustomDiscounteBox({
    super.key, 
    required this.price, 
    required this.discountPercentage,
  });

  final double price;
  final double discountPercentage;

  double getDiscountedPrice(BuildContext context) {
    final discount = (price * discountPercentage) / 100;
    final finalPrice = price - discount;
    
    // Update price after discount in state
    context.read<MembershipOfferCubit>().updatePriceAfterDiscount(finalPrice);
    
    return finalPrice;
  }

  String get formattedOriginalPrice => 'EGP${price.toStringAsFixed(2)}';
  String formattedDiscountedPrice(BuildContext context) => 
      'EGP${getDiscountedPrice(context).toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 9.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            formattedOriginalPrice,
            style: TextStyles.fontCircularSpotify12GrayRegular.copyWith(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: AppPallete.violetColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              '-${discountPercentage.toStringAsFixed(0)}%',
              style: TextStyles.fontCircularSpotify10BlackRegular.copyWith(
                color: AppPallete.violetColor,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            formattedDiscountedPrice(context),
            style: TextStyles.fontCircularSpotify12GrayRegular.copyWith(
              color: AppPallete.violetColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
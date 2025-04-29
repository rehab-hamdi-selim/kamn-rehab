import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/entities/meal_cart_model.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_my_cart/counter.dart';

class CardMycart extends StatelessWidget {
  final MealCartModel item;

  const CardMycart({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(item.id),
        onDismissed: (direction) {
          context.read<AppUserCubit>().removeFromCart(item);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${item.name} removed from cart'),
            ),
          );
        },
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            border: Border(
              right: BorderSide(
                color: AppPallete.redColor,
                width: 5.sp,
              ),
            ),
            color: const Color(0xffF8C0C0),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: SvgPicture.asset("assets/icons/delete.svg"),
        ),
        child: Container_cart_card(item: item));
  }
}

class Container_cart_card extends StatelessWidget {
  const Container_cart_card({
    super.key,
    required this.item,
  });

  final MealCartModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.w),
      width: 343.w,
      height: 134.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.gray2, width: 0.5),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 82.w,
                height: 68.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        item.imageUrls.first,
                      ),
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
                  Container(
                    width: 165.w,
                    child: Text(
                      item.name,
                      style: TextStyles.fontCircularSpotify14AccentBlackMedium,
                      softWrap: true,
                    ),
                  ),
                  Text('Kitchen: ${item.prepTime}',
                      style: TextStyles.fontCircularSpotify10StealGrayMedium),
                ],
              ),
              SizedBox(
                width: 40.w,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: SvgPicture.asset(
                  'assets/icons/delete.svg',
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 13.h),
                    child: Row(
                      children: [
                        Text('£GP ',
                            style: TextStyles.fontCircularSpotify21BlackRegular
                                .copyWith(
                              color: AppPallete.darkGreenColor,
                            )),
                        Text(
                          item.price.toString(),
                          style: TextStyles.fontCircularSpotify21BlackRegular,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 100.w),
              Counter(
                counter: item.quantity,
                onIncrease: () {
                  context.read<AppUserCubit>().increaseQuantity(item.id);
                },
                onDecrease: () {
                  context.read<AppUserCubit>().decreaseQuantity(item.id);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

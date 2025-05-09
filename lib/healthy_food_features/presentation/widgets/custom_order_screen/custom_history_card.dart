import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/order_model.dart';
import 'package:kamn/healthy_food_features/presentation/screens/my_cart_screen.dart';

class CardHistory extends StatelessWidget {
  CardHistory({super.key, required this.item, required this.index});
  final OrderModel item;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: 343.w,
      height: 145.h,
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
                item.createdAt.toString(),
                style: TextStyles.fontCircularSpotify10BlackMedium,
              ),
              Container(
                  width: 62.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    color: AppPallete.ofWhiteColor,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: Center(
                    child: Text(
                      item.status,
                      style:
                          TextStyles.fontCircularSpotify10BlackMedium.copyWith(
                        color: AppPallete.grayColor,
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
                      image: NetworkImage(
                        item.meals.first.imageUrls.first,
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
                  Text(
                    item.meals.first.name,
                    style: TextStyles.fontCircularSpotify12BlackMedium,
                    softWrap: true,
                  ),
                  Text('Kitchen: Sarah’s House',
                      style: TextStyles.fontCircularSpotify10StealGrayMedium),
                  Text(item.orderId,
                      style: TextStyles.fontCircularSpotify10StealGrayMedium),
                ],
              )
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
                        item.meals.first.price.toString(),
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
              SizedBox(width: 110.w),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: SvgPicture.asset('assets/icons/star.svg',
                        width: 14, height: 14),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text('Rate',
                      style:
                          TextStyles.fontCircularSpotify14AccentOrangekMedium),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 91.w,
                height: 34.h,
                decoration: BoxDecoration(
                  color: AppPallete.blackColor,
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                child: GestureDetector(
                  onTap: () {
                    context.read<AppUserCubit>().addToCart(item.meals[index],
                        quantity: item.meals[index].quantity);
                    context.read<AppUserCubit>().getCartWithQuantities();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyCartScreen()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Order Again',
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

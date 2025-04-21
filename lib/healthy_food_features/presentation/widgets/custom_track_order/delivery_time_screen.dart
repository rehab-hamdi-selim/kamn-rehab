import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_track_order/chat_delivery.dart';
import 'package:rive/rive.dart';

class DeliveryTimeScreen extends StatelessWidget {
  DeliveryTimeScreen({super.key, required this.orderId});
  String orderId;
  @override
  Widget build(BuildContext context) {
    final userId = context.read<AppUserCubit>().state.user!.uid;

    return Column(
      children: [
        Text('50 min',
            style: TextStyles.circularSpotify14BoldDarkBlack
                .copyWith(fontSize: 25)),
        Text(
          'Estimated delivery time',
          style: TextStyles.fontCircularSpotify14GrayRegular.copyWith(
              color: const Color(0xffA0A5BA), fontWeight: FontWeight.w300),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          child: const Column(
            children: [
              TimelineStep(
                  title: 'Your order has been received', isActive: true),
              TimelineStep(
                  title: "The restaurant is preparing your food",
                  isActive: true),
              TimelineStep(
                  title: "Your order has been picked up for delivery",
                  isActive: false),
              TimelineStep(
                title: "Order arriving soon",
                isActive: false,
                isLast: true,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 89.h,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              color: Colors.white,
              border: Border(top: BorderSide(width: 1, color: Colors.grey))),
          child: Row(
            children: [
              Image.asset('assets/images/profile_picture.png'),
              SizedBox(
                width: 7.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  children: [
                    Text(
                      'Ahmed Senna',
                      style: TextStyles.fontCircularSpotify20AccentBlackMedium,
                    ),
                    Text('@ahmedsenna',
                        style: TextStyles.circularSpotify10LightGrey)
                  ],
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Container(
                width: 45.w,
                height: 45.h,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black),
                child: SvgPicture.asset('assets/icons/phone.order.svg'),
              ),
              SizedBox(
                width: 7.w,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        currentUserId: userId,
                        receiverId: userId,
                        orderId: orderId,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 45.w,
                  height: 45.h,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff87E697)),
                  child: SvgPicture.asset(
                    'assets/icons/chat.svg',
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TimelineStep extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isLast;

  const TimelineStep({
    required this.title,
    this.isActive = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 12.w,
              height: 12.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? const Color(0xff2A7737) : Colors.grey,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: 13,
                  color: isActive
                      ? const Color(0xff2A7737)
                      : const Color.fromARGB(141, 68, 65, 65),
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        if (!isLast)
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Container(
              width: 2.w,
              height: 40,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}

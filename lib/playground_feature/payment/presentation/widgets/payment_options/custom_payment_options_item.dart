import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomPaymentOptionsItem extends StatelessWidget {
  const CustomPaymentOptionsItem({
    super.key,
    required this.paymentIcon,
    required this.isSelected,
    required this.paymentName,
    required this.onTap,
    this.isDisabled = false, // Add disabled state
  });

  final String paymentName;
  final String paymentIcon;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDisabled; // New parameter

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 25.w),
      tileColor: isDisabled ? AppPallete.lgGreyColor.withOpacity(0.5) : AppPallete.ofWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      leading: Opacity(
        opacity: isDisabled ? 0.5 : 1.0,
        child: SvgPicture.asset(
          paymentIcon,
          width: 25.w,
          height: 25.h,
        ),
      ),
      onTap: isDisabled ? null : onTap, // Disable tap if inactive
      title: Text(
        paymentName,
        style: TextStyles.fontRoboto15BlackRegular.copyWith(
          color: isDisabled ? AppPallete.lgGreyColor : Colors.black,
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDisabled
              ? AppPallete.lgGreyColor.withOpacity(0.3)
              : (isSelected
                  ? AppPallete.lightGreenColor.withOpacity(0.3)
                  : AppPallete.lgGreyColor),
        ),
        child: CircleAvatar(
          backgroundColor: isDisabled
              ? AppPallete.lgGreyColor
              : (isSelected ? AppPallete.lightGreenColor : AppPallete.lightGreyColor),
          radius: 8.r,
        ),
      ),
    );
  }
}


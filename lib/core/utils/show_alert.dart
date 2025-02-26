import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

bool isAlertvisible = false;
showLoadingAlert(String? message, BuildContext context) {
  if (!isAlertvisible) {
    isAlertvisible = true;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(color: AppPallete.mainColor),
                  horizontalSpace(10.w),
                  Text(message ?? '',
                      style: TextStyles.fontInter15BlackMedium
                          .copyWith(color: AppPallete.mainColor))
                ],
              ),
            ));
  }
}

hideLoading(BuildContext context) {
  if (isAlertvisible && Navigator.canPop(context)) {
    isAlertvisible = false;
    Navigator.of(context).pop();
  }
}

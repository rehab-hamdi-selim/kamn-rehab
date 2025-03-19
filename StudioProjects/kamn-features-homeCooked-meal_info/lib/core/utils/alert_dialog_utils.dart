import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class AlertDialogUtils {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppPallete.whiteColor,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(color: AppPallete.greenColor),
                SizedBox(
                  width: 10.h,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(message, style: TextStyles.fontRoboto12GreenSemiBold)
              ],
            ),
          );
        });
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  static void showAlert(
      {required BuildContext context,
      String title = '',
      required String content,
      String? firstbutton,
      String? secondbutton,
      Function? firstAction,
      Function? secondAction}) {
    List<Widget> actionList = [];
    if (firstbutton != null) {
      actionList.add(SizedBox(
        height: 30.h,
        width: 100.w,
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: AppPallete.greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(34.h),
            ),
          ),
          onPressed: () {
            firstAction != null
                ? firstAction.call()
                : Navigator.of(context).pop();
          },
          child: Text(firstbutton,
              style: TextStyles.fontRoboto12WhiteRegular
                  .copyWith(fontWeight: FontWeight.w500)),
        ),
      ));
    }
    if (secondbutton != null) {
      actionList.add(SizedBox(
        height: 30.h,
        width: 100.w,
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: AppPallete.redColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(34.h),
            ),
          ),
          onPressed: () {
            if (secondAction != null) {
              secondAction.call();
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Text(secondbutton,
              style: TextStyles.fontRoboto12WhiteRegular
                  .copyWith(fontWeight: FontWeight.w500)),
        ),
      ));
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceAround,
            actionsOverflowButtonSpacing: 30,
            backgroundColor: AppPallete.whiteColor,
            title: Text(title,
                style: TextStyles.fontRoboto20BlackBold
                    .copyWith(fontWeight: FontWeight.w500)),
            content: Text(content,
                style: TextStyles.fontRoboto12BlackRegular),
            actions: actionList));
  }
}

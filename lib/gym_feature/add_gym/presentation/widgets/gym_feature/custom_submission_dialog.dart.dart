import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/helpers/spacer.dart';

class CustomSubmissionDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const CustomSubmissionDialog({
    super.key,
    required this.title,
    required this.content,
    this.confirmButtonText = 'Confirm',
    this.cancelButtonText = 'Cancel',
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      backgroundColor: AppPallete.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 25.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.fontCircularSpotify21BlackRegular,
            ),
            verticalSpace(18),
            Text(
              content,
              style: TextStyles.fontCircularSpotify12GrayRegular,
            ),
            verticalSpace(20),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (onCancel != null) onCancel!();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppPallete.blackColor,
                      backgroundColor: AppPallete.ofWhiteColor,
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    child: Text(
                      cancelButtonText,
                      style: TextStyles.fontCircularSpotify12BlackRegular,
                    ),
                  ),
                ),
                horizontalSpace(32),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onConfirm();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppPallete.whiteColor,
                      backgroundColor: AppPallete.blackColor,
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    child: Text(
                      confirmButtonText,
                      style: TextStyles.fontCircularSpotify12BlackRegular.copyWith(color: AppPallete.whiteColor  ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
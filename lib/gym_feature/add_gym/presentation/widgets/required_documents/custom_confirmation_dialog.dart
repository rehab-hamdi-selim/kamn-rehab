import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_gym_button.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';

class CustomConfirmationDialog extends StatelessWidget {
  const CustomConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddGymCubit>();

    return BlocBuilder<AddGymCubit, AddGymState>(
      builder: (context, state) {
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
                // 🟢 Upload in Progress UI
                if (state.isUploadImagesLoading ||
                    state.isLoading ||
                    state.isAddGymLoading) ...[
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "${((state.uploadProgress! / state.numberOfImages!) * 100).toInt()}%",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        LinearProgressIndicator(
                          value: state.uploadProgress! / state.numberOfImages!,
                          color: AppPallete.blackColor,
                        ),
                        SizedBox(height: 20),
                        const Text("Uploading..."),
                      ],
                    ),
                  ),
                ]

                // ✅ Upload Success UI
                else if (state.isAddGymSuccess) ...[
                  Center(
                    child: Column(
                      children: [
                        const Icon(Icons.check_circle,
                            color: Colors.green, size: 50),
                        const SizedBox(height: 10),
                        const Text(
                          "Upload Successful!",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.trackGymSubmission);
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  ),
                ]

                // ❓ Confirmation UI
                else ...[
                  Text(
                    "Are you sure?",
                    style: TextStyles.fontCircularSpotify21BlackRegular,
                  ),
                  verticalSpace(18),
                  Text(
                    "Verify all entered details and uploaded documents on the summary page. "
                    "Make corrections if needed, then confirm and submit for admin approval.",
                    style: TextStyles.fontCircularSpotify12GrayRegular,
                  ),
                  verticalSpace(20),
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r)),
                        value: state.isAccept,
                        onChanged: cubit.onAcceptTab,
                        checkColor: AppPallete.whiteColor,
                        activeColor: AppPallete.blackColor,
                      ),
                      Expanded(
                        child: Text(
                          "Accept all conditions and terms",
                          style: TextStyles.fontCircularSpotify12BlackRegular,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r)),
                        value: state.isConfirm,
                        onChanged: cubit.onConfirmTab,
                        checkColor: AppPallete.whiteColor,
                        activeColor: AppPallete.blackColor,
                      ),
                      Expanded(
                        child: Text(
                          "I confirm that the provided information is accurate",
                          style: TextStyles.fontCircularSpotify12BlackRegular,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(20),
                  Row(
                    spacing: 32.w,
                    children: [
                      Expanded(
                        child: CustomGymButton(
                          height: 30.h,
                          showIcon: false,
                          text: 'Edit',
                          onPressed: () => Navigator.pop(context),
                          isBackButton: true,
                          foregroundColor: AppPallete.blackColor,
                          backgroundColor: AppPallete.ofWhiteColor,
                        ),
                      ),
                      Expanded(
                        child: CustomGymButton(
                          height: 30.h,
                          showIcon: false,
                          text: 'Continue',
                          onPressed: () {
                            if (cubit.state.isAccept! && cubit.state.isConfirm!) {
                              cubit.uploadImages();
                            } else {
                              showSnackBar(context,
                                  "Please accept all conditions and confirm that the information is accurate");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

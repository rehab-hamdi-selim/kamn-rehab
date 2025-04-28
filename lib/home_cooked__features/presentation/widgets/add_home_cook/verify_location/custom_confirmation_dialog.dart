import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_hpme_cook_button.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_state.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/screen/meal_info_screen.dart';

import '../../../../../core/common/cubit/app_user/app_user_cubit.dart';

class CustomConfirmationDialog extends StatelessWidget {
  const CustomConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddHomeCookCubit>();

    return BlocBuilder<AddHomeCookCubit, AddHomeCookState>(
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
                    state.isAddHomeCookLoading) ...[
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "${((state.uploadProgress! / state.numberOfImages!) * 100).toInt()}%",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        LinearProgressIndicator(
                          value: state.uploadProgress! / state.numberOfImages!,
                          color: AppPallete.blackColor,
                        ),
                        const SizedBox(height: 20),
                        const Text("Uploading..."),
                      ],
                    ),
                  ),
                ]

                // ✅ Upload Success UI
                else if (state.isAddHomeCookSuccess &&
                    context.read<AppUserCubit>().state.homeCookId != null) ...[
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
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            cubit.reset();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => BlocProvider(
                            //             create: (context) => getIt<MealCubit>()
                            //               ..getMeals(state.homeCookModel!.id!
                            //                   //"u0cBRLRyHcppREpHYdNf"
                            //                   )
                            //               ..initServiceProviderHomeCook(
                            //                   state.homeCookModel!),
                            //             child: MealInfoScreen()
                            //             //AddMealTest(),
                            //             )));
                            cubit.goToNextPage();
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
                      CustomCookButton(
                        height: 30.h,
                        showIcon: false,
                        text: 'Edit',
                        onPressed: () => Navigator.pop(context),
                        isBackButton: true,
                        foregroundColor: AppPallete.blackColor,
                        backgroundColor: AppPallete.ofWhiteColor,
                      ),
                      CustomCookButton(
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

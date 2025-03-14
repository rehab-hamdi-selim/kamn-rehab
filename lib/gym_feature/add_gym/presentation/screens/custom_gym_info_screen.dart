import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_gym_button.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_info/custom_gym_links_section.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_info/custom_gym_logo_info_section.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_info/custom_gym_photos_section.dart';

class CustomGymInfoScreen extends StatelessWidget {
  const CustomGymInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16.h,
        children: [
          const CustomGymLogoInfoSection(),
          const CustomGymPhotosSection(),
          const CustomGymLinksSection(),
          Row(
            children: [
              CustomGymButton(onPressed: () {
                if (context.read<AddGymCubit>().key.currentState!.validate()==true) {
                  context.read<AddGymCubit>().goToNextPage();
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildGymLogoSection(BuildContext context,) {
  //   return buildContainer(key: context.read<AddGymCubit>().key,
  //     children: [
  //       _buildSectionTitle('Choose Gym Logo'),
  //       _buildDottedUploadLogoBox(context: context),
  //       CustomGymTextFormField(
  //         valodator: emptyValidator,
  //         controller: context.read<AddGymCubit>().nameController,
  //         label: 'Gym Name',
  //         hint: 'enter gym name',
  //         helper: "e.g., Gold's Gym Alexandria",
  //       ),
  //       verticalSpace(12),
  //       CustomGymTextFormField(
  //         valodator: emptyValidator,
  //         controller: context.read<AddGymCubit>().addressController,
  //         label: 'Gym Address',
  //         hint: 'enter gym address',
  //         helper: "e.g., City, District, Street",
  //       ),
  //       verticalSpace(12),
  //       CustomGymTextFormField(
  //         valodator: phoneValidator,
  //         controller: context.read<AddGymCubit>().phoneController,
  //         label: 'Gym Phone',
  //         hint: 'enter gym phone',
  //         helper: "e.g., 01xxxxxxxxx",
  //       ),
  //       verticalSpace(12),
  //       CustomGymTextFormField(
  //         valodator: emptyValidator,
  //         controller: context.read<AddGymCubit>().descriptionController,
  //         label: 'Gym Description',
  //         hint: 'enter gym description',
  //         helper: '',
  //         maxLine: 5,
  //         maxLength: 400,
  //       ),
  //       verticalSpace(8),
  //     ],

  //   );
  // }

  // Widget _buildGymPhotosSection(BuildContext context) {
  //   return buildContainer(
  //     children: [
  //       _buildSectionTitle('Choose Gym Photos'),
  //       verticalSpace(8),
  //       SizedBox(
  //         height: 94.h,
  //         child: ListView.separated(
  //           scrollDirection: Axis.horizontal,
  //           separatorBuilder: (_, __) => horizontalSpace(8),
  //           itemCount: 3,
  //           itemBuilder: (_, index) => _buildDottedUploadImageBox(
  //               width: 121.w, height: 94.h, index: index),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildGymLinksSection(BuildContext context) {
  //   return buildContainer(
  //     children: [
  //       _buildSectionTitle('Gym Links (optional)'),
  //       verticalSpace(8),
  //       _buildSocialTextField(context.read<AddGymCubit>().instagramController, "assets/icons/instagram.svg",
  //           'Instagram', 'enter instagram Url'),
  //       verticalSpace(12),
  //       _buildSocialTextField(context.read<AddGymCubit>().facebookController, "assets/icons/facebook.svg",
  //           'Facebook', 'enter facebook Url'),
  //       verticalSpace(12),
  //       _buildSocialTextField(
  //           context.read<AddGymCubit>().xController, "assets/icons/x.svg", 'X', 'enter x Url'),
  //     ],
  //   );
  // }

  // Widget _buildLoadingIndicator() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 37.h),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         SizedBox(
  //           width: 14.w,
  //           height: 14.h,
  //           child: const CircularProgressIndicator(
  //             color: AppPallete.mediumLightGray,
  //             semanticsLabel: 'Loading...',
  //             strokeWidth: 1,
  //           ),
  //         ),
  //         horizontalSpace(5),
  //         Text(
  //           'Loading...',
  //           style: TextStyles.fontCircularSpotify14GrayRegular,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildDottedUploadImageBox(
  //     {double? width, double? height, required int index}) {
  //   return DottedBorder(
  //     radius: Radius.circular(12.r),
  //     borderType: BorderType.RRect,
  //     color: AppPallete.stealGray,
  //     strokeWidth: .5,
  //     dashPattern: const [16, 16],
  //     child: Container(
  //       width: 121.w,
  //       height: 94.h,
  //       padding: EdgeInsets.symmetric(vertical: 10.h),
  //       decoration: BoxDecoration(
  //           color: AppPallete.whiteColor,
  //           borderRadius: BorderRadius.all(Radius.circular(12.r))),
  //       child: BlocBuilder<AddGymCubit, AddGymState>(
  //         builder: (context, state) {
  //           if ((state.gymImages?.isNotEmpty ?? false) &&
  //               state.gymImages!.length > index) {
  //             return _buildLogoPreview(context, state.gymImages![index],
  //                 isLogo: false, index: index);
  //           }
  //           return Column(children: [
  //             SvgPicture.asset(
  //               'assets/icons/insert_image.svg',
  //               width: 25.w,
  //             ),
  //             TextButton(
  //               style: TextButton.styleFrom(
  //                 backgroundColor: AppPallete.whiteColor,
  //                 side: const BorderSide(
  //                   color: AppPallete.lightGreyColor,
  //                   width: 0.27,
  //                 ),
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(3.5),
  //                 ),
  //                 minimumSize: Size(61.w, 16.h),
  //               ),
  //               onPressed: () {
  //                 context.read<AddGymCubit>().pickGymImage();
  //               },
  //               child: Text("Choose file",
  //                   style: TextStyles.fontCircularSpotify8AccentBlackRegular),
  //             ),
  //           ]);
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildTextField(TextEditingController controller, String label,
  //     String hint, String helper,
  //     {int? maxLines, int? maxLength,MyValidator? validator}) {
  //   return CustomGymTextFormField(
  //     valodator: validator,
  //     controller: controller,
  //     label: label,
  //     hint: hint,
  //     helper: helper,
  //     maxLine: maxLines,
  //     maxLength: maxLength,
  //   );
  // }

  // Widget _buildSocialTextField(TextEditingController controller,
  //     String iconPath, String prefixText, String hintText) {
  //   return CustomScoialTextFormField(
  //     controller: controller,
  //     imagePath: iconPath,
  //     prefixText: prefixText,
  //     hintText: hintText,
  //   );
  // }
}

Widget buildDottedBorder({required Widget child}) {
  return DottedBorder(
    radius: Radius.circular(12.r),
    borderType: BorderType.RRect,
    color: AppPallete.stealGray,
    strokeWidth: 0.5,
    dashPattern: const [16, 16],
    child: child,
  );
}

Widget buildContainer(
    {required List<Widget> children,
    CrossAxisAlignment alignment = CrossAxisAlignment.start,
    double horizontalPadding = 20,
    GlobalKey<FormState>? key}) {
  return Container(
    decoration: BoxDecoration(
      color: AppPallete.ofWhiteColor,
      borderRadius: BorderRadius.circular(20.r),
      border: Border.all(color: AppPallete.mediumLightGray, width: 0.2),
    ),
    padding:
        EdgeInsets.symmetric(horizontal: horizontalPadding.w, vertical: 10.h),
    width: double.infinity,
    child: Form(
        key: key,
        child: Column(crossAxisAlignment: alignment, children: children)),
  );
}

Widget buildNextButton(BuildContext context) {
  final cubit = context.read<AddGymCubit>();
  return Expanded(
    child: SizedBox(
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.blackColor,
          foregroundColor: AppPallete.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(70.r)),
        ),
        onPressed: () {
          cubit.checkMandatoryFields();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Next"),
            horizontalSpace(8),
            Icon(
              Icons.arrow_forward,
              size: 10.h,
              color: AppPallete.whiteColor,
            ),
          ],
        ),
      ),
    ),
  );
}

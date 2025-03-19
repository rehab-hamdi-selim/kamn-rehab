import 'dart:io';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/helpers/validators.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_gym_text_form_field.dart';
import 'package:kamn/core/utils/custome_text_form_field.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_gym_info_section.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_scoial_text_form_field.dart';
import 'package:kamn/home_cooked__features/data/models/home_cooked.dart';
import 'package:kamn/home_cooked__features/presentation/screen/verify.dart';

class HomeCookedScreen extends StatelessWidget {
  const HomeCookedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomGymAppBar.appBar(
        color: AppPallete.whiteColor,
        context: context,
        notificationIconFunction: () {},
        badgesIconFunction: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomHeadTitle(),
            Expanded(child: CustomTabBar()),
          ],
        ),
      ),
    );
  }
}

class CustomGymAppBar {
  static AppBar appBar(
      {required Color color,
      bool? firstScreen,
      String? title,
      required BuildContext context,
      required Function()? notificationIconFunction,
      required Function()? badgesIconFunction,
      Function()? profileFunction}) {
    return AppBar(
      leadingWidth: 45.w,
      elevation: 0,
      surfaceTintColor: color,
      backgroundColor: color,
      centerTitle: true,
      title: Text(title ?? "", style: TextStyles.fontInter20WhiteSemiBold),
      leading: Row(
        children: [
          horizontalSpace(10.w),
          InkWell(
            onTap: () {
              if (firstScreen != null && firstScreen == true) {
                showCustomDialog(context,
                    "Are you sure you want to close the app?", () => exit(0));
              } else {
                Navigator.maybePop(context);
              }
            },
            child: Container(
              padding: EdgeInsets.all(3.h),
              decoration: BoxDecoration(
                color: title == null
                    ? AppPallete.blackColor
                    : AppPallete.grayColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 20.h,
                color: AppPallete.ofWhiteColor,
              ),
            ),
          ),
        ],
      ),
      actions: [
        badges.Badge(
          ignorePointer: false,
          onTap: notificationIconFunction,
          position: badges.BadgePosition.topEnd(top: 5.h, end: 5.w),
          showBadge: true,
          child: InkWell(
            onTap: badgesIconFunction,
            child: CircleAvatar(
              backgroundColor:
                  title == null ? AppPallete.whiteColor : AppPallete.grayColor,
              radius: 16.0.r,
              child: Icon(
                Icons.notifications_none_outlined,
                color: title == null
                    ? AppPallete.blackColor
                    : AppPallete.whiteColor,
                size: 25.h,
              ),
            ),
          ),
        ),
        horizontalSpace(18.w),
      ],
    );
  }
}

class CustomHeadTitle extends StatelessWidget {
  const CustomHeadTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add home cook",
          style: TextStyles.fontCircularSpotify21BlackMedium,
        ),
        verticalSpace(2),
        Text(
          "Basic cook Information",
          style: TextStyles.fontCircularSpotify10Gray2Regular,
        ),
      ],
    );
  }
}

class CustomTabBar extends StatelessWidget {
  CustomTabBar({super.key});

  HomeCook? homeCooked;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Container(
            height: 47.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: TabBar(
              isScrollable: true,
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyles.fontCircularSpotify12WhiteRegular,
              unselectedLabelStyle:
                  TextStyles.fontCircularSpotify10BlackRegular,
              tabs: [
                Tab(text: " personal Info"),
                Tab(text: "location verify"),
                Tab(text: "meal info"),
              ],
            ),
          ),
          verticalSpace(16),
          Expanded(
            child: TabBarView(
              children: [
                CustomCookedInfoSection(),
                LocationVerifyScreen(
                  homeCooked: homeCooked,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class CustomCookedInfoSection extends StatelessWidget {
//   CustomCookedInfoSection({super.key});
//
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController facebookController = TextEditingController();
//   final TextEditingController instagramController = TextEditingController();
//   final TextEditingController xController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           _buildGymLogoSection(),
//           _buildGymPhotosSection(),
//           _buildGymLinksSection(),
//           Row(
//             children: [
//               buildNextButton(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGymLogoSection() {
//     return buildContainer(
//       children: [
//         _buildSectionTitle('Choose Gym Logo'),
//         _buildDottedUploadLogoBox(),
//         verticalSpace(12),
//         _buildTextField(nameController, 'Gym Name', 'enter gym name',
//             "e.g., Gold's Gym Alexandria",
//             validator: emptyValidator),
//         verticalSpace(12),
//         _buildTextField(addressController, 'Gym Address', 'enter gym address',
//             "e.g., City, District, Street",
//             validator: emptyValidator),
//         verticalSpace(12),
//         _buildTextField(phoneController, 'Gym Phone', 'enter gym phone',
//             "e.g., 01xxxxxxxxx",
//             validator: phoneValidator),
//         verticalSpace(12),
//         _buildTextField(descriptionController, 'Gym Description',
//             'enter gym description', '',
//             validator: emptyValidator, maxLines: 5, maxLength: 400),
//         verticalSpace(8),
//       ],
//     );
//   }
//
//   Widget _buildGymPhotosSection() {
//     return buildContainer(
//       children: [
//         _buildSectionTitle('Choose Gym Photos'),
//         verticalSpace(8),
//         SizedBox(
//           height: 94.h,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             separatorBuilder: (_, __) => horizontalSpace(8),
//             itemCount: 3,
//             itemBuilder: (_, index) =>
//                 _buildDottedUploadImageBox(width: 121.w, height: 94.h),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildGymLinksSection() {
//     return buildContainer(
//       children: [
//         _buildSectionTitle('Gym Links (optional)'),
//         verticalSpace(8),
//         _buildSocialTextField(instagramController, "assets/icons/instagram.svg",
//             'Instagram', 'enter instagram Url'),
//         verticalSpace(12),
//         _buildSocialTextField(facebookController, "assets/icons/facebook.svg",
//             'Facebook', 'enter facebook Url'),
//         verticalSpace(12),
//         _buildSocialTextField(
//             xController, "assets/icons/x.svg", 'X', 'enter x Url'),
//       ],
//     );
//   }
//
//   Widget _buildSectionTitle(String title) {
//     return Text(title, style: TextStyles.fontCircularSpotify14BlackRegular);
//   }
//
//   Widget _buildDottedUploadLogoBox() {
//     return buildDottedBorder(
//       child: Container(
//         height: 100.h,
//         padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.h),
//         decoration: BoxDecoration(
//           color: AppPallete.whiteColor,
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         child: _buildUploadPrompt(),
//       ),
//     );
//   }
//
//   Widget _buildUploadPrompt() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SvgPicture.asset('assets/icons/insert_image.svg', width: 25.w),
//         verticalSpace(7),
//         Text(
//             "Please upload a clear photo in JPG or PNG format. File size must be 5MBs or less",
//             textAlign: TextAlign.center,
//             style: TextStyles.fontCircularSpotify8StealGrayRegular),
//       ],
//     );
//   }
//
//   Widget _buildDottedUploadImageBox({double? width, double? height}) {
//     return DottedBorder(
//       radius: Radius.circular(12.r),
//       borderType: BorderType.RRect,
//       color: AppPallete.stealGray,
//       strokeWidth: .5,
//       dashPattern: const [16, 16],
//       child: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           color: AppPallete.whiteColor,
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(TextEditingController controller, String label,
//       String hint, String helper,
//       {int? maxLines, int? maxLength, MyValidator? validator}) {
//     return CustomGymTextFormField(
//       valodator: validator,
//       controller: controller,
//       label: label,
//       hint: hint,
//       helper: helper,
//       maxLine: maxLines,
//       maxLength: maxLength,
//     );
//   }
//
//   Widget _buildSocialTextField(TextEditingController controller,
//       String iconPath, String prefixText, String hintText) {
//     return CustomScoialTextFormField(
//       controller: controller,
//       imagePath: iconPath,
//       prefixText: prefixText,
//       hintText: hintText,
//     );
//   }
// }
//
// Widget buildDottedBorder({required Widget child}) {
//   return DottedBorder(
//     radius: Radius.circular(12.r),
//     borderType: BorderType.RRect,
//     color: AppPallete.stealGray,
//     strokeWidth: 0.5,
//     dashPattern: const [16, 16],
//     child: child,
//   );
// }
//
// Widget buildContainer({required List<Widget> children}) {
//   return Container(
//     decoration: BoxDecoration(
//       color: AppPallete.ofWhiteColor,
//       borderRadius: BorderRadius.circular(20.r),
//       border: Border.all(color: AppPallete.mediumLightGray, width: 0.2),
//     ),
//     padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//     child: Column(children: children),
//   );
// }
//
// Widget buildNextButton() {
//   return ElevatedButton(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: AppPallete.blackColor,
//       foregroundColor: AppPallete.whiteColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70.r)),
//     ),
//     onPressed: () {},
//     child: Text("Next"),
//   );
// }

/////////////////////

class CustomCookedInfoSection extends StatelessWidget {
  CustomCookedInfoSection({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController xController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildPersonalInfoSection(),
          Row(
            children: [
              buildNextButton(context), // Pass context to the button
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return buildContainer(
      children: [
        _buildTextField(nameController, 'Full Name', 'Enter your full name',
            "e.g., John Doe",
            validator: emptyValidator),
        verticalSpace(12),
        _buildTextField(emailController, 'Email', 'Enter your email',
            "e.g., example@gmail.com",
            validator: emailValidator),
        verticalSpace(12),
        _buildTextField(phoneController, 'Phone', 'Enter your phone number',
            "e.g., 0123456789",
            validator: phoneValidator),
        verticalSpace(12),
        _buildTextField(
            descriptionController, 'Description', 'Enter a description', '',
            validator: emptyValidator, maxLines: 5),
        verticalSpace(12),
        _buildSocialTextField(instagramController, "assets/icons/instagram.svg",
            'Instagram', 'Enter Instagram URL'),
        verticalSpace(12),
        _buildSocialTextField(facebookController, "assets/icons/facebook.svg",
            'Facebook', 'Enter Facebook URL'),
        verticalSpace(12),
        _buildSocialTextField(
            xController, "assets/icons/x.svg", 'X', 'Enter X URL'),
      ],
    );
  }

  // Widget buildNextButton(BuildContext context) {
  //   return ElevatedButton(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: AppPallete.blackColor,
  //       foregroundColor: AppPallete.whiteColor,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70.r)),
  //     ),
  //     onPressed: () {
  //       // Create a HomeCooked object with the collected data
  //       // HomeCook homeCooked = HomeCook(
  //       //   fullName: nameController.text,
  //       //   email: emailController.text,
  //       //   phone: phoneController.text,
  //       //   profilePictureUrl: '', // No logo in this implementation
  //       //   description: descriptionController.text,
  //       //   socialMedia: {
  //       //     'Instagram': instagramController.text,
  //       //     'Facebook': facebookController.text,
  //       //     'X': xController.text,
  //       //   },
  //       //   homeAddress: '', // Will be filled in the second screen
  //       //   street: '', // Will be filled in the second screen
  //       //   buildingNumber: '', // Will be filled in the second screen
  //       //   apartment: '', // Will be filled in the second screen
  //       //   utilityBills: {}, // Will be filled in the second screen
  //       // );
  //
  //       // Navigate to the second screen and pass the HomeCooked object
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //         //  builder: (context) => LocationVerifyScreen(homeCooked: homeCooked),
  //         ),
  //       );
  //     },
  //     child: Text("Next"),
  //   );
  // }

  Widget _buildTextField(TextEditingController controller, String label,
      String hint, String helper,
      {int? maxLines, MyValidator? validator}) {
    return CustomGymTextFormField(
      valodator: validator,
      controller: controller,
      label: label,
      hint: hint,
      helper: helper,
      maxLine: maxLines,
    );
  }

  Widget _buildSocialTextField(TextEditingController controller,
      String iconPath, String prefixText, String hintText) {
    return CustomScoialTextFormField(
      controller: controller,
      imagePath: iconPath,
      prefixText: prefixText,
      hintText: hintText,
    );
  }
}

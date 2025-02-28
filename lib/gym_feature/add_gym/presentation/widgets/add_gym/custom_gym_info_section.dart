import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_gym_text_form_field.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_scoial_text_form_field.dart';

class CustomGymInfoSection extends StatelessWidget {
  CustomGymInfoSection({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16.h,
        children: [
          _buildGymLogoSection(),
          _buildGymPhotosSection(),
          _buildGymLinksSection(),
          Row(
            children: [
              buildNextButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGymLogoSection() {
    return buildContainer(
      children: [
        _buildSectionTitle('Choose Gym Logo'),
        _buildDottedUploadLogoBox(),
        verticalSpace(12),
        _buildTextField(nameController, 'Gym Name', 'enter gym name',
            "e.g., Gold's Gym Alexandria"),
        verticalSpace(12),
        _buildTextField(addressController, 'Gym Address', 'enter gym address',
            "e.g., City, District, Street"),
        verticalSpace(12),
        _buildTextField(phoneController, 'Gym Phone', 'enter gym phone',
            "e.g., 01xxxxxxxxx"),
        verticalSpace(12),
        _buildTextField(descriptionController, 'Gym Description',
            'enter gym description', '',
            maxLines: 5, maxLength: 400),
        verticalSpace(8),
      ],
    );
  }

  Widget _buildGymPhotosSection() {
    return buildContainer(
      children: [
        _buildSectionTitle('Choose Gym Photos'),
        verticalSpace(8),
        SizedBox(
          height: 94.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => horizontalSpace(8),
            itemCount: 3,
            itemBuilder: (_, __) =>
                _buildDottedUploadImageBox(width: 121.w, height: 94.h),
          ),
        ),
      ],
    );
  }

  Widget _buildGymLinksSection() {
    return buildContainer(
      children: [
        _buildSectionTitle('Gym Links (optional)'),
        verticalSpace(8),
        _buildSocialTextField(nameController, "assets/icons/instagram.svg",
            'Instagram', 'enter instagram Url'),
        verticalSpace(12),
        _buildSocialTextField(nameController, "assets/icons/facebook.svg",
            'Facebook', 'enter facebook Url'),
        verticalSpace(12),
        _buildSocialTextField(
            nameController, "assets/icons/x.svg", 'X', 'enter x Url'),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: TextStyles.fontCircularSpotify14BlackRegular);
  }

  Widget _buildDottedUploadLogoBox({double? width, double? height}) {
    return buildDottedBorder(
      child: Container(
        width: width ?? double.infinity,
        height: height,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: AppPallete.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/insert_image.svg', width: 25.w),
            verticalSpace(7),
            Text(
              "Please upload a clear photo in JPG or PNG\n format. File size must be 5MBs or less",
              style: TextStyles.fontCircularSpotify8StealGrayRegular,
              textAlign: TextAlign.center,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppPallete.whiteColor,
                side: const BorderSide(
                    color: AppPallete.lightGreyColor, width: 0.27),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.5)),
                minimumSize: Size(157.w, 16.h),
              ),
              onPressed: () {},
              child: Text("Choose file",
                  style: TextStyles.fontCircularSpotify8AccentBlackRegular),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDottedUploadImageBox({double? width, double? height}) {
    return DottedBorder(
      radius: Radius.circular(12.r),
      borderType: BorderType.RRect,
      color: AppPallete.stealGray,
      strokeWidth: .5,
      dashPattern: const [16, 16],
      child: Container(
        width: 121.w,
        height: 94.h,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
            color: AppPallete.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        child: Column(children: [
          SvgPicture.asset(
            'assets/icons/insert_image.svg',
            width: 25.w,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppPallete.whiteColor,
              side: const BorderSide(
                color: AppPallete.lightGreyColor,
                width: 0.27,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.5),
              ),
              minimumSize: Size(61.w, 16.h),
            ),
            onPressed: () {},
            child: Text("Choose file",
                style: TextStyles.fontCircularSpotify8AccentBlackRegular),
          ),
        ]),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      String hint, String helper,
      {int? maxLines, int? maxLength}) {
    return CustomGymTextFormField(
      controller: controller,
      label: label,
      hint: hint,
      helper: helper,
      maxLine: maxLines,
      maxLength: maxLength,
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
    double horizontalPadding = 20}) {
  return Container(
    decoration: BoxDecoration(
      color: AppPallete.ofWhiteColor,
      borderRadius: BorderRadius.circular(20.r),
      border: Border.all(color: AppPallete.mediumLightGray, width: 0.2),
    ),
    padding:
        EdgeInsets.symmetric(horizontal: horizontalPadding.w, vertical: 10.h),
    width: double.infinity,
    child: Column(crossAxisAlignment: alignment, children: children),
  );
}

Widget buildNextButton() {
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
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Next"),
            horizontalSpace(8),
            Icon(Icons.arrow_forward, size: 10.h,color: AppPallete.whiteColor,),
          ],
        ),
      ),
    ),
  );
}



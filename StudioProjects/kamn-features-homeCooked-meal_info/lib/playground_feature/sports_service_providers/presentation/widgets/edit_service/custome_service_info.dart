import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/helpers/validators.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/playground_feature/sports_service_providers/data/model/playground_request_model.dart';

import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_cubit.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_state.dart';
import 'package:kamn/core/utils/custome_text_form_field.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/edit_service/custome_dropdown_menu.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/edit_service/custome_radio_button.dart';

import '../../../../../core/theme/style.dart';

class CustomeServiceInfo extends StatelessWidget {
  final PlaygroundRequestModel playground;
  const CustomeServiceInfo({super.key, required this.playground});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<EditServiceProviderCubit>().formKey,
      child: Column(
        children: [
          createField(
              title: Constants.fullName,
              hint: Constants.fullNameHint,
              nameController:
                  context.read<EditServiceProviderCubit>().nameController,
              iconPath: 'assets/icons/user.svg',
              validator: emptyValidator),
          verticalSpace(16.h),
          createField(
              title: Constants.phone,
              hint: Constants.phoneHint,
              nameController:
                  context.read<EditServiceProviderCubit>().phoneController,
              iconPath: 'assets/icons/phone.svg',
              validator: phoneValidator),
          verticalSpace(16.h),
          createField(
              title: Constants.address,
              hint: Constants.addressHint,
              nameController:
                  context.read<EditServiceProviderCubit>().addressController,
              iconPath: 'assets/icons/location.svg',
              context: context,
              showLocationIcon: true,
              validator: emptyValidator),
          verticalSpace(16.h),
          createField(
            title: Constants.groundSize,
            hint: Constants.groundSizeHint,
            nameController:
                context.read<EditServiceProviderCubit>().sizeController,
            iconPath: 'assets/icons/size.svg',
            explane: Constants.howManyPeople,
            validator: numbersValidator,
          ),
          verticalSpace(16.h),
          createField(
            title: Constants.price,
            hint: Constants.priceHint,
            nameController:
                context.read<EditServiceProviderCubit>().priceController,
            iconPath: 'assets/icons/price.svg',
            validator: numbersValidator,
          ),
          verticalSpace(16.h),
          createSelectionButton(title: Constants.availability),
          verticalSpace(16.h),
          createMenu(
              nameController:
                  context.read<EditServiceProviderCubit>().governateController,
              title: Constants.governate,
              hint: Constants.governateHint,
              iconPath: 'assets/icons/location.svg',
              choices: Constants.egyptGovernorates),
          verticalSpace(10.h),
          createField(
              maxLength: 200,
              title: Constants.description,
              hint: Constants.descriptionHint,
              nameController: context
                  .read<EditServiceProviderCubit>()
                  .descriptionController,
              iconPath: 'assets/icons/description.svg',
              explane: Constants.optional,
              isRequired: false),
          verticalSpace(16.h),
        ],
      ),
    );
  }

  SizedBox createSelectionButton({required String title}) {
    return SizedBox(
        height: 70.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: title,
                    style: TextStyles.fontInter14BlackMedium,
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyles.fontInter14BlackMedium
                            .copyWith(color: AppPallete.redColor),
                      ),
                    ])),
            verticalSpace(10.h),
            const CustomeRadioButton()
          ],
        ));
  }

  Widget createField(
      {required TextEditingController nameController,
      required String title,
      required String hint,
      required String iconPath,
      int? maxLength,
      bool? isRequired,
      BuildContext? context,
      bool showLocationIcon = false,
      String? explane,
      MyValidator? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
                text: title,
                style: TextStyles.fontInter14BlackMedium,
                children: [
                  if (isRequired == true || isRequired == null)
                    TextSpan(
                      text: '*',
                      style: TextStyles.fontInter14BlackMedium
                          .copyWith(color: AppPallete.redColor),
                    ),
                  TextSpan(
                      text: explane, style: TextStyles.fontInter11GreyMedium)
                ])),
        Row(
          children: [
            Expanded(
              child: CustomeTextFormField(
                hint: hint,
                maxLength: maxLength,
                validator: validator,
                controller: nameController,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(14.h),
                  child: SvgPicture.asset(
                    iconPath,
                    color: AppPallete.blackColor,
                  ),
                ),
              ),
            ),
            if (showLocationIcon) horizontalSpace(13.w),
            if (showLocationIcon)
              InkWell(
                onTap: () {
                  context?.read<EditServiceProviderCubit>().getLocation();
                },
                child: BlocBuilder<EditServiceProviderCubit,
                    EditServiceProviderState>(
                  builder: (context, state) {
                    return CircleAvatar(
                      backgroundColor: AppPallete.blackColor,
                      child: state.isLocationLoading
                          ? const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : SvgPicture.asset(
                              'assets/icons/direction.svg',
                              width: 20.w,
                              height: 20.h,
                              color: Colors.white,
                            ),
                    );
                  },
                ),
              )
          ],
        )
      ],
    );
  }

  SizedBox createMenu(
      {required TextEditingController nameController,
      required String title,
      required String hint,
      required String iconPath,
      required List<String> choices}) {
    return SizedBox(
      height: 81.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: title,
                  style: TextStyles.fontInter14BlackMedium,
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyles.fontInter14BlackMedium
                          .copyWith(color: AppPallete.redColor),
                    ),
                  ])),
          CustomeDropdownMenu(
            hint: hint,
            controller: nameController,
            prefixIcon: Padding(
              padding: EdgeInsets.all(14.h),
              child: SvgPicture.asset(
                iconPath,
                color: AppPallete.blackColor,
              ),
            ),
            choices: choices,
          ),
        ],
      ),
    );
  }
}

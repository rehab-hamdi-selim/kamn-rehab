import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/helpers/validators.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/core/utils/custom_gym_text_form_field.dart';
import 'package:kamn/core/utils/custome_text_form_field.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/gym_features/cubit/gym_features_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_general_button.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_radio_button.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_text_form_field.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_feature/custom_drop_down_menu.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_feature/feature_box.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_feature/reusable_radio_buttons.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/required_documents/custom_navigation_buttons.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

import '../cubits/add_gym/add_gym_cubit.dart';

// ignore: must_be_immutable
class CustomGymFeaturesSection extends StatefulWidget {
  const CustomGymFeaturesSection({super.key});

  @override
  State<CustomGymFeaturesSection> createState() =>
      _CustomGymFeaturesSectionState();
}

class _CustomGymFeaturesSectionState extends State<CustomGymFeaturesSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomContainer(
            horizontalPadding: 15,
            children: [
              Text(
                'Add Gym Facilities and Features',
                style: TextStyles.fontCircularSpotify16BlackMedium,
              ),
              Text(
                'Add predefined features like sauna, cardio machines, or yoga',
                style: TextStyles.fontCircularSpotify11GreyRegular,
              ),
              verticalSpace(12),
              Text(
                'Facilities and Features',
                style: TextStyles.fontCircularSpotify15BlackRegular,
              ),
              verticalSpace(4),
              CustomDropDownMenu(
                controller: context.read<AddGymCubit>().menuController,
              ),
              verticalSpace(12),
              BlocBuilder<AddGymCubit, AddGymState>(
                builder: (context, state) {
                  return CustomGymTextFormField(
                    controller: context.read<AddGymCubit>().priceController,
                    hint: "add price",
                    label: 'Feature-Based Pricing',
                    enable: state.featureType?.name != FeatureType.free.name,
                    valodator: numbersValidator,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    suffix: Text(
                      "£GP",
                      style: TextStyles.fontCircularSpotify12GrayRegular,
                    ),
                  );
                },
              ),
              verticalSpace(12),
              BlocBuilder<AddGymCubit,AddGymState>(
                builder: (context, state) {
                  return ReusableRadioButtons<FeatureType>(
                    groupValue: context.read<AddGymCubit>().state.featureType,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<AddGymCubit>().onChangeRadioSelection(value);
                      }
                    },
                  );
                },
              ),
              verticalSpace(12),
              CustomGymTextFormField(
                valodator: emptyValidator,
                controller:
                    context.read<AddGymCubit>().featureDescriptionController,
                label: 'Description',
                hint: 'write description for the this feature you added',
                maxLine: 5,
                maxLength: 100,
              ),
              verticalSpace(12),
              CustomGeneralButton(
                textButton: 'Add Feature',
                buttonColor: AppPallete.blackColor,
                buttonTextColor: AppPallete.whiteColor,
                ontab: () {
                  context.read<AddGymCubit>().addFeature();
                },
              ),
              verticalSpace(12),
              BlocBuilder<AddGymCubit, AddGymState>(
                builder: (context, state) {
                  if (state.addedFeatures == null ||
                      state.addedFeatures!.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Column(
                    spacing: 5.h,
                    children: [
                      Divider(
                        color: AppPallete.grayColor,
                        endIndent: 70.w,
                        indent: 70.w,
                        thickness: .2,
                      ),
                      SizedBox(width: double.infinity,
                        child: Wrap(
                          
                          spacing: 5.w,
                          children: state.addedFeatures!
                              .map((element) => FittedBox(
                                    child: FeatureBox(
                                      feature: element,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      Text(
                        "Tap and hold a feature chip to edit its name, description, or price.",
                        style: TextStyles.fontCircularSpotify8StealGrayRegular,
                      )
                    ],
                  );
                },
              )
            ],
          ),
          verticalSpace(16.h),
          const CustomNavigationButtons(),
        ],
      ),
    );
  }
}

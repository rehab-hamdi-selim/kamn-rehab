import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/secure_storage_helper.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/helpers/validators.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/core/utils/custom_gym_app_bar.dart';
import 'package:kamn/core/utils/custom_gym_button.dart';
import 'package:kamn/core/utils/custom_gym_text_form_field.dart';
import 'package:kamn/gym_feature/add_gym/data/datasources/add_gym_remote_data_source.dart';
import 'package:kamn/gym_feature/add_gym/data/repositories/add_gym_repository.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/create_gym_feature/create_gym_feature_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_general_button.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_feature/custom_drop_down_menu.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_feature/custom_gym_feature_bloc_listener.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_feature/custom_submission_dialog.dart.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_feature/feature_box.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_feature/reusable_radio_buttons.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/required_documents/custom_navigation_buttons.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';


// ignore: must_be_immutable
class CreateGymFeaturesScreen extends StatelessWidget {
  const CreateGymFeaturesScreen({super.key, required this.gymId});

  final String gymId;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateGymFeatureCubit>();
    return CustomGymFeatureBlocListener(
      child: Scaffold(
        backgroundColor: AppPallete.whiteColor,
        appBar: CustomGymAppBar.appBar(
          color: AppPallete.whiteColor,
          context: context,
          notificationIconFunction: () {},
          badgesIconFunction: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
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
                    Material(
                      color: Colors.transparent,
                      child: CustomDropDownMenu(
                        controller: cubit.menuController,
                      ),
                    ),
                    verticalSpace(12),
                    BlocBuilder<CreateGymFeatureCubit, CreateGymFeatureState>(
                      builder: (context, state) {
                        return CustomGymTextFormField(
                          controller: cubit.priceController,
                          hint: "add price",
                          label: 'Feature-Based Pricing',
                          enable:
                              state.featureType?.name != FeatureType.free.name,
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
                    BlocBuilder<CreateGymFeatureCubit, CreateGymFeatureState>(
                      builder: (context, state) {
                        return ReusableRadioButtons<FeatureType>(
                          groupValue: state.featureType,
                          onChanged: (value) {
                            if (value != null) {
                              cubit.onChangeRadioSelection(value);
                            }
                          },
                        );
                      },
                    ),
                    verticalSpace(12),
                    CustomGymTextFormField(
                      valodator: emptyValidator,
                      controller: cubit.featureDescriptionController,
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
                        cubit.addFeature();
                      },
                    ),
                    verticalSpace(12),
                    BlocBuilder<CreateGymFeatureCubit, CreateGymFeatureState>(
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
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                spacing: 5.w,
                                children: state.addedFeatures!
                                    .map((element) => FittedBox(
                                          child: FeatureBox(
                                            feature: element,
                                            onTapClose: context.read<CreateGymFeatureCubit>().removeFeature,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                            Text(
                              "Tap and hold a feature chip to edit its name, description, or price.",
                              style:
                                  TextStyles.fontCircularSpotify8StealGrayRegular,
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
                verticalSpace(16.h),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppPallete.whiteColor,
          child: BlocBuilder<CreateGymFeatureCubit, CreateGymFeatureState>(
            builder: (context, state) {
              return CustomGymButton(
                text: 'Submit',
                icon: Icons.check,
                onPressed: state.addedFeatures == null ||
                        state.addedFeatures!.isEmpty
                    ? null
                    : () {
                      showDialog(context: context, builder:(context)=> CustomSubmissionDialog(title: "Submission",onConfirm: (){
                        cubit.submitFeatures( gymId);
                      },content: "Are you sure you want to submit these features?",));
                    },
              );
            },
          ),
        ),
      ),
    );
  }
}

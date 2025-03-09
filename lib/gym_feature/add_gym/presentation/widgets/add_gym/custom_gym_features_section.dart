import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/gym_features/cubit/gym_features_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_check_bar.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_drop_down_menu.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_general_button.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_radio_button.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_text_form_field.dart';

import '../../cubits/gym_features/cubit/gym_features_cubit.dart';

// ignore: must_be_immutable
class CustomGymFeaturesSection extends StatefulWidget {
  const CustomGymFeaturesSection({super.key});

  @override
  State<CustomGymFeaturesSection> createState() => _CustomGymFeaturesSectionState();
}

class _CustomGymFeaturesSectionState extends State<CustomGymFeaturesSection> {
  late TextEditingController _menuController ;
  late TextEditingController _priceController ;
  late TextEditingController _descriptioncontroller ;

  @override
  void initState() {
   _menuController = TextEditingController();
  _priceController = TextEditingController();
  _descriptioncontroller = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _menuController.dispose();
    _priceController.dispose();
    _descriptioncontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GymFeaturesCubit(),
      child: BlocListener<GymFeaturesCubit, GymFeaturesState>(
        listener: (context, state) {
          if(_menuController.text != state.selectedValue){
            _menuController.text = state.selectedValue;
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 245, 245),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text('Add Gym Facilities and Features',
                          style: TextStyles.fontCircularSpotify16BlackMedium),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 6, 0, 0),
                      child: Text(
                        'Add predefined features like sauna, cardio machines, or yoga',
                        style: TextStyles.fontCircularSpotify11LightRegular,
                      ),
                    ),
                    verticalSpace(12),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                      child: Text('Facilities and Features',
                          style: TextStyles.fontRoboto15BlackRegular),
                    ),
                    CustomDropDownMenu(controller: _menuController,),
                    verticalSpace(16),
                    CustomTextFormField(
                      keyType: TextInputType.number,
                      lines: 1,
                      controller: _priceController,
                      boxhight: BoxConstraints.tight(const Size.fromHeight(40)),
                      maxLine: 1,
                      label: 'Feature-Based Pricing',
                      optionalText: '',
                      hintText: '',
                      widget: const Text('£GP'),
                    ),
                    verticalSpace(8),
<<<<<<< HEAD
                    CustomCheckBar(
=======
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRadioButton(
                          text: 'Free',
                          activeColor: const Color(0xffFEFEFE),
                          backgroundColor: AppPallete.blackColor,
                        ),
                        CustomRadioButton(
                        text: '/ monthly',
                          activeColor: const Color(0xffFEFEFE),
                          backgroundColor: AppPallete.blueColor,
                        ),
                        CustomRadioButton(
                       text: '/ session',
                          activeColor: const Color(0xffFEFEFE),
                          backgroundColor: AppPallete.greenColor,
                        ),
                      ],
>>>>>>> 6960c59cbdd2850ea2c728ad4c139e54e2197e45
                    ),
                    verticalSpace(8),
                    CustomTextFormField(
                      keyType: TextInputType.text,
                      lines: 6,
                      controller: _descriptioncontroller,
                      hintText:
                          'write description for the this feature you added',
                      boxhight:
                          BoxConstraints.tight(const Size.fromHeight(120)),
                      label: 'Description',
                      maxLine: 6,
                      optionalText: '',
                      maxLength: 100,
                    ),
                    verticalSpace(7),
                    Center(
                        child: CustomGeneralButton(
                      textButton: '+ Add Feature',
                      ontab: () {},
                      buttonWidth: 320.w,
                      buttonColor: AppPallete.blackColor,
                      buttonTextColor: AppPallete.lgWhiteColor,
                    )),
                  ],
                ),
              ),
              Container(
                color: Colors.red,
              ),
              verticalSpace(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomGeneralButton(
                    textButton: '⟵ Back',
                    ontab: () {},
                    buttonWidth: 130.w,
                    buttonColor: AppPallete.lgWhiteColor,
                    buttonTextColor: AppPallete.blackColor,
                  ),
                  CustomGeneralButton(
                    textButton: 'Next ⟶',
                    ontab: () {},
                    buttonWidth: 130.w,
                    buttonColor: AppPallete.blackColor,
                    buttonTextColor: AppPallete.lgWhiteColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

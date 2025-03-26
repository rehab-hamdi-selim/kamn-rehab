import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/helpers/validators.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/core/utils/custom_dotted_border.dart';
import 'package:kamn/core/utils/custom_gym_text_form_field.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_info/gym_logo_preview_widget.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_info/loading_indicator_widget.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_info/upload_prompt_widget.dart';

class CustomGymLogoInfoSection extends StatelessWidget {
  const CustomGymLogoInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(children: [
      Text("Choose Gym Logo",
          style: TextStyles.fontCircularSpotify14BlackRegular),
      verticalSpace(12),
      CustomDottedBorder(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.h),
          decoration: BoxDecoration(
            color: AppPallete.whiteColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: BlocBuilder<AddGymCubit, AddGymState>(
            builder: (context, state) {
              if (state.state == AddGymStatus.logoLoading) {
                return const LoadingIndicatorWidget();
              }
              if (state.logo != null) {
                return GymLogoPreviewWidget(logo: state.logo!);
              }
              return const UploadPromptWidget();
            },
          ),
        ),
      ),
      verticalSpace(12),
      Form(
        key: context.read<AddGymCubit>().gymInfoKey,
        child: Column(
          children: [
            CustomGymTextFormField(
              valodator: emptyValidator,
              controller: context.read<AddGymCubit>().nameController,
              label: 'Gym Name',
              hint: 'enter gym name',
              helper: "e.g., Gold's Gym Alexandria",
            ),
            verticalSpace(12),
            CustomGymTextFormField(
              valodator: emptyValidator,
              controller: context.read<AddGymCubit>().addressController,
              label: 'Gym Address',
              hint: 'enter gym address',
              helper: "e.g., City, District, Street",
            ),
            verticalSpace(12),
            CustomGymTextFormField(
              valodator: phoneValidator,
              controller: context.read<AddGymCubit>().phoneController,
              label: 'Gym Phone',
              hint: 'enter gym phone',
              helper: "e.g., 01xxxxxxxxx",
            ),
            verticalSpace(12),
            CustomGymTextFormField(
              valodator: emptyValidator,
              controller: context.read<AddGymCubit>().descriptionController,
              label: 'Gym Description',
              hint: 'enter gym description',
              helper: '',
              maxLine: 5,
              maxLength: 400,
            ),
          ],
        ),
      ),
      verticalSpace(8),
    ]);
  }
}

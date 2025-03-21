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
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_state.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/gym_info/gym_logo_preview_widget.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/gym_info/loading_indicator_widget.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/gym_info/upload_prompt_widget.dart';

class CustomGymLogoInfoSection extends StatelessWidget {
  const CustomGymLogoInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(children: [
      Text("Profile Picture",
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
          child: BlocBuilder<AddHomeCookCubit, AddHomeCookState>(
            builder: (context, state) {
              if (state.state == AddHomeCookStatus.logoLoading) {
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
        key: context.read<AddHomeCookCubit>().gymInfoKey,
        child: Column(
          children: [
            CustomGymTextFormField(
              valodator: emptyValidator,
              controller: context.read<AddHomeCookCubit>().nameController,
              label: ' Name',
              hint: 'enter your name',
              helper: "Ebrahim.....",
            ),
            verticalSpace(12),
            CustomGymTextFormField(
              valodator: emptyValidator,
              controller: context.read<AddHomeCookCubit>().emailController,
              label: 'Email',
              hint: 'enter your email',
              helper: "example@kamn.com",
            ),
            verticalSpace(12),
            CustomGymTextFormField(
              valodator: phoneValidator,
              controller: context.read<AddHomeCookCubit>().phoneController,
              label: ' Phone',
              hint: 'enter your phone',
              helper: "e.g., 01xxxxxxxxx",
            ),
            verticalSpace(12),
            CustomGymTextFormField(
              valodator: emptyValidator,
              controller:
                  context.read<AddHomeCookCubit>().descriptionController,
              label: ' Description',
              hint: 'enter the description',
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

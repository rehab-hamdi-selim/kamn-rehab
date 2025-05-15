import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_info/custom_scoial_text_form_field.dart';

class CustomGymLinksSection extends StatelessWidget {
  const CustomGymLinksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      children: [
        Text("Gym Links (optional)",
            style: TextStyles.fontCircularSpotify14BlackRegular),
        verticalSpace(8),
        CustomScoialTextFormField(
          controller: context.read<AddGymCubit>().instagramController,
          imagePath: "assets/icons/instagram.svg",
          prefixText: 'Instagram',
          hintText: 'enter instagram Url',
        ),
        verticalSpace(12),
        CustomScoialTextFormField(
          controller: context.read<AddGymCubit>().facebookController,
          imagePath: "assets/icons/facebook.svg",
          prefixText: 'Facebook',
          hintText: 'enter facebook Url',
        ),
        verticalSpace(12),
        CustomScoialTextFormField(
          controller: context.read<AddGymCubit>().xController,
          imagePath: "assets/icons/x.svg",
          prefixText: 'X',
          hintText: 'enter x Url',
        ),
      ],
    );
  }
}
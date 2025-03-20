import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_scoial_text_form_field.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_gym_cubit.dart';

class CustomGymLinksSection extends StatelessWidget {
  const CustomGymLinksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      children: [
        Text("Social Media",
            style: TextStyles.fontCircularSpotify14BlackRegular),
        verticalSpace(8),
        CustomScoialTextFormField(
          controller: context.read<AddHomeCookCubit>().instagramController,
          imagePath: "assets/icons/instagram.svg",
          prefixText: 'Instagram',
          hintText: 'enter instagram Url',
        ),
        verticalSpace(12),
        CustomScoialTextFormField(
          controller: context.read<AddHomeCookCubit>().facebookController,
          imagePath: "assets/icons/facebook.svg",
          prefixText: 'Facebook',
          hintText: 'enter facebook Url',
        ),
        verticalSpace(12),
        CustomScoialTextFormField(
          controller: context.read<AddHomeCookCubit>().xController,
          imagePath: "assets/icons/x.svg",
          prefixText: 'X',
          hintText: 'enter x Url',
        ),
      ],
    );
  }
}

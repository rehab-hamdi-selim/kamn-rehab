import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/headline_with_text_field.dart';

class CustomNotesSection extends StatelessWidget {
  const CustomNotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(

      children: [
        HeadlineWithTextField(
          headLine: 'Notes',
          hintText: 'write note for users',
          subtitle: "Communicates any extra details or terms for users.",
          optionalText: " (Optional)",
          controller: context.read<MembershipOfferCubit>().notesController,
        )
      ],
    );
  }
}
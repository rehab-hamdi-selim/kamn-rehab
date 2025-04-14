import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/headline_with_dropdown.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/headline_with_text_field.dart';

class OfferNameContainer extends StatelessWidget {
  const OfferNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomContainer(
      children: [
         HeadlineWithTextField(
          headLine: 'Plan Name',
          subtitle: 'Determines the plan’s duration (e.g., monthly or annual).',
          hintText: 'Monthly Plan',
          controller: context.read<MembershipOfferCubit>().offerNameController,
        ),
     BlocBuilder<MembershipOfferCubit,MembershipOfferState>(
       builder: (context, state) {
         return HeadlineWithDropdown(
       headLine: "Plan Type",
       subtitle: "Choose from the list",
       hintText: "Select an item",
       items: PlanDuration.values.map((e) => e.displayName).toList(),
       value:state.planDuration?.displayName?? PlanDuration.values.first.displayName,
     onChanged: ( value) {
       if (value != null) {
         // Update the selected plan duration
         context.read<MembershipOfferCubit>().updatePlanDuration(
           PlanDuration.values.firstWhere((e) => e.displayName == value)
         );
       }
     },
       optionalText: " (Optional)",
     );
       },
     )
      ],
    );
  }
}

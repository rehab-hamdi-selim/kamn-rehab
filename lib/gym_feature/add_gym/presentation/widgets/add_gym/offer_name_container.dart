import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/headline_with_text_field.dart';

class OfferNameContainer extends StatelessWidget {
  const OfferNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 335.w,
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
          decoration: ShapeDecoration(
            color: const Color(0xFFF6F6F6),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 0.20,
                color: Color(0xFFBBBBBB),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12,
            children: [
              HeadlineWithTextField(
                headLine: 'Plan Name',
                subtitle: 'Clearly identify the membership plan for users.',
                hintText: 'Monthly Plan',
              ),
              HeadlineWithTextField(
                headLine: 'Plan Type',
                subtitle:
                    'Determines the plan’s duration (e.g., monthly or annual).',
                hintText: 'Monthly',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

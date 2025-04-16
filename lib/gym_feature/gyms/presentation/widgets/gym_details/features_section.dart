import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_state.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({
    super.key,
    required this.gymId,
  });
  final String gymId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymDetailsCubit, GymDetailsState>(
      builder: (context, state) {
        print(state.gymFeatures);
        if (state.isFeaturesLoading) {
          return const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state.gymFeatures?.isEmpty ?? true) {
          return const SizedBox();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state.gymFeatures == null
                ? const SizedBox()
                : Text("Features",
                    style: TextStyles.fontCircularSpotify20AccentBlackMedium),
            SizedBox(height: 10.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 4.h,
              children: state.gymFeatures!.map((feature) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppPallete.shadeOfGray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    feature.name ?? '',
                    style: TextStyles.fontCircularSpotify8AccentBlackRegular
                        .copyWith(
                      fontSize: 10, 
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}

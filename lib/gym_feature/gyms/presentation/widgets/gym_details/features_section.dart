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
            SizedBox(
              width: 900.w,
              height: (state.gymFeatures?.length)! * 30,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 15,
                      childAspectRatio: 6),
                  itemCount: state.gymFeatures!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: AppPallete.shadeOfGray,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          state.gymFeatures![index].name,
                          style: TextStyles
                              .fontCircularSpotify8AccentBlackRegular
                              .copyWith(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}

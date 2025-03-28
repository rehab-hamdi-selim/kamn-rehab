import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/core/utils/custom_dotted_border.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_info/gym_logo_preview_widget.dart';

class CustomGymPhotosSection extends StatelessWidget {
  const CustomGymPhotosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      children: [
  Text("Choose Gym Photos",
          style: TextStyles.fontCircularSpotify14BlackRegular),  
                verticalSpace(8),
        SizedBox(
          height: 94.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => horizontalSpace(8),
            itemCount: 3,
            itemBuilder: (_, index) => CustomDottedUploadImageBox(
                width: 121.w, height: 98.h, index: index),
          ),
        ),
      ],
    );
  }
}

class CustomDottedUploadImageBox extends StatelessWidget {
  const CustomDottedUploadImageBox(
      {super.key, required this.width, required this.height, required this.index});
  final double width;
  final double height;
  final int index;
  @override
  Widget build(BuildContext context) {
    return CustomDottedBorder(
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(vertical: 8.h), // Reduced padding
        decoration: BoxDecoration(
            color: AppPallete.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        child: BlocBuilder<AddGymCubit, AddGymState>(
          builder: (context, state) {
            if ((state.gymImages?.isNotEmpty ?? false) &&
                state.gymImages!.length > index) {
              return GymLogoPreviewWidget(logo: state.gymImages![index],
                  isLogo: false, index: index);
            }
            return Column(
              mainAxisSize: MainAxisSize.min, // Make column take minimum space
              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
              children: [
                SvgPicture.asset(
                  'assets/icons/insert_image.svg',
                  width: 22.w, // Slightly reduced size
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppPallete.whiteColor,
                    side: const BorderSide(
                      color: AppPallete.lightGreyColor,
                      width: 0.27,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.5),
                    ),
                    minimumSize: Size(55.w, 10.h), // Reduced height
                    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w), // Add minimal padding
                  ),
                  onPressed: () {
                    context.read<AddGymCubit>().pickGymImage();
                  },
                  child: Text("Choose file",
                      style: TextStyles.fontCircularSpotify8AccentBlackRegular),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kamn/core/helpers/spacer.dart';
// import 'package:kamn/core/theme/app_pallete.dart';
// import 'package:kamn/core/theme/style.dart';
// import 'package:kamn/core/utils/custom_container.dart';
// import 'package:kamn/core/utils/custom_dotted_border.dart';
// import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
// import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';
// import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/gym_info/gym_logo_preview_widget.dart';
//
// class CustomGymPhozosSection extends StatelessWidget {
//   const CustomGymPhotosSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomContainer(
//       children: [
//   Text("Choose Gym Photos",
//           style: TextStyles.fontCircularSpotify14BlackRegular),
//                 verticalSpace(8),
//         SizedBox(
//           height: 94.h,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             separatorBuilder: (_, __) => horizontalSpace(8),
//             itemCount: 3,
//             itemBuilder: (_, index) => CustomDottedUploadImageBox(
//                 width: 121.w, height: 94.h, index: index),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class CustomDottedUploadImageBox extends StatelessWidget {
//   const CustomDottedUploadImageBox(
//       {super.key, required this.width, required this.height, required this.index});
//   final double width;
//   final double height;
//   final int index;
//   @override
//   Widget build(BuildContext context) {
//     return CustomDottedBorder(
//       child: Container(
//         width: 121.w,
//         height: 94.h,
//         padding: EdgeInsets.symmetric(vertical: 10.h),
//         decoration: BoxDecoration(
//             color: AppPallete.whiteColor,
//             borderRadius: BorderRadius.all(Radius.circular(12.r))),
//         child: BlocBuilder<AddGymCubit, AddGymState>(
//           builder: (context, state) {
//             if ((state.gymImages?.isNotEmpty ?? false) &&
//                 state.gymImages!.length > index) {
//               return GymLogoPreviewWidget(logo:  state.gymImages![index],
//                   isLogo: false, index: index);
//             }
//             return Column(children: [
//               SvgPicture.asset(
//                 'assets/icons/insert_image.svg',
//                 width: 25.w,
//               ),
//               TextButton(
//                 style: TextButton.styleFrom(
//                   backgroundColor: AppPallete.whiteColor,
//                   side: const BorderSide(
//                     color: AppPallete.lightGreyColor,
//                     width: 0.27,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(3.5),
//                   ),
//                   minimumSize: Size(61.w, 16.h),
//                 ),
//                 onPressed: () {
//                   context.read<AddGymCubit>().pickGymImage();
//                 },
//                 child: Text("Choose file",
//                     style: TextStyles.fontCircularSpotify8AccentBlackRegular),
//               ),
//             ]);
//           },
//         ),
//       ),
//     );
//   }
// }

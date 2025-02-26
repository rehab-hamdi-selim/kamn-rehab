import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/track_ground_reservations/track_ground_reservations_cubit.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/track_ground_reservations/track_ground_reservations_states.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/track_ground_reservations/custom_track_bloc_listner.dart';
import '../../../../core/const/constants.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/style.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/service_provider_grounds/custom_bottom_service_provider.dart';
import '../widgets/service_provider_grounds/custom_filter_item_service_provider.dart';
import '../widgets/service_provider_grounds/custom_text_form_field_service_provider.dart';
import '../widgets/track_ground_reservations/custom_ground_item.dart';

class TrackGroundReservationsScreen extends StatelessWidget {
  const TrackGroundReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return CustomeTrackBlocListner(
      child: Scaffold(
        backgroundColor: AppPallete.whiteColor,
        appBar:  CustomAppBar.appBar(
            context: context,
            color: AppPallete.whiteColor,
            notificationIconFunction: () {},
            profileFunction: () {},
            badgesIconFunction: () {},
          ),
        body: RPadding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Constants.groundsScreenTitle,
                style: TextStyles.fontCircularSpotify32BlackMedium,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextFormField(
                    controller: controller,
                  )),
                  horizontalSpace(5),
                  CustomBottomServiceProvider(
                    iconVisible: true,
                    iconWidget: Image.asset(
                      AppImages.filterImage,
                      width: 15.w,
                      height: 15.h,
                    ),
                    onPressed: () {},
                    textBottom: 'Filter',
                    textStyle: TextStyles.fontCircularSpotify12WhiteRegular,
                  ),
                ],
              ),
              verticalSpace(10),
              SizedBox(
                height: 30.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomFilterItemServiceProvider(
                          icon: Icons.location_on_outlined,
                          text: "Alexandria, Hadra",
                          onPressed: () {});
                    },
                    separatorBuilder: (context, index) {
                      return horizontalSpace(5);
                    },
                    itemCount: 5),
              ),
              verticalSpace(20),
              Expanded(
                child: Container(
                  width: 335.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  decoration: BoxDecoration(
                    color: AppPallete.lightGrayColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: BlocBuilder<TrackGroundReservationsCubit,
                      TrackGroundsState>(
                    builder: (context, state) {
                      if (state.isInitial || state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final playgrounds = state.playgrounds ?? [];

                      if (playgrounds.isEmpty) return const SizedBox.shrink();
                      // return Text('yes');
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    Routes.trackGroundResrvationsDetail,
                                    arguments: playgrounds[index]);
                              },
                              child: CustomGroundItem(
                                playground: state.playgrounds![index],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return verticalSpace(17.89);
                          },
                          itemCount: state.playgrounds!.length);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

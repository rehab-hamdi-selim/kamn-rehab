import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports/presentation/cubits/reservation_details_cubit/reservation_details_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/reservation_details_cubit/reservation_details_state.dart';
import 'package:kamn/core/utils/custom_star_rating.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/track_ground_reservation_details/date_and_countdown_widget.dart';

class CustomePlayGroundInfo extends StatelessWidget {
  const CustomePlayGroundInfo({required this.reservationModel, super.key});

  final ReservationModel? reservationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpace(15.h),
          ownerAndDirectionRow(),
          verticalSpace(5.h),
          playGroundNameAndRating(),
          Text(
            reservationModel?.ground?.address ?? "",
            style: TextStyles.font12GreenSemiBold,
          ),
          verticalSpace(5.h),
          DateAndCountdownWidget(
            session: Session(
                startAt: reservationModel?.startAt ?? DateTime.now(),
                endAt: reservationModel?.endAt ?? DateTime.now()),
          ),
          verticalSpace(5.h),
          playGroundFeatures(),
          verticalSpace(10.h),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: BlocBuilder<ReservationDetailsCubit,
                    ReservationDetailsState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Text(
                              " Lorem ipsum dolor sit amet consectetur. Aliquam auctor erat bibendum magna mi. Sed diam cursus quam volutpat faucibus ullamcorper phasellus urna semper. Et eget aliquet odio iaculis viverra aliquet venenatis. Purus malesuada odio enim elit. Non in est faucibus eget nec. Faucibus mauris elit dictum ultricies ut amet purus. Consequat aliquam volutpat quisque auctor tristique elementum nunc. Ultricies diam fermentum ullamcorper egestas aenean fringilla commodo. Semper habitasse mauris ornare imperdiet. Egestas non magna id a. Sollicitudin sodales sit purus volutpat mi aliquam lobortis dictum. Tortor integer ullamcorper orci enim cursus netus sed.Nunc odio consequat morbi dolor pharetra sed proin. Cras nisi malesuada malesuada tristique sit at sit felis. Enim hendrerit eu suscipit vel nibh natoque. Neque at malesuada nunc tortor odio. Vulputate quam egestas nam etiam nec feugiat. Convallis ipsum senectus a tellus.Metus lectus luctus viverra donec. Augue cursus viverra eros in. Nunc, eget aliquet odio iaculis",
                              style: TextStyles.font12blackRegular
                                  .copyWith(fontSize: 16.h),
                              maxLines: state.maxLines,
                              textAlign: TextAlign.center,
                            ),
                            if (state.isVisible!)
                              Positioned(
                                bottom:
                                    0, // Ensure the container is aligned to the bottom
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 200.h,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(0, 255, 255, 255),
                                        Colors.white,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (state.isVisible!) readMoreButton(context)
                          ],
                        ),
                        if (!state.isVisible!) showLessButton(context)
                      ],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Positioned readMoreButton(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 30.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: const BorderSide(
                color: AppPallete.lightGreenColor,
                width: 1,
              ),
              backgroundColor: const Color(0xffF6F6F6).withOpacity(0.65),
              elevation: 0,
            ),
            onPressed: () {
              context.read<ReservationDetailsCubit>().changeVisibility();
            },
            child: Text(
              'Read more',
              style: TextStyles.font16blackRegular,
            ),
          ),
        ),
      ),
    );
  }

  Widget showLessButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 30.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
              color: AppPallete.lightGreenColor,
              width: 1,
            ),
            backgroundColor: const Color(0xffF6F6F6).withOpacity(0.65),
            elevation: 0,
          ),
          onPressed: () {
            context.read<ReservationDetailsCubit>().changeVisibility();
          },
          child: Text(
            'show less',
            style: TextStyles.font16blackRegular,
          ),
        ),
      ),
    );
  }

  Row playGroundFeatures() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Constants.playGroundFeatures,
          style: TextStyles.font20BlackBold,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: AppPallete.greenColor.withOpacity(.3),
                ),
              ),
              child: CircleAvatar(
                radius: 5.sp,
                backgroundColor: AppPallete.lightGreen,
              ),
            ),
            horizontalSpace(6.w),
            Text(
              Constants.available,
              style: TextStyles.font13BlackRegular,
            )
          ],
        )
      ],
    );
  }

  Row playGroundNameAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(reservationModel?.ground?.playgroundName ?? "",
            style: TextStyles.font24BlackRegular.copyWith(height: .85),
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
        const Spacer(
          flex: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
            decoration: BoxDecoration(
                color: AppPallete.shadeOfGray,
                borderRadius: BorderRadius.circular(23.r)),
            child: CustomStarRating(
                rating: reservationModel?.ground?.rating ?? 0)),
      ],
    );
  }

  Row ownerAndDirectionRow() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13.r)),
            color: AppPallete.shadeOfGray,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                  radius: 10.r, child: Image.asset('assets/images/user.png')),
              horizontalSpace(3.w),
              Text(
                'mahmoudsayed',
                style: TextStyles.font10BlackColorW400,
              )
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        SizedBox(
          height: 25.h,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppPallete.lightGreen.withOpacity(.07),
                side: BorderSide(
                    color: AppPallete.lightGreen.withOpacity(.3), width: 1)),
            onPressed: () {},
            label: Text(
              Constants.directions,
              style: TextStyles.font14GreenRegular,
            ),
            icon: SvgPicture.asset('assets/icons/direction.svg'),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports/presentation/cubits/reservation_details_cubit/reservation_details_cubit.dart';

class CustomeBottomBar extends StatelessWidget {
  const CustomeBottomBar({required this.reservationModel, super.key});

  final ReservationModel? reservationModel;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppPallete.whiteColor,
      child: Container(
        height: 62.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(65),
            color: AppPallete.whiteColor,
            border: Border.all(
                color: AppPallete.redColor.withOpacity(.36), width: 1)),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text:
                        '${(reservationModel?.ground?.price)?.toStringAsFixed(0)} LE',
                    style: TextStyles.font32OfWhiteMedium
                        .copyWith(color: AppPallete.redColor),
                    children: [
                      TextSpan(
                        text: ' / hr',
                        style: TextStyles.font20OfWhiteReuglar
                            .copyWith(color: AppPallete.redColor),
                      )
                    ]),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppPallete.redColor,
                    fixedSize: Size.fromWidth(100.w),
                  ),
                  onPressed: () async {
                  context.read<ReservationDetailsCubit>().deleteReservation(reservationModel!);
                   
                  },
                  child: Text(
                    'Leave',
                    style: TextStyles.font16greenSemiBold
                        .copyWith(color: AppPallete.whiteColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/service_provider_grounds_screen.dart';

class CustomeSportCategory extends StatelessWidget {
  final String title;
  final Color color;
  const CustomeSportCategory(
      {super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                    value: context.read<ServiceProviderGroundsCubit>(),
                    child: ServiceProviderGroundsScreen(
                      type: title,
                    ))));
      },
      child: Container(
        height: 100.h,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: AppPallete.whiteColor,
            borderRadius: BorderRadius.circular(8.h)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    TextStyles.fontRoboto16RegularBlack.copyWith(color: color),
              ),
              SvgPicture.asset(
                'assets/images/${title}_avatar.svg',
                width: 100.w,
                height: 90.h,
                fit: BoxFit.fill,
              )
            ],
          ),
        ),
      ),
    );
  }
}

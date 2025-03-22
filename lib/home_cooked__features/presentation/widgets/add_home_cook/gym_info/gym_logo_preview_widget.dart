import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';

class GymLogoPreviewWidget extends StatelessWidget {
  final File logo;
  final bool isLogo;
  final int? index;

  const GymLogoPreviewWidget({
    super.key,
    required this.logo,
    this.isLogo = true,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Image.file(
            logo,
            height: 84.h,
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () => isLogo
                ? context.read<AddHomeCookCubit>().pickLogoImage()
                : context.read<AddHomeCookCubit>().replaceHomeCookImage(index!),
            child: SvgPicture.asset('assets/icons/replace.svg'),
          ),
        ),
      ],
    );
  }
}

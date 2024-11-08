import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';

import 'package:kamn/core/theme/style.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:kamn/features/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_state.dart';

class CustomeGroundImagePicker extends StatelessWidget {
  final List<String> groundImages;
  bool isInit = false;
  CustomeGroundImagePicker({super.key, required this.groundImages});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            text: Constants.addGroundImage,
            style: TextStyles.fontInter14BlackMedium,
            children: [
              TextSpan(
                text: Constants.numOfImage,
                style: TextStyles.fontInter10GreyLight,
              ),
            ],
          ),
        ),
        verticalSpace(10.w),
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          color: Colors.black,
          strokeWidth: 1,
          child:
              BlocBuilder<EditServiceProviderCubit, EditServiceProviderState>(
            builder: (context, state) {
              if (state.groundImagesList!.isEmpty && !isInit) {
                state.groundImagesList = groundImages;
                isInit = true;
              }
              return Row(
                children: [
                  Row(
                    children: state.groundImagesList!.map((element) {
                      return Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            width: 95.w,
                            height: 85.w,
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: element is String
                                    ? NetworkImage(element)
                                    : FileImage(element),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5.w,
                            child: InkWell(
                              onTap: () => context
                                  .read<EditServiceProviderCubit>()
                                  .removeImageFromList(element),
                              child: const Icon(
                                Icons.cancel_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  if (state.groundImagesList!.length <= 2)
                    Expanded(
                      child: GestureDetector(
                        onTap: () => context
                            .read<EditServiceProviderCubit>()
                            .getPhotoFromGallery(),
                        child: SizedBox(
                          height: 80.h,
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/widget/view_full_image.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';

import 'package:kamn/core/theme/style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_state.dart';

class CustomeOwnershipImagePicker extends StatelessWidget {
  const CustomeOwnershipImagePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            text: Constants.addOwnershipImage,
            style: TextStyles.fontInter14BlackMedium,
            children: [
              TextSpan(
                text: Constants.detailsClear,
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
          child: BlocBuilder<AddServiceProviderCubit, AddServiceProviderState>(
            builder: (context, state) {
              return Row(
                children: [
                  Row(
                    children: state.ownershipImagesList!.map((element) {
                      return InkWell(
                         onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewFullImage(
                                        imageUrl: element.path,
                                      )));
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Hero(
                              tag: element.path,
                              child: Container(
                                width: 95.w,
                                height: 85.w,
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: FileImage(element),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 5.w,
                              child: InkWell(
                                onTap: () => context
                                    .read<AddServiceProviderCubit>()
                                    .removeImageFromList(element, false),
                                child: const Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  if (state.ownershipImagesList!.length <= 2)
                    Expanded(
                      child: GestureDetector(
                        onTap: () => context
                            .read<AddServiceProviderCubit>()
                            .getPhotoFromGallery(false),
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

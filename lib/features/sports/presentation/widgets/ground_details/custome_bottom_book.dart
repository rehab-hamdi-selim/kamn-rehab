import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';

class CustomeBottomBook extends StatelessWidget {
  const CustomeBottomBook({required this.playgroundModel, super.key});

  final PlaygroundModel? playgroundModel;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppPallete.whiteColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(65),
          color: AppPallete.greenColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: playgroundModel?.price
                        .toString(), //TODO: dont pass the all model to display one attribute like price
                    style: TextStyles.font32OfWhiteMedium,
                    children: [
                      TextSpan(
                          text: ' / hr', style: TextStyles.font20OfWhiteReuglar)
                    ]),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    Constants.bookNow,
                    style: TextStyles.font16greenSemiBold,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

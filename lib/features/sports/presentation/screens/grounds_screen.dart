import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme_data/app_palette.dart';
import 'package:kamn/core/theme_data/style.dart';
import 'package:kamn/core/utils/app_images.dart';
import 'package:kamn/features/sports/presentation/screens/ground_details_screen.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_item.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_ground_item.dart';
import '../../data/data_source/sports_remote_data_source.dart';
import '../../data/repositories/sports_repository.dart';
import '../cubits/sports_grounds/sports_ground_cubit.dart';
import '../cubits/sports_grounds/sports_ground_state.dart';
import '../widgets/grounds_screen/custom_app_bar.dart';
import '../widgets/grounds_screen/custom_bottom.dart';
import '../widgets/grounds_screen/custom_grounds_bloc_listner.dart';
import '../widgets/grounds_screen/custom_text_form_field.dart';
import '../widgets/grounds_screen/custom_your_next_match_timer.dart';

class GroundsScreen extends StatelessWidget {
  const GroundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return CustomGroundsBlocListner(
      child: Scaffold(
        backgroundColor: AppPalette.backgroundColor,
        appBar: CustomAppBar.appBar(
          arrowFunction: () {},
          notificationIconFunction: () {},
          profileFunction: () {},
          badgesIconFunction: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Constants.groundsScreenTitle,
                style: Style.font30DarkGreenColorBold,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextFormField(
                    controller: controller,
                  )),
                  horizontalSpace(5),
                  CustomBottom(
                    iconVisible: true,
                    iconWidget: Image.asset(
                      AppImages.filterImage,
                      width: 15.w,
                      height: 15.h,
                    ),
                    onPressed: () {},
                    textBottom: 'Filter',
                    textStyle: Style.font12WhiteColorW400,
                  ),
                ],
              ),
              verticalSpace(10),
              SizedBox(
                height: 30.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomFilterItem(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Constants.reservation,
                    style: Style.font15BlackColorBold,
                  ),
                  Text(
                    Constants.showAll,
                    style: Style.font10GrayColorW400,
                  ),
                ],
              ),
              verticalSpace(10),
              const CustomYourNextMatchTimer(),
              verticalSpace(20),
              BlocBuilder<SportsGroundsCubit, SportsGroundsState>(
                  builder: (context, state) {
                //Dont miss to add the empty list check and initial chack
                if (state.isLoading || state.isInitial) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                final grounds = state.playgrounds ?? [];
                if (grounds.isEmpty) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Center(
                      child: Text(
                        "Grounds Not Found",
                        style: Style.font16DartBlackColorW400,
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GroundDetailsScreen(
                                playgroundModel: state.playgrounds![index],
                              ),
                            ),
                          );
                        },
                        child: CustomGroundItem(
                          imageUrl: state.playgrounds![index].images.isEmpty
                              ? ''
                              : state.playgrounds![index].images.first
                                  .toString(),
                          favoriteOnTap: () {},
                          placeText: state.playgrounds![index].name,

                          ///TODO:
                          km: "2.7",

                          ///TODO:
                          owner: "owner name",
                          location: state.playgrounds![index].address,

                          ///TODO:
                          available: "available",
                          rates: state.playgrounds![index].rating.toString(),
                          price: state.playgrounds![index].price.toString(),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return verticalSpace(10);
                    },
                    itemCount: state.playgrounds?.length ?? 0,
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

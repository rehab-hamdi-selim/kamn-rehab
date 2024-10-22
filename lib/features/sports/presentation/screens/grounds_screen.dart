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
import '../../../../core/theme/app_pallete.dart';
import '../../data/data_source/sports_remote_data_source.dart';
import '../../data/repositories/sports_repository.dart';
import '../cubits/sports_grounds/sports_ground_cubit.dart';
import '../cubits/sports_grounds/sports_ground_state.dart';
import '../widgets/grounds_screen/custom_app_bar.dart';
import '../widgets/grounds_screen/custom_bottom.dart';
import '../widgets/grounds_screen/custom_text_form_field.dart';
import '../widgets/grounds_screen/custom_your_next_match_timer.dart';

class GroundsScreen extends StatelessWidget {
  const GroundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return BlocProvider(
      create: (context) => SportsGroundsCubit(
        sportsRepository: SportsRepository(
          remoteDataSource: SportsRemoteDataSourceImpl(
            firestore: FirebaseFirestore.instance,
          ),
        ),
      )..getPlaygrounds(),
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
                  if (state.state == SportsGroundsStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppPallete.greenColor,),
                    );
                  } else if (state.state == SportsGroundsStatus.failure) {
                    return Center(
                      child: Text(
                        "${state.erorrMessage}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return (state.playgrounds?.length ?? 0) == 0
                        ? Center(
                            child: Text(
                              "Grounds Not Found",
                              style: Style.font16DartBlackColorW400,
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return CustomGroundItem(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            GroundDetailsScreen(
                                          playgroundModel: state.playgrounds![
                                              index], // Optional chaining
                                        ),
                                      ),
                                    );
                                  },
                                  imageUrl: state
                                          .playgrounds![index].images.isEmpty
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
                                  rates: state.playgrounds![index].rating
                                      .toString(),
                                  price: state.playgrounds![index].price
                                      .toString(),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return verticalSpace(10);
                              },
                              itemCount: state.playgrounds?.length ?? 0,
                            ),
                          );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/sports/presentation/widgets/ground_details/custome_bottom_book.dart';
import 'package:kamn/features/sports/presentation/widgets/ground_details/custome_play_ground_info.dart';
import 'package:kamn/features/sports/presentation/widgets/ground_details/custome_image_slide_show.dart';

import '../../data/models/playground_model.dart';
import '../cubits/sports_grounds/sports_ground_cubit.dart';
import '../cubits/sports_grounds/sports_ground_state.dart';
import '../widgets/ground_details/custom_black_filter.dart';
import '../widgets/ground_details/custom_play_ground_title_and_location.dart';

class GroundDetailsScreen extends StatelessWidget {
  const GroundDetailsScreen({super.key, required this.playgroundModel});
  final PlaygroundModel playgroundModel;

  @override
  Widget build(BuildContext context) {
    final scrollController = context
        .read<SportsGroundsCubit>()
        .sportsGroundViewModel
        .scrollController;
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 346.h,
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 346.h,
                  // Image height
                  child: CustomeImageSlideShow(
                      imagesPath: playgroundModel.groundImages ?? [])),
              const CustomBlackFilter()
            ])),
          ),
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: BlocSelector<SportsGroundsCubit, SportsGroundsState, bool>(
                selector: (state) =>
                    state.isScrolledDown ||
                    state.isReturnedToTop ||
                    state.isInitial,
                builder: (context, isScrolledDown) => SliverAppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: 150.h,
                    expandedHeight: 150.h,
                    floating: true,
                    snap: true,
                    backgroundColor: isScrolledDown
                        ? Colors.white
                        : const Color.fromARGB(224, 212, 246, 216),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30.r),
                          bottom: Radius.circular(isScrolledDown ? 0 : 30.r)),
                    ),
                    title: CustomPlayGroundTitleAndLocation(
                        playgroundModel: playgroundModel)),
              )),
        ],
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const SingleChildScrollView(
                child: CustomePlayGroundInfo(
                  playgroundModel: null,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(color: AppPallete.whiteColor,
                child: CustomeBottomBook(
                  playgroundModel: playgroundModel,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

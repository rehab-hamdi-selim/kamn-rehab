import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/sports/presentation/cubits/ground_details_cubit/ground_details_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/ground_details_cubit/ground_details_state.dart';
import 'package:kamn/features/sports/presentation/widgets/ground_details/custome_bottom_book.dart';
import 'package:kamn/features/sports/presentation/widgets/ground_details/custome_play_ground_info.dart';
import 'package:kamn/features/sports/presentation/widgets/ground_details/custome_image_slide_show.dart';

import '../../data/models/playground_model.dart';
import '../widgets/ground_details/custom_black_filter.dart';
import '../widgets/ground_details/custom_play_ground_title_and_location.dart';

class GroundDetailsScreen extends StatelessWidget {
  const GroundDetailsScreen({super.key, required this.playgroundModel});
  final PlaygroundModel playgroundModel;

  @override
  Widget build(BuildContext context) {
    final scrollController = context
        .read<GroundDetailsCubit>()
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
                  child: BlocBuilder<GroundDetailsCubit, GroundDetailsState
                     >(
                 
                    builder: (context, state) {
                    

                      return SliverAppBar(
                        automaticallyImplyLeading: false,
                        toolbarHeight: 150.h,
                        expandedHeight: 150.h,
                        floating: true,
                        snap: true,
                        backgroundColor: state.isInitial || state.isScrolledDown||state.isReturnedToTop
                            ? Colors.white
                            : const Color.fromARGB(224, 212, 246, 216),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30.r),
                            bottom: Radius.circular(
                              (state.isInitial || state.isScrolledDown||state.isReturnedToTop) ? 0 : 30.r,
                            ),
                          ),
                        ),
                        title: CustomPlayGroundTitleAndLocation(
                          playgroundModel: playgroundModel,
                        ),
                      );
                    },
                  ),
                ),
              ],
          body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: CustomePlayGroundInfo(
                      description:
                          playgroundModel.description ?? 'empty description',
                    ),
                  ),
                ),
                CustomeBottomBook(
                  playgroundModel: playgroundModel,
                ),
              ],
            ),
          )),
    );
  }
}

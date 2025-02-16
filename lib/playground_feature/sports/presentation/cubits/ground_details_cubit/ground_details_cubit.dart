import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/ground_details_cubit/ground_details_state.dart';

@injectable
class GroundDetailsCubit extends Cubit<GroundDetailsState> {
  GroundDetailsCubit()
      : super(GroundDetailsState(status: GroundDetailsStatus.initial)) {
    scrollController = ScrollController();
    initScrollListener();
  }
  ScrollController? scrollController;

 void initScrollListener() {
  scrollController?.addListener(() {
    final scrollPosition = scrollController!.position.pixels;

    // Scrolling Down
    if (scrollController!.position.userScrollDirection == ScrollDirection.reverse &&
        !state.isScrolledDown &&
        scrollPosition >= Constants.kImageSliderHeight) {
      _emitState(GroundDetailsStatus.isScrolledDown);
      return;
    }

    // Returning to Top
    if (scrollPosition <= kToolbarHeight + Constants.additionHightToToolBar &&
        scrollPosition != 0 &&
        !state.isReturnedToTop) {
      _emitState(GroundDetailsStatus.isReturnedToTop);
      return;
    }

    // Scrolling Up
    if (state.isScrolledDown &&
        scrollController!.position.userScrollDirection == ScrollDirection.forward) {
      _emitState(GroundDetailsStatus.isScrollingUp);
    }
  });
}

// Helper Method to Emit State
void _emitState(GroundDetailsStatus status) {
  final newState = GroundDetailsState(status: status);

  // Use the overridden `==` operator to check equality
  if (newState != state) {
    emit(newState);
  }
}


  @override
  Future<void> close() {
    scrollController?.dispose();
    return super.close();
  }
}

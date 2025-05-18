import 'package:bloc/bloc.dart';
import 'package:kamn/main/presentation/cubit/bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarState(currentIndex: 0));
  void updateCurrentIndex({required int index}) {
    emit(state.copyWith(currentIndex: index));
  }
}

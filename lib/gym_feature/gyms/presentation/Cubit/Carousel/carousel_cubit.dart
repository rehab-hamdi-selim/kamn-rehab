import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/gym_feature/gyms/presentation/cubit/Carousel/carousel_state.dart';

class CarouselPageCubit extends Cubit<CarouselPageState> {
  CarouselPageCubit() : super(const CarouselPageState());

  void updatePageIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}

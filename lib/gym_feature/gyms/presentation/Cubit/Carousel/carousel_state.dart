import 'package:equatable/equatable.dart';

class CarouselPageState extends Equatable {
  final int currentIndex;

  const CarouselPageState({this.currentIndex = 0});

  @override
  List<Object> get props => [currentIndex];

  CarouselPageState copyWith({int? currentIndex}) {
    return CarouselPageState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

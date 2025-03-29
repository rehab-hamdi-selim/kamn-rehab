import 'package:kamn/home_cooked__features/data/models/meals_model.dart';

enum OrderOptionStatus { initial, loading, success, error }

///

extension OrderOptionsStateExtension on OrderOptionsState {
  bool get isInitial => state == OrderOptionStatus.initial;
  bool get isLoading => state == OrderOptionStatus.loading;
  bool get isSuccess => state == OrderOptionStatus.success;
  bool get isError => state == OrderOptionStatus.error;
}

class OrderOptionsState {
  final OrderOptionStatus state;
  final String? error;
  final bool isPickupSelected;
  final bool isDeliverySelected;
  final bool checkboxerror;
  // final Meal? meal;
  //  final Map<String, List<PlaygroundModel>>? playgroundsMap;

  OrderOptionsState({
    required this.state,
    this.error,
    this.isPickupSelected = false,
    this.isDeliverySelected = false,
    this.checkboxerror = false,

    // this.meal,
  });

  OrderOptionsState copyWith({
    OrderOptionStatus? state,
    String? error,
    bool? isPickupSelected,
    bool? isDeliverySelected,
    bool? checkboxerror,
    //  Meal? meal,
    //  Map<String, List<PlaygroundModel>>? playgroundsMap,
  }) {
    return OrderOptionsState(
      state: state ?? this.state,
      error: error ?? this.error,
      isPickupSelected: isPickupSelected ?? this.isPickupSelected,
      isDeliverySelected: isDeliverySelected ?? this.isDeliverySelected,
      checkboxerror: checkboxerror ?? this.checkboxerror,
      //// meal: meal ?? this.meal,

      // playgroundsMap: playgroundsMap ?? this.playgroundsMap,
    );
  }

  //@override
  // String toString() => 'SelectCategoryState(state: $state, error: $error, playgroundsMap: $playgroundsMap)';
}

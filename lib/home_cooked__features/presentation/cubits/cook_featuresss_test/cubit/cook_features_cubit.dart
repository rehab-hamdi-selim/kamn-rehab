import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/cook_featuresss_test/cubit/gym_features_state.dart';

class CookFeaturesCubit extends Cubit<CookFeaturesState> {
  CookFeaturesCubit() : super(const CookFeaturesState());

  String? statusOption;

  void onChangeStatusSelection(String newOption) {
    if (statusOption == newOption) {
      return;
    }
    statusOption = newOption;
    emit(state.copyWith(selectedValue: newOption));
  }

  void takeSelectedValue(String value) {
    emit(state.copyWith(selectedValue: value));
  }

  void takeTypedText(String text) {
    emit(state.copyWith(typedText: text));
  }

  void takeisChecked(bool checked) {
    emit(state.copyWith(isCHecked: checked));
  }
}

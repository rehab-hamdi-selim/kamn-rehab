import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/gym_features/cubit/gym_features_state.dart';

class GymFeaturesCubit extends Cubit<GymFeaturesState>{
  GymFeaturesCubit() : super(const GymFeaturesState());

  void takeSelectedValue(String value){
    emit(state.copyWith(selectedValue: value));
  }

    void takeTypedText(String text){
    emit(state.copyWith(typedText: text));
  }

  void takeisChecked(bool checked){
    emit(state.copyWith(isCHecked: checked));
  }

}
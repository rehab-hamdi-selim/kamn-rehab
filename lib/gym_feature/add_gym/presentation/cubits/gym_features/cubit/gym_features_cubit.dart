import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/gym_features/cubit/gym_features_state.dart';
import 'package:path/path.dart';

class GymFeaturesCubit extends Cubit<GymFeaturesState>{
  GymFeaturesCubit() : super(const GymFeaturesState());

//Function to control DropDownMenu
  void takeSelectedValue(String value){
    emit(state.copyWith(selectedValue: value));
    emit(const FeatureTyping());
  }
//Function to control Price_TextFormField
    void takePriceText(String text){
    emit(state.copyWith(priceText: text));
    emit(const FeatureTyping());
  }
//Function to control RadioButton_Selection
  void takeisChecked(bool value){
    emit(state.copyWith(isChecked: value));
  }
//Function to control Description_TextFormField
     void takeDescriptionText(String text){
    emit(state.copyWith(descriptionText: text));
    emit(const FeatureTyping());
  }

  void addFeaturesButton (BuildContext context){
    try {
      if(state.descriptionText.isEmpty ){
     showSnackBar(context, 'Add description');
      }else if(state.priceText.isEmpty){
     showSnackBar(context, 'Add Price');
      //  throw Exception('Price cannot be empty');
      }else if(state.selectedValue.isEmpty){
     showSnackBar(context, 'Add feature');
       // throw Exception('Feature cannot be empty');
      }else if(state.isChecked==false){
     showSnackBar(context, 'Add rent rate');
       // throw Exception('Rent cannot be empty');
      }
      emit(const FeatureAdded());
    } catch (e){
      emit(const FeatureError().copyWith(
        descriptionText: state.descriptionText,
        priceText: state.priceText,
        selectedValue: state.selectedValue,
        isChecked: state.isChecked
      ));

    }

  }

}
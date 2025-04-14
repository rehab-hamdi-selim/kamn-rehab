import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/gym_feature/add_gym/data/repositories/add_gym_repository.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';
import 'package:uuid/uuid.dart';

part 'create_gym_feature_state.dart';
@injectable
class CreateGymFeatureCubit extends Cubit<CreateGymFeatureState> {
  CreateGymFeatureCubit({required this.repository}) : super(const CreateGymFeatureState(status: CreateGymFeatureStatus.initial));
  final AddGymRepository repository;
  final TextEditingController menuController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController featureDescriptionController =
      TextEditingController();

  void addFeature() {
    emit(state.copyWith(
      status: CreateGymFeatureStatus.featureAdded,
      addedFeatures: [
        ...state.addedFeatures ?? [],
        Feature(
          name: menuController.text,
          description: featureDescriptionController.text,
          price: priceController.text,
          pricingOption: state.featureType,
          id: const Uuid().v4(),
        )
      ],
    ));
  }
  
  void removeFeature(Feature feature) {
    if (state.addedFeatures == null || state.addedFeatures!.isEmpty) {
      return;
    }
    
    final updatedFeatures = List<Feature>.from(state.addedFeatures!);
    updatedFeatures.remove(feature);
    
    emit(state.copyWith(
      status: CreateGymFeatureStatus.featureRemoved,
      addedFeatures: updatedFeatures,
    ));
  }
  
  void onChangeRadioSelection(FeatureType newOption) {
    if (state.featureType == newOption) {
      return;
    }
    if(newOption==FeatureType.free){
      priceController.clear();
    }
    emit(state.copyWith(
        status: CreateGymFeatureStatus.radioSelected, featureType: newOption));
  }
  void submitFeatures(String gymId) async {
    emit(state.copyWith(status: CreateGymFeatureStatus.loading));
    final result = await repository.addGymFeatures(gymId, state.addedFeatures??[]);
    result.fold(
      (l) => emit(state.copyWith(status: CreateGymFeatureStatus.failure)),
      (r) => emit(state.copyWith(status: CreateGymFeatureStatus.success)),
    );
  }
  @override
  Future<void> close() {
    menuController.dispose();
    priceController.dispose();
    featureDescriptionController.dispose();
    return super.close();
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_gym_feature_cubit.dart';

enum CreateGymFeatureStatus {
  initial,
  radioSelected,
  featureAdded,
  featureRemoved,
  success,
  failure,
  loading,
}

extension CreateGymFeatureStateX on CreateGymFeatureState {
  bool get isInitial => status == CreateGymFeatureStatus.initial;
  bool get isSuccess => status == CreateGymFeatureStatus.success;
  bool get isFailure => status == CreateGymFeatureStatus.failure;
  bool get isLoading => status == CreateGymFeatureStatus.loading;
  bool get isRadioSelected => status == CreateGymFeatureStatus.radioSelected;
  bool get isFeatureAdded => status == CreateGymFeatureStatus.featureAdded;
  bool get isFeatureRemoved => status == CreateGymFeatureStatus.featureRemoved;
}

class CreateGymFeatureState {
  final CreateGymFeatureStatus status;
  final String? errorMessage;
  final FeatureType? featureType;
  final List<Feature>? addedFeatures;

  const CreateGymFeatureState({
    required this.status,
    this.errorMessage,
    this.featureType,
    this.addedFeatures,
  });

  CreateGymFeatureState copyWith({
    CreateGymFeatureStatus? status,
    String? errorMessage,
    FeatureType? featureType,
    List<Feature>? addedFeatures,
  }) {
    return CreateGymFeatureState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      featureType: featureType ?? this.featureType,
      addedFeatures: addedFeatures ?? this.addedFeatures,
    );
  }

  @override
  String toString() {
    return 'CreateGymFeatureState(status: $status, errorMessage: $errorMessage, featureType: $featureType, addedFeatures: $addedFeatures)';
  }
}

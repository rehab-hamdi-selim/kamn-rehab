import 'package:kamn/gym_feature/gyms/data/models/features_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_details_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/plan_model.dart';

enum GymDetailsStatus {
  initial,
  loading,
  success,
  error,
  featuresLoading,
  featuresSuccess,
  featuresError,
  plansLoading,
  plansSuccess,
  plansError,
}

extension GymDetailsStateX on GymDetailsState {
  bool get isInitial => state == GymDetailsStatus.initial;
  bool get isLoading => state == GymDetailsStatus.loading;
  bool get isSuccess => state == GymDetailsStatus.success;
  bool get isError => state == GymDetailsStatus.error;
  bool get isFeaturesLoading => state == GymDetailsStatus.featuresLoading;
  bool get isFeaturesSuccess => state == GymDetailsStatus.featuresSuccess;
  bool get isFeaturesError => state == GymDetailsStatus.featuresError;
  bool get plansLoading => state == GymDetailsStatus.plansLoading;
  bool get plansSuccess => state == GymDetailsStatus.plansSuccess;
  bool get plansError => state == GymDetailsStatus.plansError;
}

class GymDetailsState {
  final GymDetailsStatus state;
  final String? errorMessage;
  final GymDetailsModel? gymDetails;
  final List<GymDetailsModel>? allGyms;
  final List<FeatureModel>? gymFeatures;
  final List<Plan>? gymPlans;
  final   Map<FeatureModel, int>? selectedFeatures ;
  


  GymDetailsState({
    required this.state,
    this.errorMessage,
    this.gymDetails,
    this.allGyms,
    this.gymFeatures,
    this.selectedFeatures,
    this.gymPlans
  });

  GymDetailsState copyWith({
    GymDetailsStatus? state,
    String? errorMessage,
    GymDetailsModel? gymDetails,
    List<GymDetailsModel>? allGyms,
    List<FeatureModel>? gymFeatures,
    List<Plan>? gymPlans,
     Map<FeatureModel, int>? selectedFeatures
    
  }) {
    return GymDetailsState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
      gymDetails: gymDetails ?? this.gymDetails,
      allGyms: allGyms ?? this.allGyms,
      gymFeatures: gymFeatures ?? this.gymFeatures,
      selectedFeatures: selectedFeatures??this.selectedFeatures, 
      gymPlans:gymPlans??this.gymPlans 
    );
  }

  @override
  String toString() {
    return 'GymDetailsState(state: $state, errorMessage: $errorMessage, gymDetails: $gymDetails, allGyms: $allGyms)';
  }
}

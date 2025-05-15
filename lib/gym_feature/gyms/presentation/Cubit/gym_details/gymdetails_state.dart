// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

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

class GymDetailsState  {
  final GymDetailsStatus state;
  final String? errorMessage;
  final GymModel? gymDetails;
  final List<GymModel>? allGyms;
  final List<Feature>? gymFeatures;
  final List<Plan>? gymPlans;
  final Map<Feature, int>? selectedFeatures ;
  final Plan? selectedPlan;
  


  GymDetailsState({
    required this.state,
    this.errorMessage,
    this.gymDetails,
    this.allGyms,
    this.gymFeatures,
    this.gymPlans,
     this.selectedFeatures,this.selectedPlan
  });

  GymDetailsState copyWith({
    GymDetailsStatus? state,
    String? errorMessage,
    GymModel? gymDetails,
    List<GymModel>? allGyms,
    List<Feature>? gymFeatures,
    List<Plan>? gymPlans,
    Map<Feature, int>? selectedFeatures,   Plan? selectedPlan,
  }) {
    return GymDetailsState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
      gymDetails: gymDetails ?? this.gymDetails,
      allGyms: allGyms ?? this.allGyms,
      gymFeatures: gymFeatures ?? this.gymFeatures,
      gymPlans: gymPlans ?? this.gymPlans,
      selectedFeatures:selectedFeatures  ?? this.selectedFeatures,
      selectedPlan:selectedPlan  ?? this.selectedPlan,
    );
  }

  @override
  String toString() {
    return 'GymDetailsState(state: $state, errorMessage: $errorMessage, gymDetails: $gymDetails, allGyms: $allGyms)';
  }

  
}

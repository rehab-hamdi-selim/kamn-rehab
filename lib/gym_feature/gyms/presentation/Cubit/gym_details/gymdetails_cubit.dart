import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/gym_feature/gyms/data/models/features_model.dart';
import 'package:kamn/gym_feature/gyms/data/repo/gym_details_repo.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_state.dart';

@injectable
class GymDetailsCubit extends Cubit<GymDetailsState> {
  final GymDetailsRepository repository;

  GymDetailsCubit({required this.repository})
      : super(GymDetailsState(
          state: GymDetailsStatus.initial,
          selectedFeatures: {},
        ));

  Future<void> fetchGymDetails(String gymId) async {
    emit(state.copyWith(state: GymDetailsStatus.loading));
    try {
      final gymDetails = await repository.getGymDetails(gymId);
      if (gymDetails != null) {
        emit(state.copyWith(
          state: GymDetailsStatus.success,
          gymDetails: gymDetails,
        ));
      } else {
        emit(state.copyWith(
          state: GymDetailsStatus.error,
          errorMessage: 'Gym not found',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        state: GymDetailsStatus.error,
        errorMessage: 'Failed to load gym details: $e',
      ));
    }
  }

  Future<void> fetchAllGyms() async {
    emit(state.copyWith(state: GymDetailsStatus.loading));
    try {
      final allGyms = await repository.getAllGyms();

      emit(state.copyWith(
        state: GymDetailsStatus.success,
        allGyms: allGyms,
      ));
    } catch (e) {
      emit(state.copyWith(
        state: GymDetailsStatus.error,
        errorMessage: 'Failed to load all gyms: $e',
      ));
    }
  }

  Future<void> getGymFeatures(String gymId) async {
    emit(state.copyWith(state: GymDetailsStatus.featuresLoading));

    final features = await repository.getGymFeatures(gymId);
    features.fold((l) {
      emit(state.copyWith(
        state: GymDetailsStatus.featuresError,
        errorMessage: l.toString(),
      ));
    }, (r) {
      emit(state.copyWith(
        state: GymDetailsStatus.featuresSuccess,
        gymFeatures: r,
      ));
    });
  }

  void toggleFeature(FeatureModel feature) {
    
    final updatedSelectedFeatures =
        Map<FeatureModel, int>.from(state.selectedFeatures ?? {});

    if (updatedSelectedFeatures.containsKey(feature)) {
      updatedSelectedFeatures.remove(feature);
    } else {
      updatedSelectedFeatures[feature] = 1;
    }

    emit(state.copyWith(selectedFeatures: updatedSelectedFeatures));
  }

  void increaseQuantity(FeatureModel feature) {
    
    final updatedSelectedFeatures =
        Map<FeatureModel, int>.from(state.selectedFeatures ?? {});

    if (updatedSelectedFeatures.containsKey(feature)) {
      updatedSelectedFeatures[feature] = updatedSelectedFeatures[feature]! + 1;
    }

    emit(state.copyWith(selectedFeatures: updatedSelectedFeatures));
  }

  void decreaseQuantity(FeatureModel feature) {
    
    final updatedSelectedFeatures =
        Map<FeatureModel, int>.from(state.selectedFeatures ?? {});

    if (updatedSelectedFeatures.containsKey(feature) &&
        updatedSelectedFeatures[feature]! > 1) {
      updatedSelectedFeatures[feature] = updatedSelectedFeatures[feature]! - 1;
    } else {
      updatedSelectedFeatures.remove(feature);
    }

    emit(state.copyWith(selectedFeatures: updatedSelectedFeatures));
  }

  void removeFeature(FeatureModel feature) {
    
    final updatedSelectedFeatures =
        Map<FeatureModel, int>.from(state.selectedFeatures ?? {});
    updatedSelectedFeatures.remove(feature);

    emit(state.copyWith(selectedFeatures: updatedSelectedFeatures));
  }

  int get totalPrice {
    final selectedFeatures = state.selectedFeatures ?? {};
    return selectedFeatures.entries.fold(0, (sum, entry) {
      
      int price = 0;
      try {
        
        String priceStr =
            entry.key.price.trim().replaceAll(RegExp(r'[^\d]'), '');
        price = int.tryParse(priceStr) ?? 0;
      } catch (e) {
        
        price = 0;
      }
      return sum + (price * entry.value);
    });
  }

  void reset() {
    emit(state.copyWith(
      state: GymDetailsStatus.initial,
      errorMessage: null,
      gymDetails: null,
    ));
  }
}

import 'dart:io';

import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';

enum AddServiceProviderStatus {
  initial,
  loading,
  success,
  failure,
  serviceFailed,
  imagePicked,
  imageDeleted,
  imageUploaded,
  locationLoading,
  locationDetected,
  availabilityChanged,
}

extension AddServiceProviderStateExtension on AddServiceProviderState {
  bool get isInitial => state == AddServiceProviderStatus.initial;
  bool get isLoading => state == AddServiceProviderStatus.loading;
  bool get isSuccess => state == AddServiceProviderStatus.success;
  bool get isFailure => state == AddServiceProviderStatus.failure;
  bool get isImagePicked => state == AddServiceProviderStatus.imagePicked;
  bool get isimageDeleted => state == AddServiceProviderStatus.imageDeleted;
  bool get isImageUploaded => state == AddServiceProviderStatus.imageUploaded;
  bool get isServiceFailed => state == AddServiceProviderStatus.serviceFailed;
  bool get isLocationDetected =>
      state == AddServiceProviderStatus.locationDetected;
  bool get isLocationLoading =>
      state == AddServiceProviderStatus.locationLoading;
  bool get isAvailabilityChanged =>
      state == AddServiceProviderStatus.availabilityChanged;
}

class AddServiceProviderState {
  final AddServiceProviderStatus state;
  final List<PlaygroundRequestModel>? playgrounds;
  final String? erorrMessage;
  final String? successMessage;
  final List<File>? groundImagesList;
  final List<File>? ownershipImagesList;

  AddServiceProviderState(
      {required this.state,
      this.playgrounds,
      this.erorrMessage,
      this.successMessage,
      this.groundImagesList = const [],
      this.ownershipImagesList = const []});
  AddServiceProviderState copyWith(
      {AddServiceProviderStatus? state,
      List<PlaygroundRequestModel>? playgrounds,
      String? erorrMessage,
      String? successMessage,
      List<File>? groundImagesList,
      List<File>? ownershipImagesList}) {
    return AddServiceProviderState(
        state: state ?? this.state,
        playgrounds: playgrounds ?? this.playgrounds,
        erorrMessage: erorrMessage ?? this.erorrMessage,
        successMessage: successMessage ?? this.successMessage,
        groundImagesList: groundImagesList ?? this.groundImagesList,
        ownershipImagesList: ownershipImagesList ?? this.ownershipImagesList);
  }
}

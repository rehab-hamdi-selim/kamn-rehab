// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:kamn/playground_feature/sports_service_providers/data/model/playground_request_model.dart';

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
  final PlaygroundRequestModel? playground;
  final String? erorrMessage;
  final String? successMessage;
  final List<File>? groundImagesList;
  final List<File>? ownershipImagesList;

  AddServiceProviderState(
      {required this.state,
      this.playground,
      this.erorrMessage,
      this.successMessage,
      this.groundImagesList = const [],
      this.ownershipImagesList = const []});
  AddServiceProviderState copyWith(
      {AddServiceProviderStatus? state,
      PlaygroundRequestModel? playground,
      String? erorrMessage,
      String? successMessage,
      List<File>? groundImagesList,
      List<File>? ownershipImagesList}) {
    return AddServiceProviderState(
        state: state ?? this.state,
        playground: playground ?? this.playground,
        erorrMessage: erorrMessage ?? this.erorrMessage,
        successMessage: successMessage ?? this.successMessage,
        groundImagesList: groundImagesList ?? this.groundImagesList,
        ownershipImagesList: ownershipImagesList ?? this.ownershipImagesList);
  }

  @override
  String toString() {
    return 'AddServiceProviderState(state: $state, playground: $playground, erorrMessage: $erorrMessage, successMessage: $successMessage, groundImagesList: $groundImagesList, ownershipImagesList: $ownershipImagesList)';
  }
}

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
  locationDetected
}

extension SportsGroundStateExtension on AddServiceProviderState {
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
}

class AddServiceProviderState {
  final AddServiceProviderStatus state;
  final List<PlaygroundRequestModel>? playgrounds;
  final String? erorrMessage;
  final String? successMessage;
  final List<File>? imagesList;

  AddServiceProviderState(
      {required this.state,
      this.playgrounds,
      this.erorrMessage,
      this.successMessage,
      this.imagesList = const []});
}

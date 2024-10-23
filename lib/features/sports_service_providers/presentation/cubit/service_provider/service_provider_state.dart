import 'package:kamn/features/sports_service_providers/data/model/playground_model.dart';

enum ServiceProviderStatus {
  initial,
  loading,
  locationLoading,
  success,
  failure,
  permissionNeeded,
  serviceDisabled,
  imagePicked,
  imageDeleted,
  imageUploaded,
  locationDetected
}

extension SportsGroundStateExtension on ServiceProviderState {
  bool get isInitial => state == ServiceProviderStatus.initial;
  bool get isLoading => state == ServiceProviderStatus.loading;
  bool get isSuccess => state == ServiceProviderStatus.success;
  bool get isFailure => state == ServiceProviderStatus.failure;
  bool get isPermissionNeeded =>
      state == ServiceProviderStatus.permissionNeeded;
  bool get isServiceDisabled => state == ServiceProviderStatus.serviceDisabled;
  bool get isImagePicked => state == ServiceProviderStatus.imagePicked;
  bool get isimageDeleted => state == ServiceProviderStatus.imageDeleted;
  bool get isImageUploaded => state == ServiceProviderStatus.imageUploaded;
  bool get isLocationDetected =>
      state == ServiceProviderStatus.locationDetected;
  bool get isLocationLoading => state == ServiceProviderStatus.locationLoading;
}

class ServiceProviderState {
  final ServiceProviderStatus state;
  final List<PlaygroundModel>? playgrounds;
  final String? erorrMessage;
  final String? successMessage;

  ServiceProviderState(
      {required this.state,
      this.playgrounds,
      this.erorrMessage,
      this.successMessage});
}

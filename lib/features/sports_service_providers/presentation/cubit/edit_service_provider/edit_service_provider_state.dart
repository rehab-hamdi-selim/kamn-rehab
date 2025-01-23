// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';

enum EditServiceProviderStatus {
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

extension EditServiceProviderStateExtension on EditServiceProviderState {
  bool get isInitial => state == EditServiceProviderStatus.initial;
  bool get isLoading => state == EditServiceProviderStatus.loading;
  bool get isSuccess => state == EditServiceProviderStatus.success;
  bool get isFailure => state == EditServiceProviderStatus.failure;
  bool get isImagePicked => state == EditServiceProviderStatus.imagePicked;
  bool get isimageDeleted => state == EditServiceProviderStatus.imageDeleted;
  bool get isImageUploaded => state == EditServiceProviderStatus.imageUploaded;
  bool get isServiceFailed => state == EditServiceProviderStatus.serviceFailed;
  bool get isLocationDetected =>
      state == EditServiceProviderStatus.locationDetected;
  bool get isLocationLoading =>
      state == EditServiceProviderStatus.locationLoading;
  bool get isAvailabilityChanged =>
      state == EditServiceProviderStatus.availabilityChanged;
}

class EditServiceProviderState {
  final EditServiceProviderStatus state;
  final List<PlaygroundRequestModel>? playgrounds;
  final String? erorrMessage;
  final String? successMessage;
  List<dynamic>? groundImagesList;

  EditServiceProviderState(
      {required this.state,
      this.playgrounds,
      this.erorrMessage,
      this.successMessage,
      this.groundImagesList = const []});
  EditServiceProviderState copyWith({
    EditServiceProviderStatus? state,
    List<PlaygroundRequestModel>? playgrounds,
    String? erorrMessage,
    String? successMessage,
    List<dynamic>? groundImagesList,
  }) {
    return EditServiceProviderState(
      state: state ?? this.state,
      playgrounds: playgrounds ?? this.playgrounds,
      erorrMessage: erorrMessage ?? this.erorrMessage,
      successMessage: successMessage ?? this.successMessage,
      groundImagesList: groundImagesList ?? this.groundImagesList,
    );
  }

  @override
  String toString() {
    return 'EditServiceProviderState(state: $state, playgrounds: $playgrounds, erorrMessage: $erorrMessage, successMessage: $successMessage, groundImagesList: $groundImagesList)';
  }
}

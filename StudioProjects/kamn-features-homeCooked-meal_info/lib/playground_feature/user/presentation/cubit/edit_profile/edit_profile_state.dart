// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

enum EditProfileStatus {
  initial,
  editing,
  success,
  failure,
  imagePicked,
  imageUploaded,
}

class EditProfileState {
  final EditProfileStatus status;
  final String? profilePictureUrl;
  final File? picturePicked;
  final String? errorMessage;
  final Set<String> changedAttributes;

  EditProfileState({
    required this.status,
    this.profilePictureUrl,
    this.picturePicked,
    this.errorMessage,
    this.changedAttributes = const {},
  });

  EditProfileState copyWith({
    EditProfileStatus? status,
    String? profilePictureUrl,
    File? picturePicked,
    String? errorMessage,
    Set<String>? changedAttributes,
  }) {
    return EditProfileState(
      status: status ?? this.status,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      picturePicked: picturePicked ?? this.picturePicked,
      errorMessage: errorMessage ?? this.errorMessage,
      changedAttributes: changedAttributes ?? this.changedAttributes,
    );
  }

  @override
  String toString() {
    return 'EditProfileState(status: $status, profilePictureUrl: $profilePictureUrl, picturePicked: $picturePicked, errorMessage: $errorMessage, changedAttributes: $changedAttributes)';
  }
}

extension EditProfileStateExtension on EditProfileState {
  bool get isInitial => status == EditProfileStatus.initial;
  bool get isEditing => status == EditProfileStatus.editing;
  bool get isSuccess => status == EditProfileStatus.success;
  bool get isFailure => status == EditProfileStatus.failure;
  bool get isImagePicked=>status==EditProfileStatus.imagePicked;
  bool get isImageUploaded=>status==EditProfileStatus.imageUploaded;
}



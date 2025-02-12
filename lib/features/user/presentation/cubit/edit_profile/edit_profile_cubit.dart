import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/entities/user_model.dart';
import 'package:kamn/core/utils/image_picker.dart';
import 'package:kamn/features/user/data/repository/user_repository.dart';
import 'package:kamn/features/user/presentation/cubit/edit_profile/edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final UserRepository repository;
  EditProfileCubit({required this.repository})
      : super(EditProfileState(status: EditProfileStatus.initial)) {
    // Add listeners to the text controllers
    emailController.addListener(_onTextChanged);
    phoneController.addListener(_onTextChanged);
    cityController.addListener(_onTextChanged);
    nameController.addListener(_onTextChanged);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> changeProfilePicture() async {
    final result = await pickImage();
    if (result != null) {
      final updatedAttributes = {...state.changedAttributes, 'profilePicture'};
      emit(state.copyWith(
        status: EditProfileStatus.imagePicked,
        picturePicked: result,
        changedAttributes: updatedAttributes,
      ));
      checkAction();
    }
  }

  Future<void> uploadImage(File image) async {
    emit(state.copyWith(status: EditProfileStatus.editing));
    final result = await repository.addImagesToStorage(image);
    result.fold(
        (l) => emit(state.copyWith(
              status: EditProfileStatus.failure,
              errorMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(
              status: EditProfileStatus.imageUploaded,
              profilePictureUrl: r,
            )));
  }

  Future<void> submit(UserModel user) async {
    emit(state.copyWith(status: EditProfileStatus.editing));

    // Create a copy of the user with updated attributes
    final updatedUser = user.copyWith(
      email: state.changedAttributes.contains('email')
          ? emailController.text
          : user.email,
      phoneNumber: state.changedAttributes.contains('phone')
          ? phoneController.text
          : user.phoneNumber,
      city: state.changedAttributes.contains('city')
          ? cityController.text
          : user.city,
      name: state.changedAttributes.contains('name')
          ? nameController.text
          : user.name,
      profileImage: state.changedAttributes.contains('profilePicture')
          ? state.profilePictureUrl
          : user.profileImage,
    );

    // Call the repository to update the user info
    final result = await repository.updateUserInfo(updatedUser);
    result.fold((l) {
      emit(state.copyWith(
        status: EditProfileStatus.failure,
        errorMessage: l.erorr,
      ));
    }, (r) {
      emit(state.copyWith(
        status: EditProfileStatus.success,
        changedAttributes: {}, // Reset changed attributes on success
      ));
    });
  }

  void checkAction() {
    final updatedAttributes = <String>{};

    if (cityController.text.isNotEmpty) updatedAttributes.add('city');
    if (phoneController.text.isNotEmpty) updatedAttributes.add('phone');
    if (nameController.text.isNotEmpty) updatedAttributes.add('name');
    if (emailController.text.isNotEmpty) updatedAttributes.add('email');
    if (state.picturePicked != null) updatedAttributes.add('profilePicture');

    emit(state.copyWith(
      changedAttributes: updatedAttributes,
    ));
  }

  void _onTextChanged() {
    checkAction();
  }

  @override
  Future<void> close() {
    // Dispose of controllers when the Cubit is closed
    emailController.dispose();
    phoneController.dispose();
    cityController.dispose();
    nameController.dispose();
    return super.close();
  }
}

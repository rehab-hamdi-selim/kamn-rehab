import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:kamn/core/utils/image_picker.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_state.dart';

import '../../../../../core/utils/location.dart';

@injectable
class AddServiceProviderCubit extends Cubit<AddServiceProviderState> {
  AddServiceProviderCubit({required this.repository})
      : super(AddServiceProviderState(state: AddServiceProviderStatus.initial));

  ServiceProvidersRepository repository;
  List<File> groundSelectedImageList = [];
  List<File> ownershipSelectedImageList = [];

  List<String> ownershipImagesUrl = [];
  List<String> groundImagesUrl = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController governateController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? statusOption;
  void onChangeStatusSelection(String newOption) {
    if (statusOption == newOption) {
      return;
    }
    statusOption = newOption;
    emit(state.copyWith(state: AddServiceProviderStatus.availabilityChanged));
  }

  Future<void> addService(PlaygroundRequestModel playground) async {
    emit(state.copyWith(state: AddServiceProviderStatus.loading));
    var response = await repository.addServiceToFirestore(playground);
    response.fold((error) {
      emit(state.copyWith(
          state: AddServiceProviderStatus.serviceFailed,
          erorrMessage: error.erorr));
    }, (success) {
      emit(state.copyWith(
          state: AddServiceProviderStatus.success,
          successMessage: 'service added successfully'));
    });
  }

  Future<void> getPhotoFromGallery(bool isGroundImage) async {
    var image = await pickImage();
    if (image != null) {
      if (isGroundImage) {
        groundSelectedImageList.add(image);
        emit(state.copyWith(
            state: AddServiceProviderStatus.imagePicked,
            groundImagesList: groundSelectedImageList,
            successMessage: 'image loaded sucessfully'));
      } else {
        ownershipSelectedImageList.add(image);
        emit(state.copyWith(
            state: AddServiceProviderStatus.imagePicked,
            ownershipImagesList: ownershipSelectedImageList,
            successMessage: 'image loaded sucessfully'));
      }
    } else {
      emit(state.copyWith(
          state: AddServiceProviderStatus.failure,
          erorrMessage: 'cancel image pick'));
    }
  }

  void removeImageFromList(File image, bool isGroundImage) {
    if (isGroundImage) {
      groundSelectedImageList.remove(image);
      emit(state.copyWith(
          state: AddServiceProviderStatus.imageDeleted,
          groundImagesList: groundSelectedImageList));
    } else {
      ownershipSelectedImageList.remove(image);
      emit(state.copyWith(
          state: AddServiceProviderStatus.imageDeleted,
          ownershipImagesList: ownershipSelectedImageList));
    }
  }

  Future<void> addImagesToStorage() async {
    emit(state.copyWith(state: AddServiceProviderStatus.loading));
    var groundResponse =
        await repository.addImagesToStorage(groundSelectedImageList);

    groundResponse.fold((error) {
      emit(state.copyWith(
          state: AddServiceProviderStatus.failure,
          erorrMessage: 'faild to upload images to firebase storage'));
    }, (success) async {
      groundImagesUrl = success;
      var ownershipResponse =
          await repository.addImagesToStorage(ownershipSelectedImageList);
      ownershipResponse.fold((error) {
        emit(state.copyWith(
            state: AddServiceProviderStatus.failure,
            erorrMessage: 'faild to upload images to firebase storage'));
      }, (success2) {
        ownershipImagesUrl = success2;
        emit(state.copyWith(
            state: AddServiceProviderStatus.imageUploaded,
            successMessage: 'images added successfully to firebase storage'));
      });
    });
  }

  Future<void> deleteImagesFromStorage() async {
    emit(state.copyWith(state: AddServiceProviderStatus.loading));
    var response = await repository.deleteImagesFromStorage(groundImagesUrl);

    response.fold((error) {
      emit(state.copyWith(
          state: AddServiceProviderStatus.failure,
          erorrMessage: 'faild to upload images to firebase storage'));
    }, (success) {
      emit(state.copyWith(
          state: AddServiceProviderStatus.imageDeleted,
          successMessage: 'images deleted successfully from firebase storage'));
    });
  }

  Map<String, double> coordinates = {};
  Future<void> getLocation() async {
    emit(state.copyWith(state: AddServiceProviderStatus.locationLoading));
    var response = await getLocationCoordinates();
    response.fold((error) {
      emit(state.copyWith(
          state: AddServiceProviderStatus.failure, erorrMessage: error.erorr));
    }, (success) {
      coordinates = success;
      emit(state.copyWith(state: AddServiceProviderStatus.locationDetected));
    });
  }

  void disposeControllers() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    sizeController.dispose();
    governateController.dispose();
    priceController.dispose();
  }

  @override
  Future<void> close() {
    disposeControllers();
    return super.close();
  }
}

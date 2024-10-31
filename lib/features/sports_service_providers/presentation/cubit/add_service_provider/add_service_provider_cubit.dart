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
  List<File> selectedImageList = [];
  List<String> imagesUrl = [];
//TODO: add validation to the inputs /* done
//TODO: dispose controllers before navigte to another screen /* done
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController governateController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addService(PlaygroundRequestModel playground) async {
    emit(AddServiceProviderState(state: AddServiceProviderStatus.loading));
    //TODO:don`t fire function into another function you must fire first function and then depend on it`s state fire the second function /* done
    var response = await repository.addServiceToFirestore(playground);
    response.fold((error) {
      emit(AddServiceProviderState(
          state: AddServiceProviderStatus.serviceFailed,
          erorrMessage: error.erorr));
    }, (success) {
      emit(AddServiceProviderState(
          state: AddServiceProviderStatus.success,
          successMessage: 'service added successfully'));
    });
  }

  Future<void> getPhotoFromGallery() async {
    var image = await pickImage();
    if (image != null) {
      selectedImageList.add(image);
      emit(AddServiceProviderState(
          state: AddServiceProviderStatus.imagePicked,
          imagesList: selectedImageList,
          successMessage: 'image loaded sucessfully'));
    } else {
      emit(AddServiceProviderState(
          state: AddServiceProviderStatus.failure,
          erorrMessage: 'cancel image pick'));
    }
  }

  void removeImageFromList(File image) {
    selectedImageList.remove(image);
    emit(AddServiceProviderState(
        state: AddServiceProviderStatus.imageDeleted,
        imagesList: selectedImageList));
  }

  Future<void> addImagesToStorage() async {
    emit(AddServiceProviderState(state: AddServiceProviderStatus.loading));
    var response = await repository.addFImagesToStorage(selectedImageList);

    response.fold((error) {
      emit(AddServiceProviderState(
          state: AddServiceProviderStatus.failure,
          erorrMessage: 'faild to upload images to firebase storage'));
    }, (success) {
      imagesUrl = success;
      emit(AddServiceProviderState(
          state: AddServiceProviderStatus.imageUploaded,
          successMessage: 'images added successfully to firebase storage'));
    });
  }

  Future<void> deleteImagesFromStorage() async {
    emit(AddServiceProviderState(state: AddServiceProviderStatus.loading));
    var response = await repository.deleteImagesFromStorage(selectedImageList);

    response.fold((error) {
      emit(AddServiceProviderState(
          state: AddServiceProviderStatus.failure,
          erorrMessage: 'faild to upload images to firebase storage'));
    }, (success) {
      emit(AddServiceProviderState(
          state: AddServiceProviderStatus.imageDeleted,
          successMessage: 'images deleted successfully from firebase storage'));
    });
  }

  Map<String, double> coordinates = {};
  Future<void> getLocation() async {
    emit(AddServiceProviderState(
        state: AddServiceProviderStatus.locationLoading));
    var response = await getLocationCoordinates();
    response.fold((error) {
      emit(AddServiceProviderState(
          state: AddServiceProviderStatus.failure, erorrMessage: error.erorr));
    }, (success) {
      coordinates = success;
      emit(AddServiceProviderState(
          state: AddServiceProviderStatus.locationDetected));
    });
  }

  void disposeControllers() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    sizeController.dispose();
    governateController.dispose();
  }

  @override
  Future<void> close() {
    disposeControllers();
    return super.close();
  }
}

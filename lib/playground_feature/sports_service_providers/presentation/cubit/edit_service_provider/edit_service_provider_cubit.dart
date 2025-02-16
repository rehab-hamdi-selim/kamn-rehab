import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:kamn/core/utils/image_picker.dart';
import 'package:kamn/playground_feature/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/playground_feature/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_state.dart';

import '../../../../../core/utils/location.dart';

@injectable
class EditServiceProviderCubit extends Cubit<EditServiceProviderState> {
  EditServiceProviderCubit({required this.repository})
      : super(
            EditServiceProviderState(state: EditServiceProviderStatus.initial));

  ServiceProvidersRepository repository;
  List<File> groundNewSelectedImageList = [];
  List<String> groundImagesUrl = [];
  List<String> groundRemovedImagesUrl = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController= TextEditingController();
  TextEditingController governateController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? statusOption;
  void onChangeStatusSelection(String newOption) {
    if (statusOption == newOption) {
      return;
    }
    statusOption = newOption;
    emit(state.copyWith(state: EditServiceProviderStatus.availabilityChanged));
  }

  Future<void> updateService(
      PlaygroundRequestModel playground, Map<String, dynamic> data) async {
    emit(state.copyWith(state: EditServiceProviderStatus.loading));
    var response = await repository.updateState(playground, data);
    response.fold((error) {
      emit(state.copyWith(
          state: EditServiceProviderStatus.serviceFailed,
          erorrMessage: error.erorr));
    }, (success) {
      emit(state.copyWith(
          state: EditServiceProviderStatus.success,
          successMessage: 'service updated successfully'));
    });
  }

  Future<void> getPhotoFromGallery() async {
    var image = await pickImage();
    if (image != null) {
      final modifiableList = List<dynamic>.from(state.groundImagesList ?? []);
      modifiableList.add(image);
      groundNewSelectedImageList.add(image);
      emit(state.copyWith(
          state: EditServiceProviderStatus.imagePicked,
          groundImagesList: modifiableList,
          successMessage: 'image loaded sucessfully'));
    } else {
      emit(state.copyWith(
          state: EditServiceProviderStatus.failure,
          erorrMessage: 'cancel image pick'));
    }
  }

  void removeImageFromList(dynamic image) {
    final modifiableList = List<dynamic>.from(state.groundImagesList ?? []);

    if (image is String) {
      modifiableList.remove(image);
      groundRemovedImagesUrl.add(image);
      emit(state.copyWith(
          state: EditServiceProviderStatus.imageDeleted,
          groundImagesList: modifiableList));
    } else {
      modifiableList.remove(image);
      groundNewSelectedImageList.remove(image);

      emit(state.copyWith(
          state: EditServiceProviderStatus.imageDeleted,
          groundImagesList: modifiableList));
    }
  }

  Future<void> addImagesToStorage() async {
    emit(state.copyWith(state: EditServiceProviderStatus.loading));
    var groundResponse =
        await repository.addImagesToStorage(groundNewSelectedImageList);

    groundResponse.fold((error) {
      emit(state.copyWith(
          state: EditServiceProviderStatus.failure,
          erorrMessage: 'faild to upload images to firebase storage'));
    }, (success) {
      groundImagesUrl = success;
      emit(state.copyWith(
          state: EditServiceProviderStatus.imageUploaded,
          successMessage: 'images added successfully to firebase storage'));
    });
  }

  Future<void> deleteImagesFromStorage(List<String> removed) async {
    emit(state.copyWith(state: EditServiceProviderStatus.loading));
    var response = await repository.deleteImagesFromStorage(removed);

    response.fold((error) {
      emit(state.copyWith(
          state: EditServiceProviderStatus.failure,
          erorrMessage: 'faild to upload images to firebase storage'));
    }, (success) {
      emit(state.copyWith(
          state: EditServiceProviderStatus.imageDeleted,
          successMessage: 'images deleted successfully from firebase storage'));
    });
  }

  Map<String, double> coordinates = {};
  Future<void> getLocation() async {
    emit(state.copyWith(state: EditServiceProviderStatus.locationLoading));
    var response = await getLocationCoordinates();
    response.fold((error) {
      emit(state.copyWith(
          state: EditServiceProviderStatus.failure, erorrMessage: error.erorr));
    }, (success) {
      coordinates = success;
      emit(state.copyWith(state: EditServiceProviderStatus.locationDetected));
    });
  }

  void disposeControllers() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    sizeController.dispose();
    governateController.dispose();
    priceController.dispose();
    descriptionController.dispose();
  }

  @override
  Future<void> close() {
    disposeControllers();
    return super.close();
  }

  void initValue(PlaygroundRequestModel playground) {
    nameController.text = playground.playgroundName ?? '';
    phoneController.text = playground.phone ?? '';
    addressController.text = playground.address ?? '';
    sizeController.text = playground.size.toString();
    priceController.text = playground.price!.toStringAsFixed(0);
    governateController.text = playground.govenrate ?? '';
    statusOption = playground.status;
    descriptionController.text=playground.description??'';
  }
}

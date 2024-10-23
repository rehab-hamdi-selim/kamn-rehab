import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_model.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider/service_provider_state.dart';
import 'package:location/location.dart';

import '../../../../../core/utils/location_premission.dart';

class ServiceProviderCubit extends Cubit<ServiceProviderState> {
  ServiceProviderCubit({required this.repository})
      : super(ServiceProviderState(state: ServiceProviderStatus.initial));

  ServiceProvidersRepository repository;
  List<File> selectedImageList = [];
  List<String> imagesUrl = [];
//TODO: add validation to the inputs
//TODO: dispose controllers before navigte to another screen
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController governateController = TextEditingController();

  Future<void> addService() async {
    emit(ServiceProviderState(state: ServiceProviderStatus.loading));
    //TODO:don`t fire function into another function you must fire first function and then depend on it`s state fire the second function
    await addImagesToStorage();

    var response = await repository.addServiceToFirestore(PlaygroundModel(
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      address: addressController.text.trim(),
      size: sizeController.text.isNotEmpty
          ? int.parse(sizeController.text.trim())
          : 0,
      govenrate: governateController.text,
      images: imagesUrl,
      latitude: latitude,
      longitude: longitude,
      ownerId: "under develop",
      price: 0000,
      description: "under develop",
      status: "under develop",
    ));
    response.fold((error) {
      emit(ServiceProviderState(
          state: ServiceProviderStatus.failure, erorrMessage: error.erorr));
    }, (success) {
      emit(ServiceProviderState(
          state: ServiceProviderStatus.success,
          successMessage: 'service added successfully'));
    });
  }

  //TODO: add getPhotoFromGallery to the core and make a new file name it image_picker_helper.dart
  //that function must return image.path and then add it to the selectedImageList
  Future<void> getPhotoFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImageList.add(File(image.path));
      emit(ServiceProviderState(
          state: ServiceProviderStatus.imagePicked,
          successMessage: 'image loaded sucessfully'));
    } else {
      emit(ServiceProviderState(
          state: ServiceProviderStatus.failure,
          erorrMessage: 'cancel image pick'));
    }
  }

  Future<void> compressImage() async {
    for (var image in selectedImageList) {
      image = await image.writeAsBytes(
          (await FlutterImageCompress.compressWithFile(image.path,
              quality: 70))!);
    }
  }

  void removeImageFromList(File image) {
    selectedImageList.remove(image);
    emit(ServiceProviderState(state: ServiceProviderStatus.imageDeleted));
  }

  Future<void> addImagesToStorage() async {
    await compressImage();
    var response = await repository.addFImagesToStorage(selectedImageList);

    response.fold((error) {
      emit(ServiceProviderState(
          state: ServiceProviderStatus.failure,
          erorrMessage: 'faild to upload images to firebase storage'));
    }, (success) {
      imagesUrl = success;

      emit(ServiceProviderState(
          state: ServiceProviderStatus.imageUploaded,
          successMessage: 'images added successfully to firebase storage'));
    });
  }

  //TODO: add location to the core
  LocationData? locationData;
  double? longitude;
  double? latitude;
  Future<void> getLocation() async {
    emit(ServiceProviderState(state: ServiceProviderStatus.locationLoading));
    if (!await isPermissionGranted()) {
      emit(ServiceProviderState(
        state: ServiceProviderStatus.permissionNeeded,
        erorrMessage: "Location permission denied. Please grant permission.",
      ));
    }
    if (!await isServiceEnabled()) {
      emit(ServiceProviderState(
        state: ServiceProviderStatus.serviceDisabled,
        erorrMessage: "Location services are disabled. Please enable them.",
      ));
    }
    location.changeSettings(accuracy: LocationAccuracy.high);

    locationData = await location.getLocation();
    longitude = locationData?.longitude;
    latitude = locationData?.altitude;
    print(longitude);
    print(latitude);
    emit(ServiceProviderState(
        state: ServiceProviderStatus.locationDetected,
        successMessage: 'location detected successfuly'));
  }
}

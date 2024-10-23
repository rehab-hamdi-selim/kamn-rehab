import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_model.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider/service_provider_state.dart';
import 'package:location/location.dart';

class ServiceProviderCubit extends Cubit<ServiceProviderState> {
  ServiceProviderCubit({required this.repository})
      : super(ServiceProviderState(state: ServiceProviderStatus.initial));

  ServiceProvidersRepository repository;

  List<File> selectedImageList = [];
  List<String> imagesUrl = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController governateController = TextEditingController();

  /// function to add playground object to firestore
  Future<void> addService() async {
    emit(ServiceProviderState(state: ServiceProviderStatus.loading));
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

  PermissionStatus? permissionGranted;
  Location location = Location();
  LocationData? locationData;
  double? longitude;
  double? latitude;

  Future<bool> isPermissionGranted() async {
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  Future<bool> isServiceEnabled() async {
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }
    return true;
  }

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

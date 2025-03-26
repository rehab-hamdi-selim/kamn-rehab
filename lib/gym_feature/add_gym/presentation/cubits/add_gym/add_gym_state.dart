// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kamn/gym_feature/add_gym/data/models/gym_request_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

enum AddGymStatus {
  initial,
  loading,
  success,
  error,
  swipped,
  logoPicked,
  logoLoading,
  gymImageLoading,
  gymImagePicked,
  mandatoryFieldPicked,
  radioSelected,
  featureAdded,
  addGymLoading,
  addGymSuccess,
  addGymError,
  uploadImagesSuccess,
  uploadImagesError,
  uploadImagesLoading,
  checkBarTapped,
}

extension FeatureTypeColors on FeatureType {
  Color getBackgroundColor(FeatureType? groupValue) {
    Map<FeatureType, Color> activeColors = {
      FeatureType.free: Colors.black,
      FeatureType.session: Colors.green,
      FeatureType.month: Colors.blue,
    };
    return this == groupValue ? activeColors[this]! : Colors.white;
  }

  Color getTextColor(FeatureType? groupValue) {
    return this == groupValue ? Colors.white : Colors.black;
  }
}

extension AddGymStateX on AddGymState {
  bool get isInitial => state == AddGymStatus.initial;
  bool get isLoading => state == AddGymStatus.loading;
  bool get isSuccess => state == AddGymStatus.success;
  bool get isError => state == AddGymStatus.error;
  bool get isSwipped => state == AddGymStatus.swipped;
  bool get isLogoPicked => state == AddGymStatus.logoPicked;
  bool get isLogoLoading => state == AddGymStatus.logoLoading;
  bool get isGymImageLoading => state == AddGymStatus.gymImageLoading;
  bool get isGymImagePicked => state == AddGymStatus.gymImagePicked;
  bool get isMandatoryFieldPicked => state == AddGymStatus.mandatoryFieldPicked;
  bool get isRadioSelected => state == AddGymStatus.radioSelected;
  bool get isFeatureAdded => state == AddGymStatus.featureAdded;
  bool get isAddGymLoading => state == AddGymStatus.addGymLoading;
  bool get isAddGymSuccess => state == AddGymStatus.addGymSuccess;
  bool get isAddGymError => state == AddGymStatus.addGymError;
  bool get isUploadImagesSuccess => state == AddGymStatus.uploadImagesSuccess;
  bool get isUploadImagesError => state == AddGymStatus.uploadImagesError;
  bool get isUploadImagesLoading => state == AddGymStatus.uploadImagesLoading;
  bool get isCheckBarTapped => state == AddGymStatus.checkBarTapped;
}

class AddGymState {
  final AddGymStatus state;
  final String? erorrMessage;
  final File? logo;
  final MandatoryFields? mandatoryFields;
  final List<File>? gymImages;
  List<bool> isValid;
  final FeatureType? featureType;
  final List<Feature>? addedFeatures;
  final Map<String, List<String>>? imagesUrlMap;
  final GymRequestModel? gymRequest;
  final double? uploadProgress;
  final bool? isGymInfoValid;
  final bool? isAccept;
  final bool? isConfirm;
  final int? numberOfImages;

  AddGymState(
      {required this.state,
      this.erorrMessage,
      this.logo,
      this.mandatoryFields,
      this.gymImages,
      this.featureType,
      this.addedFeatures,
      this.imagesUrlMap,
      this.gymRequest,
      this.uploadProgress=0,
      this.isAccept=false,
      this.isConfirm=false,
      this.isGymInfoValid=false,
      this.numberOfImages,
      this.isValid = const [true, true, true]});

  bool get isValidAll => isValid.every((element) => element);
  
  AddGymState copyWith(
      {AddGymStatus? state,
      String? erorrMessage,
      File? logo,
      FeatureType? featureType,
      MandatoryFields? mandatoryFields,
      List<File>? gymImages,
      List<Feature>? addedFeatures,
      Map<String, List<String>>? imagesUrlMap,
      GymRequestModel? gymRequest,
      double? uploadProgress,
        bool? isAccept,
   bool? isConfirm,
      bool? isGymInfoValid,
       int? numberOfImages,
      List<bool>? isValid}) {
    return AddGymState(
        state: state ?? this.state,
        erorrMessage: erorrMessage ?? this.erorrMessage,
        logo: logo ?? this.logo,
        featureType: featureType ?? this.featureType,
        mandatoryFields: mandatoryFields ?? this.mandatoryFields,
        gymImages: gymImages ?? this.gymImages,
        addedFeatures: addedFeatures ?? this.addedFeatures,
        imagesUrlMap: imagesUrlMap ?? this.imagesUrlMap,
        gymRequest: gymRequest ?? this.gymRequest,
        isAccept: isAccept?? this.isAccept,
        isConfirm: isConfirm?? this.isConfirm,
        uploadProgress: uploadProgress ?? this.uploadProgress,
        isGymInfoValid: isGymInfoValid ?? this.isGymInfoValid,
        numberOfImages: numberOfImages?? this.numberOfImages,
        isValid: isValid ?? this.isValid);
  }

  @override
  String toString() {
    return 'AddGymState(state: $state, erorrMessage: $erorrMessage, logo: $logo, mandatoryFields: $mandatoryFields, gymImages: $gymImages, isValid: $isValid, featureType: $featureType)';
  }
}

extension MandatoryFieldsX on MandatoryFields {
  String get gymOperatingLicenseText => "Gym Operating License";
  String get idOrPassportOfOwnerText => "ID or Passport of Owner";
  String get ownershipContractText => "Ownership Contract";
  String get taxRegistrationText => "Tax Registration";

  bool get isGymOperatingLicensePicked => gymOperatingLicense != null;
  bool get isIdOrPassportOfOwnerPicked => idOrPassportOfOwner != null;
  bool get isOwnershipContractPicked => ownershipContract != null;
  File? getFieldByText(String text) {
    switch (text) {
      case "Gym Operating License":
        return gymOperatingLicense;
      case "ID or Passport of Owner":
        return idOrPassportOfOwner;
      case "Ownership Contract":
        return ownershipContract;
      case "Tax Registration":
        return taxRegistration;
      default:
        return null;
    }
  }
}

class MandatoryFields {
  final File? ownershipContract;
  final File? idOrPassportOfOwner;
  final File? gymOperatingLicense;
  final File? taxRegistration;
  MandatoryFields({
    this.ownershipContract,
    this.idOrPassportOfOwner,
    this.gymOperatingLicense,
    this.taxRegistration,
  });

  MandatoryFields copyWith({
    File? ownershipContract,
    File? idOrPassportOfOwner,
    File? gymOperatingLicense,
    File? taxRegistration,
  }) {
    return MandatoryFields(
      ownershipContract: ownershipContract ?? this.ownershipContract,
      idOrPassportOfOwner: idOrPassportOfOwner ?? this.idOrPassportOfOwner,
      gymOperatingLicense: gymOperatingLicense ?? this.gymOperatingLicense,
      taxRegistration: taxRegistration ?? this.taxRegistration,
    );
  }

  @override
  String toString() {
    return 'MandatoryFields(ownershipContract: $ownershipContract, idOrPassportOfOwner: $idOrPassportOfOwner, gymOperatingLicense: $gymOperatingLicense, taxRegistration: $taxRegistration)';
  }

  @override
  bool operator ==(covariant MandatoryFields other) {
    if (identical(this, other)) return true;

    return other.ownershipContract == ownershipContract &&
        other.idOrPassportOfOwner == idOrPassportOfOwner &&
        other.gymOperatingLicense == gymOperatingLicense &&
        other.taxRegistration == taxRegistration;
  }

  @override
  int get hashCode {
    return ownershipContract.hashCode ^
        idOrPassportOfOwner.hashCode ^
        gymOperatingLicense.hashCode ^
        taxRegistration.hashCode;
  }
}

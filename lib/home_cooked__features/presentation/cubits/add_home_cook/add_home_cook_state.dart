// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';
import 'package:kamn/home_cooked__features/data/models/home_cook_model_test.dart';

enum AddHomeCookStatus {
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

// extension FeatureTypeColors on FeatureType {
//   Color getBackgroundColor(FeatureType? groupValue) {
//     Map<FeatureType, Color> activeColors = {
//       FeatureType.free: Colors.black,
//       FeatureType.session: Colors.green,
//       FeatureType.month: Colors.blue,
//     };
//     return this == groupValue ? activeColors[this]! : Colors.white;
//   }
//
//   Color getTextColor(FeatureType? groupValue) {
//     return this == groupValue ? Colors.white : Colors.black;
//   }
// }

extension AddGymStateX on AddHomeCookState {
  bool get isInitial => state == AddHomeCookStatus.initial;

  bool get isLoading => state == AddHomeCookStatus.loading;

  bool get isSuccess => state == AddHomeCookStatus.success;

  bool get isError => state == AddHomeCookStatus.error;

  bool get isSwipped => state == AddHomeCookStatus.swipped;

  bool get isLogoPicked => state == AddHomeCookStatus.logoPicked;

  bool get isLogoLoading => state == AddHomeCookStatus.logoLoading;

  bool get isGymImageLoading => state == AddHomeCookStatus.gymImageLoading;

  bool get isGymImagePicked => state == AddHomeCookStatus.gymImagePicked;

  bool get isMandatoryFieldPicked =>
      state == AddHomeCookStatus.mandatoryFieldPicked;

  bool get isRadioSelected => state == AddHomeCookStatus.radioSelected;

  bool get isFeatureAdded => state == AddHomeCookStatus.featureAdded;

  bool get isAddGymLoading => state == AddHomeCookStatus.addGymLoading;

  bool get isAddGymSuccess => state == AddHomeCookStatus.addGymSuccess;

  bool get isAddGymError => state == AddHomeCookStatus.addGymError;

  bool get isUploadImagesSuccess =>
      state == AddHomeCookStatus.uploadImagesSuccess;

  bool get isUploadImagesError => state == AddHomeCookStatus.uploadImagesError;

  bool get isUploadImagesLoading =>
      state == AddHomeCookStatus.uploadImagesLoading;

  bool get isCheckBarTapped => state == AddHomeCookStatus.checkBarTapped;
}

class AddHomeCookState {
  final AddHomeCookStatus state;
  final String? erorrMessage;
  final File? logo;
  final MandatoryFields? mandatoryFields;
  final List<File>? gymImages;
  List<bool> isValid;

  // final FeatureType? featureType;
  final List<Feature>? addedFeatures;
  final Map<String, List<String>>? imagesUrlMap;
  final HomeCookModel? gymRequest;
  final double? uploadProgress;
  final bool? isGymInfoValid;
  final bool? isAccept;
  final bool? isConfirm;
  final int? numberOfImages;

  AddHomeCookState(
      {required this.state,
      this.erorrMessage,
      this.logo,
      this.mandatoryFields,
      this.gymImages,
      //this.featureType,
      this.addedFeatures,
      this.imagesUrlMap,
      this.gymRequest,
      this.uploadProgress = 0,
      this.isAccept = false,
      this.isConfirm = false,
      this.isGymInfoValid = false,
      this.numberOfImages,
      this.isValid = const [true, true, true]});

  bool get isValidAll => isValid.every((element) => element);

  AddHomeCookState copyWith(
      {AddHomeCookStatus? state,
      String? erorrMessage,
      File? logo,
      // FeatureType? featureType,
      MandatoryFields? mandatoryFields,
      List<File>? gymImages,
      List<Feature>? addedFeatures,
      Map<String, List<String>>? imagesUrlMap,
      HomeCookModel? gymRequest,
      double? uploadProgress,
      bool? isAccept,
      bool? isConfirm,
      bool? isGymInfoValid,
      int? numberOfImages,
      List<bool>? isValid}) {
    return AddHomeCookState(
        state: state ?? this.state,
        erorrMessage: erorrMessage ?? this.erorrMessage,
        logo: logo ?? this.logo,
        //featureType: featureType ?? this.featureType,
        mandatoryFields: mandatoryFields ?? this.mandatoryFields,
        gymImages: gymImages ?? this.gymImages,
        addedFeatures: addedFeatures ?? this.addedFeatures,
        imagesUrlMap: imagesUrlMap ?? this.imagesUrlMap,
        gymRequest: gymRequest ?? this.gymRequest,
        isAccept: isAccept ?? this.isAccept,
        isConfirm: isConfirm ?? this.isConfirm,
        uploadProgress: uploadProgress ?? this.uploadProgress,
        isGymInfoValid: isGymInfoValid ?? this.isGymInfoValid,
        numberOfImages: numberOfImages ?? this.numberOfImages,
        isValid: isValid ?? this.isValid);
  }

  @override
  String toString() {
    return 'AddGymState(state: $state, erorrMessage: $erorrMessage, logo: $logo, mandatoryFields: $mandatoryFields, gymImages: $gymImages, isValid: $isValid, )';
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

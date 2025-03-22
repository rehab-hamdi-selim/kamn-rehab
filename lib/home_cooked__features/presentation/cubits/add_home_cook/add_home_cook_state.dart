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
  homeCookImageLoading,
  homeCookImagePicked,
  mandatoryFieldPicked,
  radioSelected,
  featureAdded,
  addHomeCookLoading,
  addHomeCookSuccess,
  addHomeCookError,
  uploadImagesSuccess,
  uploadImagesError,
  uploadImagesLoading,
  checkBarTapped,
  nationalIdPicked,
  getHomeCookLoading,
  getHomeCookSuccess,
  getHomeCookError,
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

  bool get isHomeCookImageLoading =>
      state == AddHomeCookStatus.homeCookImageLoading;

  bool get isHomeCookImagePicked =>
      state == AddHomeCookStatus.homeCookImagePicked;

  bool get isMandatoryFieldPicked =>
      state == AddHomeCookStatus.mandatoryFieldPicked;

  bool get isRadioSelected => state == AddHomeCookStatus.radioSelected;

  bool get isFeatureAdded => state == AddHomeCookStatus.featureAdded;

  bool get isAddHomeCookLoading =>
      state == AddHomeCookStatus.addHomeCookLoading;

  bool get isAddHomeCookSuccess =>
      state == AddHomeCookStatus.addHomeCookSuccess;

  bool get isAddHomeCookError => state == AddHomeCookStatus.addHomeCookError;

  bool get isUploadImagesSuccess =>
      state == AddHomeCookStatus.uploadImagesSuccess;

  bool get isUploadImagesError => state == AddHomeCookStatus.uploadImagesError;

  bool get isUploadImagesLoading =>
      state == AddHomeCookStatus.uploadImagesLoading;

  bool get isCheckBarTapped => state == AddHomeCookStatus.checkBarTapped;

  bool get isNationalIdPicked => state == AddHomeCookStatus.nationalIdPicked;
}

class AddHomeCookState {
  final AddHomeCookStatus state;
  final String? erorrMessage;
  final File? logo;
  final UtilityBill? utilityBill;
  final NationalId? nationalId;
  List<bool> isValid;
  List<bool> isValidNationalId;

  // final FeatureType? featureType;
  final List<Feature>? addedFeatures;
  final Map<String, List<String>>? imagesUrlMap;
  final HomeCookModel? homeCookModel;
  final double? uploadProgress;
  final bool? isGymInfoValid;
  final bool? isAccept;
  final bool? isConfirm;
  final int? numberOfImages;

  AddHomeCookState(
      {required this.state,
      this.erorrMessage,
      this.logo,
      this.utilityBill,
      this.nationalId,
      //this.featureType,
      this.addedFeatures,
      this.imagesUrlMap,
      this.homeCookModel,
      this.uploadProgress = 0,
      this.isAccept = false,
      this.isConfirm = false,
      this.isGymInfoValid = false,
      this.numberOfImages,
      this.isValid = const [true, true, true],
      this.isValidNationalId = const [true, true]});

  bool get isValidAll => isValid.every((element) => element);

  bool get isValidNationalIdAll =>
      isValidNationalId.every((element) => element);

  AddHomeCookState copyWith(
      {AddHomeCookStatus? state,
      String? erorrMessage,
      File? logo,
      // FeatureType? featureType,
      UtilityBill? utilityBill,
      NationalId? nationalId,
      List<Feature>? addedFeatures,
      Map<String, List<String>>? imagesUrlMap,
      HomeCookModel? homeCookModel,
      double? uploadProgress,
      bool? isAccept,
      bool? isConfirm,
      bool? isGymInfoValid,
      int? numberOfImages,
      List<bool>? isValid,
      List<bool>? isValidNationalId}) {
    return AddHomeCookState(
        state: state ?? this.state,
        erorrMessage: erorrMessage ?? this.erorrMessage,
        logo: logo ?? this.logo,
        //featureType: featureType ?? this.featureType,
        utilityBill: utilityBill ?? this.utilityBill,
        nationalId: nationalId ?? this.nationalId,
        addedFeatures: addedFeatures ?? this.addedFeatures,
        imagesUrlMap: imagesUrlMap ?? this.imagesUrlMap,
        homeCookModel: homeCookModel ?? this.homeCookModel,
        isAccept: isAccept ?? this.isAccept,
        isConfirm: isConfirm ?? this.isConfirm,
        uploadProgress: uploadProgress ?? this.uploadProgress,
        isGymInfoValid: isGymInfoValid ?? this.isGymInfoValid,
        numberOfImages: numberOfImages ?? this.numberOfImages,
        isValid: isValid ?? this.isValid,
        isValidNationalId: isValidNationalId ?? this.isValidNationalId);
  }

  @override
  String toString() {
    return 'AddGymState(state: $state, erorrMessage: $erorrMessage, logo: $logo, utilityBill: $utilityBill, nationalId: $nationalId, isValid: $isValid, isValidNationalId: $isValidNationalId, homeCookModel: $homeCookModel)';
  }
}

extension UtilityBillX on UtilityBill {
  String get electricityBillText => "Electricity Bill";

  String get idOrPassportOfOwnerText => "ID or Passport of Owner";

  String get ownershipContractText => "Ownership Contract";

  String get taxRegistrationText => "Tax Registration";

  bool get isElectricityBillPicked => electricityBill != null;

  bool get isGasBillPicked => gasBill != null;

  bool get isLandlineBillPicked => landlineBill != null;

  File? getFieldByText(String text) {
    switch (text) {
      case "Electricity Bill":
        return electricityBill;
      case "Gas Bill":
        return gasBill;
      case "Landline Bill":
        return landlineBill;
      default:
        return null;
    }
  }
}

class UtilityBill {
  final File? electricityBill;
  final File? gasBill;
  final File? landlineBill;

  UtilityBill({
    this.electricityBill,
    this.gasBill,
    this.landlineBill,
  });

  UtilityBill copyWith({
    File? electricityBill,
    File? gasBill,
    File? landlineBill,
  }) {
    return UtilityBill(
      electricityBill: electricityBill ?? this.electricityBill,
      gasBill: gasBill ?? this.gasBill,
      landlineBill: landlineBill ?? this.landlineBill,
    );
  }

  @override
  String toString() {
    return 'UtilityBill(electricityBill: $electricityBill, gasBill: $gasBill, landlineBill: $landlineBill)';
  }

  @override
  bool operator ==(covariant UtilityBill other) {
    if (identical(this, other)) return true;

    return other.electricityBill == electricityBill &&
        other.gasBill == gasBill &&
        other.landlineBill == landlineBill;
  }

  @override
  int get hashCode {
    return electricityBill.hashCode ^ gasBill.hashCode ^ landlineBill.hashCode;
  }
}

extension NationalIdX on NationalId {
  String get frontText => "National ID Front";

  String get backText => "National ID Back";

  bool get isFrontPicked => front != null;

  bool get isBackPicked => back != null;

  File? getFieldByText(String text) {
    switch (text) {
      case "National ID Front":
        return front;
      case "National ID Back":
        return back;
      default:
        return null;
    }
  }
}

class NationalId {
  final File? front;
  final File? back;

  NationalId({this.front, this.back});

  NationalId copyWith({File? front, File? back}) {
    return NationalId(front: front ?? this.front, back: back ?? this.back);
  }

  @override
  String toString() {
    return 'NationalId(front: $front, back: $back)';
  }

  @override
  bool operator ==(covariant NationalId other) {
    if (identical(this, other)) return true;

    return other.front == front && other.back == back;
  }

  @override
  int get hashCode {
    return front.hashCode ^ back.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';


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
  mandatoryFieldPicked
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
}

class AddGymState {
  final AddGymStatus state;
  final String? erorrMessage;
  final File? logo;
  final MandatoryFields? mandatoryFields;
  final List<File>? gymImages;
   List<bool> isValid;
  AddGymState({
    required this.state,
    this.erorrMessage,
    this.logo,
    this.mandatoryFields,
    this.gymImages,
    this.isValid=const [true,true,true]
  });

 
  bool get isValidAll => isValid.every((element) => element);
  AddGymState copyWith({
    AddGymStatus? state,
    String? erorrMessage,
    File? logo,
    MandatoryFields? mandatoryFields,
    List<File>? gymImages,
   List<bool>? isValid
  }) {
    return AddGymState(
      state: state ?? this.state,
      erorrMessage: erorrMessage ?? this.erorrMessage,
      logo: logo ?? this.logo,
      mandatoryFields: mandatoryFields ?? this.mandatoryFields,
      gymImages: gymImages ?? this.gymImages,
      isValid: isValid?? this.isValid
    );
  }

  @override
  String toString() {
    return 'AddGymState(state: $state, erorrMessage: $erorrMessage, logo: $logo, mandatoryFields: $mandatoryFields, gymImages: $gymImages, isValid: $isValid)';
  }
}
extension MandatoryFieldsX on MandatoryFields {
  String get gymOperatingLicenseText => "Gym Operating License";
  String get idOrPassportOfOwnerText => "ID or Passport of Owner"; 
  String get ownershipContractText => "Ownership Contract";
  String get taxRegistrationText => "Tax Registration";

  bool get isGymOperatingLicensePicked => gymOperatingLicense != null;
  bool get isIdOrPassportOfOwnerPicked => idOrPassportOfOwner!= null;
  bool get isOwnershipContractPicked => ownershipContract!= null;
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
  
    return 
      other.ownershipContract == ownershipContract &&
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

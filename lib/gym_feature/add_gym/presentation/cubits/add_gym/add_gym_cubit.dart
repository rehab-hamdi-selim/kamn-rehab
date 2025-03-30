import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/helpers/secure_storage_helper.dart';
import 'package:kamn/core/utils/image_picker.dart';
import 'package:kamn/gym_feature/add_gym/data/models/gym_request_model.dart';
import 'package:kamn/gym_feature/add_gym/data/repositories/add_gym_repository.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

@injectable
class AddGymCubit extends Cubit<AddGymState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController xController = TextEditingController();
 

  AddGymCubit({required this.repository})
      : super(AddGymState(state: AddGymStatus.initial));

  @override
  Future<void> close() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
    facebookController.dispose();
    instagramController.dispose();
    xController.dispose();
    contactController.dispose();
    return super.close();
  }

  final AddGymRepository repository;
  final List<String> tabs = ["Gym Info", "Required Documents"];
  final List<File> _gymImages = [];
  late TabController tabController;
  final GlobalKey<FormState> gymInfoKey = GlobalKey<FormState>();
  final GlobalKey<FormState> requiredDocumentsKey = GlobalKey<FormState>();
  List<File> get gymImages => List.unmodifiable(_gymImages);

  void initTabController(TickerProvider vsync) {
    tabController =
        TabController(length: tabs.length, initialIndex: 0, vsync: vsync);
    tabController.addListener(() {
      emit(state.copyWith(
        state: AddGymStatus.swipped,
      ));
    });
  }

  void goToNextPage() {
    if (tabController.index < tabController.length - 1) {
      tabController.animateTo(tabController.index + 1);
    }
  }

  void goToPreviousPage() {
    if (tabController.index > 0) {
      tabController.animateTo(tabController.index - 1);
    }
  }

  Future<void> pickLogoImage() async {
    emit(state.copyWith(state: AddGymStatus.logoLoading));
    final image = await pickImage();
    if (image != null) {
      emit(state.copyWith(
        state: AddGymStatus.logoPicked,
        logo: image,
      ));
    }
  }

  Future<void> pickGymImage() async {
    final image = await pickImage();
    if (image != null) {
      _gymImages.add(image);
      emit(state.copyWith(
          state: AddGymStatus.gymImagePicked,
          gymImages: List.from(_gymImages)));
    }
  }

  Future<void> replaceGymImage(int index) async {
    final image = await pickImage();
    if (image != null) {
      _gymImages[index] = image;
      emit(state.copyWith(
          state: AddGymStatus.gymImagePicked,
          gymImages: List.from(_gymImages)));
    }
  }

  bool checkMandatoryFields() {
    final mandatoryFields = state.mandatoryFields;

    var isValid = List<bool>.from(state.isValid);
      isValid[0] = mandatoryFields?.gymOperatingLicense != null;
    
      isValid[1] = mandatoryFields?.idOrPassportOfOwner != null;
    
      isValid[2] = mandatoryFields?.ownershipContract != null;
    
    print(isValid);
    emit(state.copyWith(
      isValid: isValid,
    ));
    return state.isValidAll;
  }



 

  Future<void> pickMandatoryImages(String field) async {
    final image = await pickImage();

    if (image != null) {
      emit(state.copyWith(
        state: AddGymStatus.mandatoryFieldPicked,
        mandatoryFields: (state.mandatoryFields ?? MandatoryFields()).copyWith(
          gymOperatingLicense: field == "Gym Operating License"
              ? image
              : state.mandatoryFields?.gymOperatingLicense,
          idOrPassportOfOwner: field == "ID or Passport of Owner"
              ? image
              : state.mandatoryFields?.idOrPassportOfOwner,
          ownershipContract: field == "Ownership Contract"
              ? image
              : state.mandatoryFields?.ownershipContract,
          taxRegistration: field == "Tax Registration"
              ? image
              : state.mandatoryFields?.taxRegistration,
        ),
      ));
    }
  }

  Future<void> addGymRequest(GymRequestModel gym) async {
    emit(state.copyWith(state: AddGymStatus.addGymLoading));
    final response = await repository.addGymRequest(gym);
    response.fold((error) {
      emit(state.copyWith(
          state: AddGymStatus.addGymError, erorrMessage: error.erorr));
    }, (success) {
      // Save gym ID to secure storage after successful creation
      emit(state.copyWith(
          state: AddGymStatus.addGymSuccess, gymRequest: success));
    });
  }

  // New function to save gym ID to secure storage
  Future<void> saveGymIdToSecureStorage(String gymId) async {
    final response = await SecureStorageHelper.saveGymId(gymId);
    response.fold(
      (error) {
        emit(state.copyWith(
          state: AddGymStatus.secureStorageError,
          erorrMessage: "Failed to save gym ID: $error",
        ));
      },
      (_) {
        print("Gym ID saved to secure storage");
        // Successfully saved, no need to update state
      },
    );
  }

  // New function to get gym ID from secure storage
  Future<void> getGymIdFromSecureStorage() async {
    final response = await SecureStorageHelper.getGymId();
    return response.fold(
      (error) {
        emit(state.copyWith(
          state: AddGymStatus.secureStorageError,
          erorrMessage: "Failed to get gym ID: $error",
        ));
      },
      (gymId) => emit(state.copyWith(state: AddGymStatus.secureStorageSuccess, gymId: gymId))
    );
  }

  Future<void> uploadImages() async {
    emit(state.copyWith(state: AddGymStatus.addGymLoading));

    final imagesMap = <String, List<File>>{
      'logo':state.logo==null?[]: [state.logo!],
      'gymImages': _gymImages,
      'mandatory': [
        state.mandatoryFields!.gymOperatingLicense!,
        state.mandatoryFields!.idOrPassportOfOwner!,
        state.mandatoryFields!.ownershipContract!,
        if (state.mandatoryFields!.taxRegistration != null)
          state.mandatoryFields!.taxRegistration!,
      ],
    };
      final num = imagesMap.values.expand((list) => list).toList().length;

  emit(state.copyWith( numberOfImages: num));
    final uploadResponse = await repository.uploadImages(imagesMap, (progress) {
      print("now on $progress");
      emit(state.copyWith(
        state: AddGymStatus.uploadImagesLoading,
        uploadProgress: progress,
      ));
    });

    uploadResponse.fold((error) {
      emit(state.copyWith(
        state: AddGymStatus.uploadImagesError,
        erorrMessage: error.erorr,
      ));
      return null;
    },
        (urls) => emit(state.copyWith(
              state: AddGymStatus.uploadImagesSuccess,
              imagesUrlMap: urls,
            )));
  }

  void validateGymInfo() {
    final isGymInfoValid = gymInfoKey.currentState?.validate() ?? false;
    emit(state.copyWith(isGymInfoValid: isGymInfoValid));
  }
  void onAcceptTab(bool? value){
    emit(state.copyWith(state: AddGymStatus.checkBarTapped,isAccept: !state.isAccept!));
  }
  void onConfirmTab(bool? value ){
    emit(state.copyWith(state: AddGymStatus.checkBarTapped,isConfirm: !state.isConfirm!));
  }
  void reset(){
    emit (state.copyWith(state:AddGymStatus.initial,uploadProgress: 0));
  }
}

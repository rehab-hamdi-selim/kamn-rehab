import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/utils/image_picker.dart';
import 'package:kamn/home_cooked__features/data/models/home_cook_model_test.dart';
import 'package:kamn/home_cooked__features/data/repositories/home_cook_repository.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_state.dart';

@injectable
class AddHomeCookCubit extends Cubit<AddHomeCookState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController xController = TextEditingController();
  final TextEditingController menuController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController featureDescriptionController =
      TextEditingController();

  AddHomeCookCubit({required this.repository})
      : super(AddHomeCookState(state: AddHomeCookStatus.initial));

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
    facebookController.dispose();
    instagramController.dispose();
    xController.dispose();
    contactController.dispose();
    menuController.dispose();
    priceController.dispose();
    featureDescriptionController.dispose();
    return super.close();
  }

  final AddHomeCookRepository repository;
  final List<String> tabs = ["Personal Info", "Location Verify"];
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
        state: AddHomeCookStatus.swipped,
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
    emit(state.copyWith(state: AddHomeCookStatus.logoLoading));
    final image = await pickImage();
    if (image != null) {
      emit(state.copyWith(
        state: AddHomeCookStatus.logoPicked,
        logo: image,
      ));
    }
  }

  Future<void> pickGymImage() async {
    final image = await pickImage();
    if (image != null) {
      _gymImages.add(image);
      emit(state.copyWith(
          state: AddHomeCookStatus.gymImagePicked,
          gymImages: List.from(_gymImages)));
    }
  }

  Future<void> replaceGymImage(int index) async {
    final image = await pickImage();
    if (image != null) {
      _gymImages[index] = image;
      emit(state.copyWith(
          state: AddHomeCookStatus.gymImagePicked,
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

  // void addFeature() {
  //   emit(state.copyWith(
  //     state: AddGymStatus.featureAdded,
  //     addedFeatures: [
  //       ...state.addedFeatures ?? [],
  //       Feature(
  //         name: menuController.text,
  //         description: featureDescriptionController.text,
  //         price: priceController.text,
  //
  //       )
  //     ],
  //   ));
  // }

  // void onChangeRadioSelection(FeatureType newOption) {
  //   if (state.featureType == newOption) {
  //     return;
  //   }
  //   emit(state.copyWith(
  //       state: AddGymStatus.radioSelected, featureType: newOption));
  // }

  Future<void> pickMandatoryImages(String field) async {
    final image = await pickImage();

    if (image != null) {
      emit(state.copyWith(
        state: AddHomeCookStatus.mandatoryFieldPicked,
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

  Future<void> addGymRequest(HomeCookModel cook) async {
    emit(state.copyWith(state: AddHomeCookStatus.addGymLoading));
    final response = await repository.addHomeCookRequest(cook);
    response.fold((error) {
      emit(state.copyWith(
          state: AddHomeCookStatus.addGymError, erorrMessage: error.erorr));
    }, (success) {
      // emit(state.copyWith(
      //  state: AddGymStatus.addGymSuccess, gymRequest: success));
    });
  }

  Future<void> uploadImages() async {
    emit(state.copyWith(state: AddHomeCookStatus.addGymLoading));

    final imagesMap = <String, List<File>>{
      'logo': state.logo == null ? [] : [state.logo!],
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

    emit(state.copyWith(numberOfImages: num));
    final uploadResponse = await repository.uploadImages(imagesMap, (progress) {
      print("now on $progress");
      emit(state.copyWith(
        state: AddHomeCookStatus.uploadImagesLoading,
        uploadProgress: progress,
      ));
    });

    uploadResponse.fold((error) {
      emit(state.copyWith(
        state: AddHomeCookStatus.uploadImagesError,
        erorrMessage: error.erorr,
      ));
      return null;
    },
        (urls) => emit(state.copyWith(
          state: AddHomeCookStatus.uploadImagesSuccess,
              imagesUrlMap: urls,
            )));
  }

  void validateGymInfo() {
    final isGymInfoValid = gymInfoKey.currentState?.validate() ?? false;
    emit(state.copyWith(isGymInfoValid: isGymInfoValid));
  }

  void onAcceptTab(bool? value) {
    emit(state.copyWith(
        state: AddHomeCookStatus.checkBarTapped, isAccept: !state.isAccept!));
  }

  void onConfirmTab(bool? value) {
    emit(state.copyWith(
        state: AddHomeCookStatus.checkBarTapped, isConfirm: !state.isConfirm!));
  }

  void reset() {
    emit(state.copyWith(state: AddHomeCookStatus.initial, uploadProgress: 0));
  }
}

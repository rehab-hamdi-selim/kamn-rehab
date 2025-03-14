import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/utils/image_picker.dart';
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
  final TextEditingController xController = TextEditingController();
  final TextEditingController menuController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController featureDescriptionController = TextEditingController();

  AddGymCubit() : super(AddGymState(state: AddGymStatus.initial));

  @override
  Future<void> close() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
    facebookController.dispose();
    instagramController.dispose();
    xController.dispose();
    menuController.dispose();
    priceController.dispose();
    featureDescriptionController.dispose();
    return super.close();
  }

  final List<String> tabs = ["Gym Info", "Required Documents", "Gym Features"];
  final List<File> _gymImages = [];
  late TabController tabController;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
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
    if (mandatoryFields?.gymOperatingLicense == null) {
      isValid[0] = false;
    }
    if (mandatoryFields?.idOrPassportOfOwner == null) {
      isValid[1] = false;
    }
    if (mandatoryFields?.ownershipContract == null) {
      isValid[2] = false;
    }

    emit(state.copyWith(
      isValid: isValid,
    ));
    return state.isValidAll;
  }
  void addFeature() {

    emit(state.copyWith(
      state: AddGymStatus.featureAdded,
      addedFeatures: [...state.addedFeatures??[], Feature(
        name: menuController.text,
        description: featureDescriptionController.text,
        price: priceController.text,
        pricingOption: state.featureType,
        
      )],
    ));
  }
  void onChangeRadioSelection(FeatureType newOption) {
    if (state.featureType == newOption) {
      return;
    }
    emit(state.copyWith(state:AddGymStatus.radioSelected,featureType: newOption));
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
}

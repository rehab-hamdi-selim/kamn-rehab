import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/utils/image_picker.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';

@injectable
class AddGymCubit extends Cubit<AddGymState> {
  AddGymCubit() : super(AddGymState(state: AddGymStatus.initial));

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
      emit(state.copyWith(state: AddGymStatus.logoPicked, logo: image,));
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

  Future<void> pickMandatoryImages(String field) async {
    final image = await pickImage();

    if (image != null) {
      switch (field) {
        case "Gym Operating License":
          emit(state.copyWith(
            state: AddGymStatus.mandatoryFieldPicked,
            mandatoryFields: state.mandatoryFields?.copyWith(
              gymOperatingLicense: image,
            ),
          ));
          break;
        case "ID or Passport of Owner":
          emit(state.copyWith(
            state: AddGymStatus.mandatoryFieldPicked,
            mandatoryFields: state.mandatoryFields?.copyWith(
              idOrPassportOfOwner: image,
            ),
          ));
          break;
        case "Ownership Contract":
          emit(state.copyWith(
            state: AddGymStatus.mandatoryFieldPicked,
            mandatoryFields: state.mandatoryFields?.copyWith(
              ownershipContract: image,
            ),
          ));
          break;
        case "Tax Registration":
          emit(state.copyWith(
            state: AddGymStatus.mandatoryFieldPicked,
            mandatoryFields: state.mandatoryFields?.copyWith(
              taxRegistration: image,
            ),
          ));
          break;
        default:
          debugPrint("Unexpected field: $field");
      }
    }
  }
}
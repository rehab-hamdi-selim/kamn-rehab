import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/utils/image_picker.dart';
import 'package:kamn/home_cooked__features/data/models/home_cook_model_test.dart';
import 'package:kamn/home_cooked__features/data/repositories/home_cook_repository.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_state.dart';

import '../../../data/models/delivery_model.dart';

@injectable
class AddHomeCookCubit extends Cubit<AddHomeCookState> {
  //for add homeCook
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

  final TextEditingController homeAddressController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingNumberController =
      TextEditingController();
  final TextEditingController apartmentController = TextEditingController();

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
    homeAddressController.dispose();
    streetController.dispose();
    buildingNumberController.dispose();
    apartmentController.dispose();
    return super.close();
  }

  final AddHomeCookRepository repository;
  final List<String> tabs = [
    "Personal Info",
    "Location Verify",
    "Meal Info",
    "Order Options"
  ];
  final List<File> _homeCookImages = [];
  late TabController tabController;
  final GlobalKey<FormState> homeCookInfoKey = GlobalKey<FormState>();

  //final GlobalKey<FormState> requiredDocumentsKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addressCookVerifyKey = GlobalKey<FormState>();

  List<File> get homeCookImages => List.unmodifiable(_homeCookImages);

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

  Future<void> pickHomeCookImage() async {
    final image = await pickImage();
    if (image != null) {
      _homeCookImages.add(image);
      emit(state.copyWith(
        state: AddHomeCookStatus.homeCookImagePicked,
      ));
    }
  }

  Future<void> replaceHomeCookImage(int index) async {
    final image = await pickImage();
    if (image != null) {
      _homeCookImages[index] = image;
      emit(state.copyWith(
        state: AddHomeCookStatus.homeCookImagePicked,
      ));
    }
  }

  bool checkMandatoryFields() {
    final mandatoryFields = state.utilityBill;

    var isValid = List<bool>.from(state.isValid);
    isValid[0] = mandatoryFields?.electricityBill != null;

    isValid[1] = mandatoryFields?.gasBill != null;

    isValid[2] = mandatoryFields?.landlineBill != null;

    print(isValid);
    emit(state.copyWith(
      isValid: isValid,
    ));
    return state.isValidAll;
  }

  bool checkNationalIdFields() {
    final mandatoryFields = state.nationalId;
    var isValidNationalId = List<bool>.from(state.isValidNationalId);
    isValidNationalId[0] = mandatoryFields?.front != null;
    isValidNationalId[1] = mandatoryFields?.back != null;
    print(isValidNationalId);
    emit(state.copyWith(
      isValidNationalId: isValidNationalId,
    ));
    return state.isValidNationalIdAll;
  }

  Future<void> pickUtilityImages(String field) async {
    final image = await pickImage();
    if (image != null) {
      emit(state.copyWith(
        state: AddHomeCookStatus.mandatoryFieldPicked,
        utilityBill: (state.utilityBill ?? UtilityBill()).copyWith(
          electricityBill: field == "Electricity Bill"
              ? image
              : state.utilityBill?.electricityBill,
          gasBill: field == "Gas Bill" ? image : state.utilityBill?.gasBill,
          landlineBill: field == "Landline Bill"
              ? image
              : state.utilityBill?.landlineBill,
        ),
      ));
    }
  }

  Future<void> pickNationalIdImages(String field) async {
    final image = await pickImage();
    if (image != null) {
      emit(state.copyWith(
        state: AddHomeCookStatus.nationalIdPicked,
        nationalId: (state.nationalId ?? NationalId()).copyWith(
          front: field == "National ID Front" ? image : state.nationalId?.front,
          back: field == "National ID Back" ? image : state.nationalId?.back,
        ),
      ));
    }
  }

  Future<void> addHomeCook(HomeCookModel cook) async {
    emit(state.copyWith(state: AddHomeCookStatus.addHomeCookLoading));
    final response = await repository.addHomeCookRequest(cook);
    response.fold((error) {
      emit(state.copyWith(
          state: AddHomeCookStatus.addHomeCookError,
          erorrMessage: error.erorr));
    }, (homeCookModel) {
      emit(state.copyWith(
          state: AddHomeCookStatus.addHomeCookSuccess,
          homeCookModel: homeCookModel));
    });
  }

  Future<void> uploadImages() async {
    emit(state.copyWith(state: AddHomeCookStatus.addHomeCookLoading));

    final imagesMap = <String, List<File>>{
      'logo': state.logo == null ? [] : [state.logo!],
      'utility': [
        state.utilityBill!.electricityBill!,
        state.utilityBill!.gasBill!,
        state.utilityBill!.landlineBill!,
      ],
      'nationalId': [
        state.nationalId!.front!,
        state.nationalId!.back!,
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

  void validateHomeCookInfo() {
    final isHomeCookInfoValid =
        homeCookInfoKey.currentState?.validate() ?? false;
    emit(state.copyWith(isHomeCookInfoValid: isHomeCookInfoValid));
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

//mary

  Future<void> updateServiceProviderHomeCookAddDeliveryData(
      DeliveryModel deliveryModel) async {
    emit(state.copyWith(state: AddHomeCookStatus.addHomeCookLoading));
    //update home cook in the state with delivery data and pass it to the repository
    final response = await repository
        .updateServiceProviderHomeCookAddDeliveryData(state.homeCookModel!);
    response.fold((error) {
      emit(state.copyWith(
          //create new error state here
          state: AddHomeCookStatus.addHomeCookError,
          erorrMessage: error.erorr));
    }, (_) {
      //create new success state here
      emit(state.copyWith(
        state: AddHomeCookStatus.addHomeCookSuccess,
        //update home cook in the state with delivery data
      ));
    });
  }

  Future<void> getServiceProviderHomeCook() async {
    emit(state.copyWith(state: AddHomeCookStatus.getHomeCookLoading));
    final response = await repository.getServiceProviderHomeCook();
    response.fold((error) {
      emit(state.copyWith(
          state: AddHomeCookStatus.getHomeCookError,
          erorrMessage: error.erorr));
    }, (homeCookModel) {
      emit(state.copyWith(
          state: AddHomeCookStatus.getHomeCookSuccess,
          homeCookModel: homeCookModel));
    });
  }
}

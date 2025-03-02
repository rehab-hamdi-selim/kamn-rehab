import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/utils/image_picker.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';
@injectable
class AddGymCubit extends Cubit<AddGymState> {
  AddGymCubit() : super(AddGymState(state: AddGymStatus.initial));
  late TabController tabController;
  final List<String> tabs = ["Gym Info", "Required Documents", "Gym Features"];

  void initTabController(TickerProvider vsync) {
    tabController = TabController(length: tabs.length, vsync: vsync);
    tabController.addListener(() {
      emit(state.copyWith(state: AddGymStatus.swipped,tabController: tabController));
    });
  }
  

  Future<void> pickLogoImage() async {
    emit(state.copyWith(state: AddGymStatus.logoLoading));
    var image = await pickImage();
    if (image != null) {
      emit(state.copyWith(state: AddGymStatus.logoPicked, logo: image));
    } else {
      emit(state.copyWith(
          state: AddGymStatus.error, erorrMessage: 'cancel image pick'));
    }
  }

  @override
  Future<void> close() {
    tabController.dispose();
    return super.close();
  }
}

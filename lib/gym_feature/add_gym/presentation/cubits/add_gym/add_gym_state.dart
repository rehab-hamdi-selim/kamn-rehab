// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

enum AddGymStatus {
  initial,
  loading,
  success,
  error,
  swipped,
  logoPicked,logoLoading,

}

extension AddGymStateX on AddGymState {
  bool get isInitial => state == AddGymStatus.initial;
  bool get isLoading => state == AddGymStatus.loading;
  bool get isSuccess => state == AddGymStatus.success;
  bool get isError => state == AddGymStatus.error;
  bool get isSwipped => state == AddGymStatus.swipped;
  bool get isLogoPicked => state == AddGymStatus.logoPicked;
  bool get isLogoLoading => state == AddGymStatus.logoLoading;

}

class AddGymState {
  final AddGymStatus state;
  final String? erorrMessage;
  final TabController? tabController;
  final File? logo;
  AddGymState({
    required this.state,
    this.erorrMessage,
    this.tabController,
    this.logo,
  });
 

  

  AddGymState copyWith({
    AddGymStatus? state,
    String? erorrMessage,
    TabController? tabController,
    File? logo,
  }) {
    return AddGymState(
      state: state ?? this.state,
      erorrMessage: erorrMessage ?? this.erorrMessage,
      tabController: tabController ?? this.tabController,
      logo: logo ?? this.logo,
    );
  }

  @override
  String toString() {
    return 'AddGymState(state: $state, erorrMessage: $erorrMessage, tabController: $tabController, logo: $logo)';
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../entities/user_model.dart';

enum AppUserStates {
  initial,
  failure,
  notLoggedIn,
  loggedIn,
  signOut,
  installed,
  notInstalled,
  success,
  gettedData,
  failureSaveData,
  clearUserData,
  loading,
  updated,
  failureGetHomeCookId,
  successGetHomeCookId,
  failureSaveHomeCookId,
  successSaveHomeCookId,
}

extension AppUserStateExtension on AppUserState {
  bool isInitial() => state == AppUserStates.initial;
  bool isLoggedIn() => state == AppUserStates.loggedIn;
  bool isNotLoggedIn() => state == AppUserStates.notLoggedIn;
  bool isFailure() => state == AppUserStates.failure;
  bool isSignOut() => state == AppUserStates.signOut;
  bool isInstalled() => state == AppUserStates.installed;
  bool isNotInstalled() => state == AppUserStates.notInstalled;
  bool isSuccess() => state == AppUserStates.success;
  bool isGettedData() => state == AppUserStates.gettedData;
  bool isFailureSaveData() => state == AppUserStates.failureSaveData;
  bool isClearUserData() => state == AppUserStates.clearUserData;
  bool isLoading() => state == AppUserStates.loading;
  bool isUpdated() => state == AppUserStates.updated;
}

class AppUserState {
  final AppUserStates state;
  final UserModel? user;
  final String? userIntialRoute;
  final String? homeCookId;
  final String? errorMessage;
  AppUserState({
    required this.state,
    this.user,
    this.userIntialRoute,
    this.errorMessage,
    this.homeCookId,
  });

  AppUserState copyWith({
    AppUserStates? state,
    UserModel? user,
    String? errorMessage,
    String? userIntialRoute,
    String? homeCookId,
  }) {
    return AppUserState(
      state: state ?? this.state,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      userIntialRoute: userIntialRoute ?? this.userIntialRoute,
      homeCookId: homeCookId ?? this.homeCookId,
    );
  }

  @override
  String toString() =>
      'AppUserState(state: $state, user: $user, errorMessage: $errorMessage, homeCookId: $homeCookId)';

  @override
  bool operator ==(covariant AppUserState other) {
    if (identical(this, other)) return true;

    return other.state == state &&
        other.user == user &&
        other.errorMessage == errorMessage &&
        other.homeCookId == homeCookId;
  }

  @override
  int get hashCode =>
      state.hashCode ^
      user.hashCode ^
      errorMessage.hashCode ^
      homeCookId.hashCode;
}

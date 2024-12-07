// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../entities/user_model.dart';

enum AppUserStates {
  Initial,
  Failure,
  IsNotLoggedIn,
  IsLoggedIn,
}

extension AppUserStateExtension on AppUserState {
  bool isInitial() => state == AppUserStates.Initial;
  bool isIsLoggedIn() => state == AppUserStates.IsLoggedIn;
  bool isIsNotLoggedIn() => state == AppUserStates.IsNotLoggedIn;
  bool isFailure() => state == AppUserStates.Failure;
}

class AppUserState {
  final AppUserStates state;
  final UserModel? user;
  final String? errorMessage;
  AppUserState({
    required this.state,
    this.user,
    this.errorMessage,
  });

  AppUserState copyWith({
    AppUserStates? state,
    UserModel? user,
    String? errorMessage,
  }) {
    return AppUserState(
      state: state ?? this.state,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'AppUserState(state: $state, user: $user, errorMessage: $errorMessage)';

  @override
  bool operator ==(covariant AppUserState other) {
    if (identical(this, other)) return true;

    return other.state == state &&
        other.user == user &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => state.hashCode ^ user.hashCode ^ errorMessage.hashCode;
}

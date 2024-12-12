// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../entities/user_model.dart';

enum AppUserStates {
  initial,
  failure,
  notLoggedIn,
  loggedIn,
}

extension AppUserStateExtension on AppUserState {
  bool isInitial() => state == AppUserStates.initial;
  bool isLoggedIn() => state == AppUserStates.loggedIn;
  bool isNotLoggedIn() => state == AppUserStates.notLoggedIn;
  bool isFailure() => state == AppUserStates.failure;
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

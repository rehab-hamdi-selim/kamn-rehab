// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../core/common/entities/user_model.dart';

enum SignInStatus {
  initial,
  loading,
  success,
  failure,
  visible,
  successGetData,
  failureGetData,
  successSignOut,
  googleAuthLoading,
  googleAuthSuccess,
  googleAuthFailure,
  setUserDataSuccess,
  setUserDataLoading,
  setUserDataFailure,
}

extension SignInStateExtension on SignInState {
  bool get isInitial => state == SignInStatus.initial;
  bool get isLoading => state == SignInStatus.loading;
  bool get isSuccess => state == SignInStatus.success;
  bool get isFailure => state == SignInStatus.failure;
  bool get isVisible => state == SignInStatus.visible;
  bool get isSuccessGetData => state == SignInStatus.successGetData;
  bool get isFailureGetData => state == SignInStatus.failureGetData;
  bool get isSuccessSignOut => state == SignInStatus.successSignOut;
  bool get isGoogleAuthLoading => state == SignInStatus.googleAuthLoading;
  bool get isGoogleAuthSuccess => state == SignInStatus.googleAuthSuccess;
  bool get isGoogleAuthFailure => state == SignInStatus.googleAuthFailure;
  bool get isDwrUserDataLoading => state == SignInStatus.setUserDataLoading;
  bool get isDwrUserDataSuccess => state == SignInStatus.setUserDataSuccess;
  bool get isDwrUserDataFaliure => state == SignInStatus.setUserDataFailure;
}

class SignInState {
  final SignInStatus state;
  final UserModel? userModel;
  final String? erorrMessage;
  final String? uid;
  final bool isVisible;
  SignInState({
    required this.state,
    this.userModel,
    this.erorrMessage,
    this.uid,
    this.isVisible = true,
  });

  SignInState copyWith({
    SignInStatus? state,
    UserModel? userModel,
    String? erorrMessage,
    bool? isVisible,
    String? uid,
  }) {
    return SignInState(
      state: state ?? this.state,
      userModel: userModel ?? this.userModel,
      erorrMessage: erorrMessage ?? this.erorrMessage,
      isVisible: isVisible ?? this.isVisible,
      uid: uid ?? this.uid,
    );
  }

  @override
  String toString() =>
      'SignInState(state: $state, userModel: $userModel, erorrMessage: $erorrMessage isVisible: $isVisible uid: $uid)';

  @override
  bool operator ==(covariant SignInState other) {
    if (identical(this, other)) return true;

    return other.state == state &&
        other.userModel == userModel &&
        other.erorrMessage == erorrMessage &&
        other.isVisible == isVisible &&
        other.uid == uid;
  }

  @override
  int get hashCode =>
      state.hashCode ^
      userModel.hashCode ^
      erorrMessage.hashCode ^
      isVisible.hashCode ^
      uid.hashCode;
}

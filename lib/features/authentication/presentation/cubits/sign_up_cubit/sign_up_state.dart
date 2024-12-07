// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../core/common/entities/user_model.dart';

enum SignUpStatus {
  initial,
  loading,
  success,
  failure,
  VisiblePassword,
  VisiblePasswordConfirm,
  successSaveData,
  failureSaveData,
  successDeleteUser,
  failureDeleteUser
}

extension SignInStateExtension on SignUpState {
  bool get isInitial => state == SignUpStatus.initial;
  bool get isLoading => state == SignUpStatus.loading;
  bool get isSuccess => state == SignUpStatus.success;
  bool get isFailure => state == SignUpStatus.failure;
  bool get isVisiblePassword => state == SignUpStatus.VisiblePassword;
  bool get isVisiblePasswordConfirm =>
      state == SignUpStatus.VisiblePasswordConfirm;
  bool get isSuccessSaveData => state == SignUpStatus.successSaveData;
  bool get isFailureSaveData => state == SignUpStatus.failureSaveData;
  bool get isSuccessDeleteUser => state == SignUpStatus.successDeleteUser;
  bool get isFailureDeleteUser => state == SignUpStatus.failureDeleteUser;
}

class SignUpState {
  final SignUpStatus state;
  final UserModel? userModel;
  final String? erorrMessage;
  final bool isVisiblePassword;
  final bool isVisiblePasswordConfirm;
  SignUpState({
    required this.state,
    this.userModel,
    this.erorrMessage,
    this.isVisiblePassword = true,
    this.isVisiblePasswordConfirm = true,
  });

  SignUpState copyWith({
    SignUpStatus? state,
    UserModel? userModel,
    String? erorrMessage,
    bool? isVisiblePassword,
    bool? isVisiblePasswordConfirm,
  }) {
    return SignUpState(
      state: state ?? this.state,
      userModel: userModel ?? this.userModel,
      erorrMessage: erorrMessage ?? this.erorrMessage,
      isVisiblePassword: isVisiblePassword ?? this.isVisiblePassword,
      isVisiblePasswordConfirm:
          isVisiblePasswordConfirm ?? this.isVisiblePasswordConfirm,
    );
  }

  @override
  String toString() =>
      'SignInState(state: $state, userModel: $userModel, erorrMessage: $erorrMessage isVisiblePassword: $isVisiblePassword isVisiblePasswordConfirm: $isVisiblePasswordConfirm)';

  @override
  bool operator ==(covariant SignUpState other) {
    if (identical(this, other)) return true;

    return other.state == state &&
        other.userModel == userModel &&
        other.erorrMessage == erorrMessage &&
        other.isVisiblePassword == isVisiblePassword &&
        other.isVisiblePasswordConfirm == isVisiblePasswordConfirm;
  }

  @override
  int get hashCode =>
      state.hashCode ^
      userModel.hashCode ^
      erorrMessage.hashCode ^
      isVisiblePassword.hashCode ^
      isVisiblePasswordConfirm.hashCode;
}

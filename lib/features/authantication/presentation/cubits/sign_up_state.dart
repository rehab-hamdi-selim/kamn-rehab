// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kamn/features/authantication/data/model/auth_user_model.dart';
enum SignUpStatus { initial, loading, success, failure, VisiblePassword,VisiblePasswordConfirm }

extension SignInStateExtension on SignUpState {
  bool get isInitial => state == SignUpStatus.initial;
  bool get isLoading => state == SignUpStatus.loading;
  bool get isSuccess => state == SignUpStatus.success;
  bool get isFailure => state == SignUpStatus.failure;
  bool get isVisiblePassword => state == SignUpStatus.VisiblePassword;
  bool get isVisiblePasswordConfirm => state == SignUpStatus.VisiblePasswordConfirm;

}

class SignUpState {
  final SignUpStatus state;
  final AuthUserModel? userModel;
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
    AuthUserModel? userModel,
    String? erorrMessage,
    bool? isVisiblePassword,
    bool? isVisiblePasswordConfirm,
  }) {
    return SignUpState(
      state: state ?? this.state,
      userModel: userModel ?? this.userModel,
      erorrMessage: erorrMessage ?? this.erorrMessage,
      isVisiblePassword: isVisiblePassword?? this.isVisiblePassword,
      isVisiblePasswordConfirm: isVisiblePasswordConfirm?? this.isVisiblePasswordConfirm,
    );
  }

  @override
  String toString() =>
      'SignInState(state: $state, userModel: $userModel, erorrMessage: $erorrMessage isVisiblePassword: $isVisiblePassword isVisiblePasswordConfirm: $isVisiblePasswordConfirm)';

  @override
  bool operator ==(covariant SignUpState other) {
    if (identical(this, other)) return true;

    return other.state == state &&
        other.userModel== userModel &&
        other.erorrMessage == erorrMessage
        && other.isVisiblePassword == isVisiblePassword &&
        other.isVisiblePasswordConfirm == isVisiblePasswordConfirm;
  }

  @override
  int get hashCode =>
      state.hashCode ^ userModel.hashCode ^ erorrMessage.hashCode^ isVisiblePassword.hashCode ^ isVisiblePasswordConfirm.hashCode;
}

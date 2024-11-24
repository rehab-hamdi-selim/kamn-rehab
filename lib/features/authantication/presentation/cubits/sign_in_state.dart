// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kamn/features/authantication/data/model/auth_user_model.dart';
enum SignInStatus { initial, 
loading, success, failure,visible,successGetData,failureGetData }

extension SignInStateExtension on SignInState {
  bool get isInitial => state == SignInStatus.initial;
  bool get isLoading => state == SignInStatus.loading;
  bool get isSuccess => state == SignInStatus.success;
  bool get isFailure => state == SignInStatus.failure;
  bool get isVisible => state == SignInStatus.visible;
  bool get isSuccessGetData => state == SignInStatus.successGetData;
  bool get isFailureGetData => state == SignInStatus.failureGetData;
}

class SignInState {
  final SignInStatus state;
  final AuthUserModel? userModel;
  final String? erorrMessage;
  final String? uid;
  final bool isVisible;
  SignInState( {
    required this.state,
    this.userModel,
    this.erorrMessage,
    this.uid,
    this.isVisible = true,
  });

  SignInState copyWith({
    SignInStatus? state,
    AuthUserModel? userModel,
    String? erorrMessage,
    bool? isVisible,
    String? uid,
  }) {
    return SignInState(
      state: state ?? this.state,
      userModel: userModel ?? this.userModel,
      erorrMessage: erorrMessage ?? this.erorrMessage,
      isVisible: isVisible?? this.isVisible,
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
        other.userModel== userModel &&
        other.erorrMessage == erorrMessage
        && other.isVisible == isVisible
        && other.uid == uid;
  }

  @override
  int get hashCode =>
      state.hashCode ^ userModel.hashCode ^ erorrMessage.hashCode^ isVisible.hashCode ^ uid.hashCode;
}

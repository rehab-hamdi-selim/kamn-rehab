import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/authentication/presentation/cubits/sign_up_cubit/sign_up_state.dart';
import '../../../../../core/common/entities/user_model.dart';
import '../../../data/repositories/auth_repository.dart';
import 'sign_up_view_model.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;
  final SignUpViewModel signUpViewModel;
  SignUpCubit(
      {required AuthRepository authRepository, required this.signUpViewModel})
      : _authRepository = authRepository,
        super(SignUpState(state: SignUpStatus.initial));
  //init getPlaygrounds_from_firebase branch

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String type,
  }) async {
    emit(state.copyWith(state: SignUpStatus.loading));

    final result = await _authRepository.signUp(
        email: email, password: password, name: name, type: type);

    result.fold(
      (l) => emit(state.copyWith(
        state: SignUpStatus.failure,
        erorrMessage: l.erorr,
      )),
      (r) => emit(state.copyWith(
        state: SignUpStatus.success,
        userModel: r,
        erorrMessage:
            'Account created! Please check your email to verify your account before signing in.',
      )),
    );
  }

  Future<void> setData({required UserModel userModel}) async {
    final result = await _authRepository.setUser(userModel: userModel);
    result.fold((l) {
      emit(state.copyWith(
        state: SignUpStatus.failureSaveData,
        erorrMessage: l.erorr,
      ));
    },
        (r) => emit(state.copyWith(
              state: SignUpStatus.successSaveData,
            )));
  }

  Future<void> deleteUser({required String uid}) async {
    final result = await _authRepository.deleteUser(uid: uid);
    result.fold(
        (l) => emit(state.copyWith(
              state: SignUpStatus.failureDeleteUser,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(
              state: SignUpStatus.successDeleteUser,
            )));
  }

  Future<void> signOut() async {
    final result = await _authRepository.signOut();
    result.fold(
        (l) => emit(state.copyWith(
              state: SignUpStatus.failureSignOut,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(
              state: SignUpStatus.successSignOut,
            )));
  }

  changeVisiblePassword() {
    emit(state.copyWith(
        state: SignUpStatus.visiblePassword,
        isVisiblePassword: !state.isVisiblePassword));
  }

  changeVisibleConfirmPassword() {
    emit(state.copyWith(
        state: SignUpStatus.visiblePasswordConfirm,
        isVisiblePasswordConfirm: !state.isVisiblePasswordConfirm));
  }

  void check(bool value) {
    emit(state.copyWith(
        state: SignUpStatus.checked, isChecked: !state.isChecked));
  }

  Future<void> sendVerificationEmail() async {
    await _authRepository.sendVerificationEmail();
  }

  @override
  Future<void> close() {
    signUpViewModel.dispose();
    return super.close();
  }
}

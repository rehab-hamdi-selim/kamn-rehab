import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/authentication/presentation/cubits/sign_in_cubit/sign_in_view_model.dart';
import '../../../../../core/common/entities/user_model.dart';
import '../../../data/repositories/auth_repository.dart';
import 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInViewModel signInViewModel;
  final AuthRepository _authRepository;
  SignInCubit(
      {required AuthRepository authRepository,
      required this.signInViewModel})
      : _authRepository = authRepository,
        super(SignInState(state: SignInStatus.initial));
  //init getPlaygrounds_from_firebase branch

  Future<void> signIn() async {
    emit(state.copyWith(state: SignInStatus.loading));
    final result = await _authRepository.signIn(
        email: state.email!, password: state.password!);
    result.fold(
        (l) => emit(state.copyWith(
              state: SignInStatus.failure,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(
              state: SignInStatus.successSignIn,
              uid: r,
            )));
  }

  Future<void> getUser({required String uid}) async {
    final result = await _authRepository.getUser(uid: uid);
    result.fold(
        (l) => emit(state.copyWith(
              state: SignInStatus.failureGetData,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(
              state: SignInStatus.successGetData,
              userModel: r,
            )));
  }

  // Save user data securely

  Future<void> signOut() async {
    final res = await _authRepository.signOut();
    res.fold(
        (l) => emit(state.copyWith(
              state: SignInStatus.failure,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(state: SignInStatus.successSignOut)));
  }

  // Sign out and clear secure storage

  changeVisiblePassword() {
    emit(state.copyWith(
        state: SignInStatus.visible, isVisible: !state.isVisible));
  }

  Future<void> googleAuth() async {
    emit(state.copyWith(
      state: SignInStatus.googleAuthLoading,
    ));
    final result = await _authRepository.googleAuth();
    result.fold((error) {
      emit(state.copyWith(
          state: SignInStatus.googleAuthFailure,
          erorrMessage: state.erorrMessage));
    }, (userData) {
      emit(SignInState(
          state: SignInStatus.googleAuthSuccess, userModel: userData));
    });
  }

  Future<void> googleSignOut() async {
    final res = await _authRepository.googleSignOut();
    res.fold(
        (l) => emit(state.copyWith(
              state: SignInStatus.failure,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(state: SignInStatus.successSignOut)));
  }

  Future<void> setUserData({required UserModel userModel}) async {
    emit(state.copyWith(
      state: SignInStatus.setUserDataLoading,
    ));
    final result = await _authRepository.setUser(userModel: userModel);
    result.fold(
        (l) => emit(state.copyWith(
              state: SignInStatus.setUserDataFailure,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(
              state: SignInStatus.setUserDataSuccess,
            )));
  }

  Future<void> checkUesrSignin(
      {required String email, required String password}) async {
    final result = await _authRepository.checkUesrSignin();
    result.fold((error) {
      emit(state.copyWith(
          state: SignInStatus.isAlreadySignIn,
          email: email,
          password: password,
          erorrMessage: state.erorrMessage));
    }, (userData) {
      if (userData) {
        emit(state.copyWith(
            state: SignInStatus.isAlreadySignIn,
            email: email,
            password: password));
      } else {
        emit(state.copyWith(
            state: SignInStatus.isNotSignIn, email: email, password: password));
      }
    });
  }
}

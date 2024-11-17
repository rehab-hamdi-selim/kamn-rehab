import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/auth_user_model.dart';
import '../../data/repositories/sign_in_repository.dart';
import 'sign_in_state.dart';


@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInRepository _signInRepository;
  SignInCubit({required SignInRepository signInRepository})
      : _signInRepository = signInRepository,
        super(SignInState(state: SignInStatus.initial));
  //init getPlaygrounds_from_firebase branch

  Future<void> signIn({required String email, required String password}) async {
    final result = await _signInRepository.signIn(email: email, password: password);
    result.fold(
        (l) => emit(state.copyWith(
              state: SignInStatus.failure,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(
              state: SignInStatus.success,
              userModel: r as AuthUserModel,

            )));
  }

  changeVisiblePassword(){
    emit(state.copyWith(
      state: SignInStatus.visible,
      isVisible:!state.isVisible));
  }
}
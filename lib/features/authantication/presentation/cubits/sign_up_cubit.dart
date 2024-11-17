import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/authantication/presentation/cubits/sign_up_state.dart';
import '../../data/model/auth_user_model.dart';
import '../../data/repositories/sign_up_repository.dart';
import 'sign_in_state.dart';


@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository _signUpRepository;
  SignUpCubit({required SignUpRepository signUpRepository})
      : _signUpRepository = signUpRepository,
        super(SignUpState(state: SignUpStatus.initial));
  //init getPlaygrounds_from_firebase branch

  Future<void> signUp({required String email, required String password,required String name}) async {
    final result = await _signUpRepository.signUp(email: email, password: password,name: name);
    result.fold(
        (l) => emit(state.copyWith(
              state: SignUpStatus.failure,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(
              state: SignUpStatus.success,
              userModel: r as AuthUserModel,

            )));         
  }
    changeVisiblePassword(){
    emit(state.copyWith(state: SignUpStatus.VisiblePassword,isVisiblePassword:!state.isVisiblePassword));
  }
  changeVisibleConfirmPassword(){
    emit(state.copyWith(state:SignUpStatus.VisiblePasswordConfirm, isVisiblePasswordConfirm:!state.isVisiblePasswordConfirm));
  }

}
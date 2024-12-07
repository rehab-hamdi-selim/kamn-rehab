import 'package:bloc/bloc.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';

import '../../../helpers/secure_storage_helper.dart';
import '../../entities/user_model.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserState(state: AppUserStates.Initial));

  void saveUserData(UserModel? user) async {
    if (user != null) {
      final res = await SecureStorageHelper.saveUserData(user);
      res.fold(
          (l) => emit(state.copyWith(
                state: AppUserStates.Failure,
                errorMessage: l,
              )),
          (r) => emit(
              state.copyWith(state: AppUserStates.IsLoggedIn, user: user)));
    }
  }

  Future<void> signOut() async {
    final res = await SecureStorageHelper.removeUserData();
    res.fold(
        (l) => emit(state.copyWith(
              state: AppUserStates.Failure,
              errorMessage: 'Failed to sign out',
            )),
        (r) => emit(state.copyWith(state: AppUserStates.IsNotLoggedIn)));
  }

  // Check if user is logged in
  void isUserLoggedIn() async {
    final res = await SecureStorageHelper.isUserLoggedIn();
    res.fold(
        (l) => emit(state.copyWith(
              state: AppUserStates.Failure,
              errorMessage: l,
            )),
        (r) => emit(state.copyWith(state: AppUserStates.IsLoggedIn)));
  }

  // Get stored user data
  void getStoredUserData() async {
    final res = await SecureStorageHelper.getUserData();
    res.fold(
        (l) => emit(state.copyWith(
              state: AppUserStates.Failure,
              errorMessage: l,
            )),
        (r) => emit(state.copyWith(state: AppUserStates.IsLoggedIn, user: r)));
  }
}

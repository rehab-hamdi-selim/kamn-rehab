// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import '../../../../healthy_food_features/data/models/test_meal_model.dart';
import '../../entities/meal_cart_model.dart';
import '../../entities/user_model.dart';

enum AppUserStates {
  initial,
  failure,
  notLoggedIn,
  loggedIn,
  signOut,
  installed,
  notInstalled,
  success,
  gettedData,
  failureSaveData,
  clearUserData,
  loading,
  updated
}

enum AppUserCartStates {
  initial,
  failure,
  success,
  loading,
}

extension AppUserStateExtension on AppUserState {
  bool isInitial() => state == AppUserStates.initial;
  bool isLoggedIn() => state == AppUserStates.loggedIn;
  bool isNotLoggedIn() => state == AppUserStates.notLoggedIn;
  bool isFailure() => state == AppUserStates.failure;
  bool isSignOut() => state == AppUserStates.signOut;
  bool isInstalled() => state == AppUserStates.installed;
  bool isNotInstalled() => state == AppUserStates.notInstalled;
  bool isSuccess() => state == AppUserStates.success;
  bool isGettedData() => state == AppUserStates.gettedData;
  bool isFailureSaveData() => state == AppUserStates.failureSaveData;
  bool isClearUserData() => state == AppUserStates.clearUserData;
  bool isLoading() => state == AppUserStates.loading;
  bool isUpdated() => state == AppUserStates.updated;
}

extension AppUserCartStateExtension on AppUserState {
  bool isInitialCart() => cartState == AppUserCartStates.initial;
  bool isFailureCart() => cartState == AppUserCartStates.failure;
  bool isSuccessCart() => cartState == AppUserCartStates.success;
  bool isLoadingCart() => cartState == AppUserCartStates.loading;
}

class AppUserState extends Equatable {
  final AppUserStates state;
  final UserModel? user;
  final String? userIntialRoute;
  final String? errorMessage;
  final int currentMealQuantity;
  final List<MealCartModel> cartView;
  final List<TestMealModel> cart;
  final AppUserCartStates cartState;

  const AppUserState({
    this.state = AppUserStates.initial,
    this.user,
    this.userIntialRoute,
    this.errorMessage,
    this.cart = const [],
    this.cartView = const [],
    this.currentMealQuantity = 0,
    this.cartState = AppUserCartStates.initial,
  });

  AppUserState copyWith({
    AppUserStates? state,
    UserModel? user,
    String? errorMessage,
    String? userIntialRoute,
    List<TestMealModel>? cart,
    List<MealCartModel>? cartView,
    int? currentMealQuantity,
    AppUserCartStates? cartState,
  }) {
    return AppUserState(
      state: state ?? this.state,
      user: user ?? this.user,
      errorMessage: errorMessage,
      userIntialRoute: userIntialRoute ?? this.userIntialRoute,
      cart: cart ?? this.cart,
      cartView: cartView ?? this.cartView,
      currentMealQuantity: currentMealQuantity ?? this.currentMealQuantity,
      cartState: cartState ?? this.cartState,
    );
  }

  @override
  List<Object?> get props => [
        state,
        user,
        errorMessage,
        cart,
        currentMealQuantity,
        cartView,
        cartState
      ];

  @override
  String toString() =>
      'AppUserState(state: $state, user: $user, errorMessage: $errorMessage, cart: $cart, currentMealQuantity: $currentMealQuantity, cartView: $cartView, cartState: $cartState)';

  @override
  bool operator ==(covariant AppUserState other) {
    if (identical(this, other)) return true;

    return other.state == state &&
        other.user == user &&
        other.errorMessage == errorMessage &&
        other.cart == cart &&
        other.currentMealQuantity == currentMealQuantity &&
        other.cartView == cartView &&
        other.cartState == cartState;
  }

  @override
  int get hashCode =>
      state.hashCode ^
      user.hashCode ^
      errorMessage.hashCode ^
      cart.hashCode ^
      currentMealQuantity.hashCode ^
      cartView.hashCode ^
      cartState.hashCode;
}

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';
import 'package:kamn/healthy_food_features/domain/repositories/user_cart_repository.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_my_cart/convert.dart';
import 'package:kamn/playground_feature/authentication/data/repositories/auth_repository.dart';

import '../../../helpers/secure_storage_helper.dart';
import '../../entities/meal_cart_model.dart';
import '../../entities/user_model.dart';

@injectable
class AppUserCubit extends Cubit<AppUserState> {
  AuthRepository authRepository;
  final UserCartRepository _userCartRepository;

  AppUserCubit({
    required this.authRepository,
    required UserCartRepository userCartRepository,
  })  : _userCartRepository = userCartRepository,
        super(const AppUserState(
          state: AppUserStates.initial,
        ));

  Future<void> saveUserData(
    UserModel? user,
  ) async {
    if (user != null) {
      final res = await SecureStorageHelper.saveUserData(user);
      res.fold((l) {
        emit(state.copyWith(
          state: AppUserStates.failureSaveData,
          errorMessage: l,
        ));
      }, (r) {
        emit(state.copyWith(
          state: AppUserStates.success,
          user: user,
        ));
      });
    }
  }

  Future<void> signOut() async {
    final res = await SecureStorageHelper.removeUserData();
    res.fold(
        (l) => emit(state.copyWith(
              state: AppUserStates.failure,
              errorMessage: 'Failed to sign out',
            )),
        (r) => emit(state.copyWith(
              state: AppUserStates.notLoggedIn,
              user: null,
            )));
  }

  Future<void> getUser({required String uid}) async {
    final result = await authRepository.getUser(uid: uid);
    result.fold(
        (l) => emit(state.copyWith(
              state: AppUserStates.failure,
              errorMessage: l.erorr,
              cart: state.user?.cartMeals ?? [],
            )), (r) {
      emit(state.copyWith(
        state: AppUserStates.gettedData,
        user: r,
        cart: r.cartMeals,
      ));
      getCartWithQuantities();
    });
  }

  // Check if user is logged in
  void isUserLoggedIn() async {
    final res = await SecureStorageHelper.isUserLoggedIn();
    res.fold((l) {
      emit(state.copyWith(
        state: AppUserStates.notLoggedIn,
        errorMessage: l,
      ));
    }, (r) {
      emit(state.copyWith(
        state: AppUserStates.loggedIn,
        user: r,
        cart: r.cartMeals ?? [],
      ));
      getCartWithQuantities();
    });
  }

  // Get stored user data
  void getStoredUserData() async {
    final res = await SecureStorageHelper.getUserData();
    res.fold(
        (l) => emit(state.copyWith(
              state: AppUserStates.failure,
              errorMessage: l,
            )), (r) {
      emit(state.copyWith(
        state: AppUserStates.loggedIn,
        user: r,
        cart: r?.cartMeals ?? [],
      ));
      getCartWithQuantities();
    });
  }

  Future<void> signOutFromEmailandPassword() async {
    final res = await authRepository.signOut();
    res.fold(
        (l) => emit(state.copyWith(
              state: AppUserStates.failure,
              errorMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(state: AppUserStates.signOut)));
  }

  Future<void> signOutFromGoogle() async {
    final res = await authRepository.googleSignOut();
    res.fold(
        (l) => emit(state.copyWith(
              state: AppUserStates.failure,
              errorMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(state: AppUserStates.signOut)));
  }

  void isFirstInstallation() async {
    final res = await SecureStorageHelper.isFirstInstallation();
    res.fold((l) {
      emit(state.copyWith(
        state: AppUserStates.notInstalled,
        errorMessage: l,
      ));
    }, (r) {
      emit(state.copyWith(
        state: AppUserStates.installed,
      ));
    });
  }

  void saveInstallationFlag() async {
    final res = await SecureStorageHelper.saveInstalltionFlag();
    res.fold((l) {
      emit(state.copyWith(
        state: AppUserStates.failure,
        errorMessage: l,
      ));
    }, (r) {
      emit(state.copyWith(
        state: AppUserStates.installed,
      ));
    });
  }

  void clearUserData() async {
    final res = await SecureStorageHelper.removeUserData();
    res.fold((l) {
      emit(state.copyWith(
        state: AppUserStates.failure,
        errorMessage: l,
      ));
    }, (r) {
      emit(state.copyWith(
        state: AppUserStates.clearUserData,
        user: null,
      ));
    });
  }

  Future<void> updateUser(
      UserModel user, Map<String, dynamic> changedAttributes) async {
    emit(state.copyWith(
      state: AppUserStates.loading,
    ));
    final res = await authRepository.updateUser(user.uid, changedAttributes);
    res.fold((l) {
      emit(state.copyWith(
        state: AppUserStates.failure,
        errorMessage: l.erorr,
      ));
    }, (r) {
      emit(state.copyWith(
        state: AppUserStates.updated,
        user: user,
      ));
    });
  }

  bool isSpammer() {
    return state.user?.spamer ?? false;
  }

  // Cart methods
  Future<void> addToCart(TestMealModel meal) async {
    try {
      emit(state.copyWith(cartState: AppUserCartStates.loading));

      final updatedCart = List<TestMealModel>.from(state.cart)..add(meal);
      await _userCartRepository.updateCart(updatedCart, state.user?.uid ?? '');

      // Update cart view immediately after adding
      _updateCartView(updatedCart);
      getMealQuantity(meal.id);
      emit(state.copyWith(
        cartState: AppUserCartStates.success,
        cart: updatedCart,
        currentMealQuantity: state.currentMealQuantity + 1,
      ));
    } catch (e) {
      emit(state.copyWith(
        cartState: AppUserCartStates.failure,
        errorMessage: 'Failed to add item to cart',
      ));
    }
  }

  double getCartTotalFromState() {
    return _userCartRepository.getCartTotal(state.cartView);
  }

  Future<void> removeFromCart(TestMealModel meal) async {
    try {
      emit(state.copyWith(cartState: AppUserCartStates.loading));

      // Find the first occurrence of the meal with the matching ID
      final updatedCart = List<TestMealModel>.from(state.cart);
      final index = updatedCart.indexWhere((item) => item.id == meal.id);

      if (index != -1) {
        // Remove only the first occurrence
        updatedCart.removeAt(index);

        await _userCartRepository.updateCart(
            updatedCart, state.user?.uid ?? '');

        // Update cart view immediately after removing
        _updateCartView(updatedCart);
        getMealQuantity(meal.id);
        emit(state.copyWith(
          cartState: AppUserCartStates.success,
          cart: updatedCart,
          currentMealQuantity: state.currentMealQuantity - 1,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        cartState: AppUserCartStates.failure,
        errorMessage: 'Failed to remove item from cart',
      ));
    }
  }

  void increaseQuantity(String mealId) {
    final updatedCart = state.cartView.map((item) {
      if (item.id == mealId) {
        return item.copyWith(
            quantity: item.quantity + 1); // زيادة الكمية بمقدار 1
      }
      return item;
    }).toList();

    // استخدام الدالة لتحويل TestMealModel إلى MealCartModel
    final mealCartModels =
        updatedCart.map((meal) => convertToMealCartModel(meal)).toList();

    emit(state.copyWith(
      cartView: mealCartModels, // استخدم قائمة MealCartModel هنا
    ));
  }

  void decreaseQuantity(String mealId) {
    final updatedCart = state.cartView.map((item) {
      if (item.id == mealId && item.quantity > 1) {
        return item.copyWith(
            quantity: item.quantity - 1); // تقليل الكمية بمقدار 1
      }
      return item;
    }).toList();

    // استخدام الدالة لتحويل TestMealModel إلى MealCartModel
    final mealCartModels =
        updatedCart.map((meal) => convertToMealCartModel(meal)).toList();

    emit(state.copyWith(
      cartView: mealCartModels, // استخدم قائمة MealCartModel هنا
    ));
  }

  void _updateCartView(List<TestMealModel> cart) {
    if (cart.isEmpty) {
      emit(state.copyWith(cartView: []));
      return;
    }

    // Group meals by ID and count quantities
    final Map<String, int> quantityMap = {};
    final Map<String, TestMealModel> mealMap = {};

    // First pass: count quantities and store unique meals
    for (var meal in cart) {
      if (quantityMap.containsKey(meal.id)) {
        quantityMap[meal.id] = quantityMap[meal.id]! + 1;
      } else {
        quantityMap[meal.id] = 1;
        mealMap[meal.id] = meal;
      }
    }

    // Second pass: create MealCartModel objects with correct quantities
    List<MealCartModel> result = [];
    mealMap.forEach((id, meal) {
      result.add(
        MealCartModel(
          quantity: quantityMap[id]!,
          id: meal.id,
          name: meal.name,
          type: meal.type,
          prepTime: meal.prepTime,
          calories: meal.calories,
          price: meal.price,
          specialtyTags: meal.specialtyTags,
          ingredients: meal.ingredients,
          details: meal.details,
          imageUrls: meal.imageUrls,
        ),
      );
    });

    emit(state.copyWith(cartView: result));
  }

  void getMealQuantity(String mealId) {
    if (state.cart.isEmpty) return;

    // Count how many times the meal with the specific ID appears in the cart
    int quantity = 0;
    for (var meal in state.cart) {
      if (meal.id == mealId) {
        quantity++;
      }
    }

    emit(state.copyWith(cart: state.user?.cartMeals ?? []));

    emit(state.copyWith(currentMealQuantity: quantity));
  }

  void getCartWithQuantities() {
    if (state.cart.isEmpty) {
      emit(state.copyWith(cartView: [], currentMealQuantity: 0));
      return;
    }

    // Group meals by ID and count quantities
    final Map<String, int> quantityMap = {};
    final Map<String, TestMealModel> mealMap = {};
    int totalQuantity = 0;

    // First pass: count quantities and store unique meals
    for (var meal in state.cart) {
      if (quantityMap.containsKey(meal.id)) {
        quantityMap[meal.id] = quantityMap[meal.id]! + 1;
      } else {
        quantityMap[meal.id] = 1;
        mealMap[meal.id] = meal;
      }
      totalQuantity++;
    }

    // Second pass: create MealCartModel objects with correct quantities
    List<MealCartModel> result = [];
    mealMap.forEach((id, meal) {
      result.add(
        MealCartModel(
          quantity: quantityMap[id]!,
          id: meal.id,
          name: meal.name,
          type: meal.type,
          prepTime: meal.prepTime,
          calories: meal.calories,
          price: meal.price,
          specialtyTags: meal.specialtyTags,
          ingredients: meal.ingredients,
          details: meal.details,
          imageUrls: meal.imageUrls,
        ),
      );
    });

    // Make sure we're setting the correct meal quantity for the current view
    int currentMealQuantity = 0;
    if (state.user != null) {
      // If we have a specific meal ID being viewed, get its quantity
      String? currentMealId = state.cart.isNotEmpty ? state.cart.last.id : null;
      if (currentMealId != null && quantityMap.containsKey(currentMealId)) {
        currentMealQuantity = quantityMap[currentMealId]!;
      }
    }

    emit(state.copyWith(
      cartView: result,
      currentMealQuantity:
          currentMealQuantity > 0 ? currentMealQuantity : totalQuantity,
      state: AppUserStates.success,
    ));
  }

  Future<void> clearCart() async {
    try {
      emit(state.copyWith(cartState: AppUserCartStates.loading));

      await _userCartRepository.clearCart();

      emit(state.copyWith(
        cartState: AppUserCartStates.success,
        cart: [],
        currentMealQuantity: 0,
      ));
    } catch (e) {
      emit(state.copyWith(
        cartState: AppUserCartStates.failure,
        errorMessage: 'Failed to clear cart',
      ));
    }
  }

  Future<void> getCart() async {
    try {
      emit(state.copyWith(cartState: AppUserCartStates.loading));

      final cart = await _userCartRepository.getCart();

      emit(state.copyWith(
        cartState: AppUserCartStates.success,
        cart: cart,
        currentMealQuantity: cart.length,
      ));
    } catch (e) {
      emit(state.copyWith(
        cartState: AppUserCartStates.failure,
        errorMessage: 'Failed to get cart items',
      ));
    }
  }
}

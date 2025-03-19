// import 'package:bloc/bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:kamn/playground_feature/sports/domain/usecase/get item_from_firebase_usecase.dart';
// import 'package:kamn/playground_feature/sports/presentation/cubits/select_category_cubit/select_category_state.dart';
// @injectable
// class SelectCategoryCubit extends Cubit<SelectCategoryState>{
//   SelectCategoryCubit({required this.getPlaygrouundsUseCase}) : super(SelectCategoryState(state: SelectCategoryStatus.initial));
//   final  GetPlaygroundsAndFlittered getPlaygrouundsUseCase;
//   Future<void> getPlaygrounds() async {
//     emit(state.copyWith(state: SelectCategoryStatus.loading));
//     final result = await getPlaygrouundsUseCase.invoke();
//     result.fold((error) {
//       emit(state.copyWith(
//         state: SelectCategoryStatus.error,
//         error: error.erorr,
//       ));
//     }, (success) {
//       emit(state.copyWith(
//           state: SelectCategoryStatus.success, playgroundsMap: success));
//     });
//   }
//
// }

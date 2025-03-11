// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:kamn/playground_feature/sports/data/models/meals_model.dart';
//
// enum SelectCategoryStatus{
//   initial,
//   loading,
//   success,
//   error
// }
//
// extension SelectCategoryStateExtension on SelectCategoryState{
//   bool get isInitial => state == SelectCategoryStatus.initial;
//   bool get isLoading => state == SelectCategoryStatus.loading;
//   bool get isSuccess => state == SelectCategoryStatus.success;
//   bool get isError => state == SelectCategoryStatus.error;
// }
// class SelectCategoryState {
//   final SelectCategoryStatus state;
//   final String? error;
//     final Map<String, List<PlaygroundModel>>? playgroundsMap;
//
//   SelectCategoryState({
//     required this.state,
//     this.error,
//     this.playgroundsMap,
//   });
//
//   SelectCategoryState copyWith({
//     SelectCategoryStatus? state,
//     String? error,
//     Map<String, List<PlaygroundModel>>? playgroundsMap,
//   }) {
//     return SelectCategoryState(
//       state: state ?? this.state,
//       error: error ?? this.error,
//       playgroundsMap: playgroundsMap ?? this.playgroundsMap,
//     );
//   }
//
//   @override
//   String toString() => 'SelectCategoryState(state: $state, error: $error, playgroundsMap: $playgroundsMap)';
// }

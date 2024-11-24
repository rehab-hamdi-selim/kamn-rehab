import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/features/admin/data/repository/second_page_repository.dart';
import 'package:kamn/features/admin/presentation/cubits/second_page_cubit/second_page_state.dart';

class SecondPageCubit extends Cubit<SecondPageState> {
  SecondPageCubit({required this.repository})
      : super(SecondPageState(state: SecondPageStatus.intial));
  static SecondPageCubit get(context) => BlocProvider.of(context);

  final SecondPageRepository repository;

  Future<void> getChartData() async {
    emit(SecondPageState(state: SecondPageStatus.loading));
    var result = await repository.getSecondPageData();
    result.fold((error) {
      emit(SecondPageState(
          state: SecondPageStatus.failure, erorrMessage: error.toString()));
    }, (data) {
      emit(SecondPageState(
          state: SecondPageStatus.success,
          data: repository.getChartData(data)));
    });
  }
}

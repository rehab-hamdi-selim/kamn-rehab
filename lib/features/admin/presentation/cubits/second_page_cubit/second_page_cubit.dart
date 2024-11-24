import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/admin/data/repository/second_page_repository.dart';
import 'package:kamn/features/admin/domain/use_case/second_page_use_case.dart';
import 'package:kamn/features/admin/presentation/cubits/second_page_cubit/second_page_state.dart';

@injectable
class SecondPageCubit extends Cubit<SecondPageState> {
  SecondPageCubit({required this.repository, required this.dataFilter})
      : super(SecondPageState(state: SecondPageStatus.intial));
  static SecondPageCubit get(context) => BlocProvider.of(context);

  final SecondPageRepository repository;
  final SecondPageUseCase dataFilter;

  Future<void> getChartData() async {
    emit(SecondPageState(state: SecondPageStatus.loading));
    var result = await repository.getSecondPageData();
    result.fold((error) {
      emit(SecondPageState(
          state: SecondPageStatus.failure, erorrMessage: error.toString()));
    }, (data) {
      emit(SecondPageState(
          state: SecondPageStatus.success,
          data: dataFilter.getChartData(data)));
    });
  }
}

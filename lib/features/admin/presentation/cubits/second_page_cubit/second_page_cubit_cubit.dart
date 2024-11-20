import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/features/admin/data/repository/second_page_repository.dart';
import 'package:kamn/features/admin/presentation/cubits/second_page_cubit/second_page_cubit_state.dart';

class SecondPageCubitCubit extends Cubit<SecondPageCubitState> {
  SecondPageCubitCubit({required this.repository})
      : super(SecondPageCubitInitial());
  static get(context) => BlocProvider.of(context);

  final SecondPageRepository repository;

  Future<void> getChartData() async {
    var result = await repository.getSecondPageData();
    result.fold((error) {
      emit(GetChartDataError(error: error.toString()));
    }, (data) {
      emit(GetChartDataSuccess(analyticsModel: data));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/features/admin/data/models/chart_data_model.dart';
import 'package:kamn/features/admin/data/repository/second_page_repository.dart';
import 'package:kamn/features/admin/presentation/cubits/second_page_cubit/second_page_state.dart';

class SecondPageCubit extends Cubit<SecondPageState> {
  SecondPageCubit({required this.repository}) : super(SecondPageCubitInitial());
  static SecondPageCubit get(context) => BlocProvider.of(context);

  final SecondPageRepository repository;

  late final ChartDataModel chartDataModel;
  Future<void> getChartData() async {
    emit(GetChartDataLoading());
    var result = await repository.getSecondPageData();
    result.fold((error) {
      emit(GetChartDataError(error: error.toString()));
    }, (data) {
      chartDataModel = repository.getChartData(data);
      emit(GetChartDataSuccess());
    });
  }
}

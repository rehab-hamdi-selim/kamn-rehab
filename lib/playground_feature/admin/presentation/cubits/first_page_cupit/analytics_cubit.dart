import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/playground_feature/admin/data/repository/analytics_repository.dart';
import 'package:kamn/playground_feature/admin/presentation/cubits/first_page_cupit/analytics_state.dart';

@injectable
class AnalyticsCubit extends Cubit<AnalyticsState> {
  AnalyticsCubit({required this.repository})
      : super(AnalyticsState(state: AnalyticsStatus.initial)) {
    getAnalyticsData();
  }

  AnalyticsRepository repository;
  Future<void> getAnalyticsData() async {
    emit(AnalyticsState(state: AnalyticsStatus.loading));
    final result = await repository.getAnalyticsData();
    result.fold((error) {
      print(error.erorr);

      emit(AnalyticsState(
        state: AnalyticsStatus.failure,
        erorrMessage: error.erorr,
      ));
    }, (success) {
      emit(AnalyticsState(
        state: AnalyticsStatus.success,
        analyticsdata: success,
      ));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/sports_repository.dart';

part 'paggination_event.dart';
part 'paggination_state.dart';

class PagginationBloc extends Bloc<PagginationEvent, PagginationState> {
  final SportsRepository _repository;
  PagginationBloc({required SportsRepository repository})
      : _repository = repository,
        super(const PagginationState(status: PagginationStatus.initial)) {
    on<GetPlaygroundsEvent>(_onGetPlaygroundsWithFirstPagginationWayEvent);
    on<LoadMorePlaygroundsEvent>(
        _onLoadMorePlaygroundsWithFirstPagginationWayEvent,
        transformer: concurrent());
  }
  int _limit = 10;
  int _startAt = 0;

  //first way=================================================================================

  Future<void> _onGetPlaygroundsWithFirstPagginationWayEvent(
      GetPlaygroundsEvent event, Emitter<PagginationState> emit) async {
    emit(const PagginationState(status: PagginationStatus.loading));
    final result =
        await _repository.getPlaygroundsWithFirstPagginationWay(_limit);
    result.fold(
        (l) => emit(PagginationState(
            errorMessage: l.erorr, status: PagginationStatus.failure)), (r) {
      _limit = _limit + 10;
      emit(PagginationState(
          data: r["playgrounds"],
          hasReachedEnd: r["hasReachedEnd"],
          status: PagginationStatus.success));
    });
  }

  Future<void> _onLoadMorePlaygroundsWithFirstPagginationWayEvent(
      LoadMorePlaygroundsEvent event, Emitter<PagginationState> emit) async {
    emit(const PagginationState(status: PagginationStatus.loadMore));

    final result =
        await _repository.getPlaygroundsWithFirstPagginationWay(_limit);

    result.fold(
        (l) => emit(PagginationState(
            errorMessage: l.erorr, status: PagginationStatus.failure)), (r) {
      emit(PagginationState(
          data: r["playgrounds"],
          hasReachedEnd: r["hasReachedEnd"],
          status: PagginationStatus.success));
    });
  }

  //second way=================================================================================

  Future<void> _onGetPlaygroundsWithSecondPagginationWayEvent(
      GetPlaygroundsEvent event, Emitter<PagginationState> emit) async {
    emit(const PagginationState(status: PagginationStatus.loading));
    final result =
        await _repository.getPlaygroundsWithSecoundPagginationWay(null);
    result.fold(
        (l) => emit(PagginationState(
            errorMessage: l.erorr, status: PagginationStatus.failure)),
        (r) =>
            emit(PagginationState(data: r, status: PagginationStatus.success)));
  }

  Future<void> _onLoadMorePlaygroundsWithSecondPagginationWayEvent(
      LoadMorePlaygroundsEvent event, Emitter<PagginationState> emit) async {
    emit(const PagginationState(status: PagginationStatus.loadMore));
    final result =
        await _repository.getPlaygroundsWithSecoundPagginationWay(null);
    result.fold(
        (l) => emit(PagginationState(
            errorMessage: l.erorr, status: PagginationStatus.failure)),
        (r) =>
            emit(PagginationState(data: r, status: PagginationStatus.success)));
  }

  //third way=================================================================================

  Future<void> _onGetPlaygroundsWithThirdPagginationWayEvent(
      GetPlaygroundsEvent event, Emitter<PagginationState> emit) async {
    emit(const PagginationState(status: PagginationStatus.loading));
    final result =
        await _repository.getPlaygroundsWithThirdPagginationWay(_startAt);
    result.fold(
        (l) => emit(PagginationState(
            errorMessage: l.erorr, status: PagginationStatus.failure)), (r) {
      _startAt = _startAt + 10;
      emit(PagginationState(data: r, status: PagginationStatus.success));
    });
  }

  Future<void> _onLoadMorePlaygroundsWithThirdPagginationWayEvent(
      LoadMorePlaygroundsEvent event, Emitter<PagginationState> emit) async {
    emit(const PagginationState(status: PagginationStatus.loadMore));
    final result =
        await _repository.getPlaygroundsWithThirdPagginationWay(_startAt);
    result.fold(
        (l) => emit(PagginationState(
            errorMessage: l.erorr, status: PagginationStatus.failure)),
        (r) =>
            emit(PagginationState(data: r, status: PagginationStatus.success)));
  }
}

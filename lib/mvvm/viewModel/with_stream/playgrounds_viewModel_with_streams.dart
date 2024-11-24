import 'dart:async';
import 'package:kamn/mvvm/viewModel/with_stream/playgrounds_viewModel_state.dart';
import '../../model/playgrounds_data_source_mvvm.dart';

class PlaygroundsViewModelWithStreams {
  final GetGroundsDataSourceMVVM getGroundsDataSourceMVVM;
  GetGroundViewModelState _lastState = GetGroundViewModelState(
    status: GetGroundStatus.initial,
    playgrounds: [],
  );

  PlaygroundsViewModelWithStreams({required this.getGroundsDataSourceMVVM}) {
    _stateController.sink.add(_lastState);
    fetchPlaygroundsRequests();
  }

  final _stateController =
      StreamController<GetGroundViewModelState>.broadcast();
  Stream<GetGroundViewModelState> get state => _stateController.stream;

  Future<void> fetchPlaygroundsRequests() async {
    _emitState(
      GetGroundViewModelState(
        status: GetGroundStatus.loading,
        playgrounds: _lastState.playgrounds,
      ),
    );

    try {
      final playgrounds =
          await getGroundsDataSourceMVVM.getPlaygroundsRequests();
      _emitState(
        GetGroundViewModelState(
          status: GetGroundStatus.success,
          playgrounds: playgrounds,
        ),  
      );


     
    } catch (error) {
      _emitState(
        GetGroundViewModelState(
          status: GetGroundStatus.error,
          errorMessage: error.toString(),
          playgrounds: _lastState.playgrounds,
        ),
      );
    }
  }

  void _emitState(GetGroundViewModelState state) {
    if (!_stateController.isClosed) {
      _lastState = state;
      _stateController.sink.add(state);
    }
  }

  void dispose() {
    _stateController.close();
  }
}

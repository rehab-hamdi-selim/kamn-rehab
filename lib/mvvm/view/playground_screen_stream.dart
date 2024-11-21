import 'package:flutter/material.dart';

import '../../core/common/class/firestore_services.dart';
import '../model/playgrounds_data_source_mvvm.dart';
import '../viewModel/with_stream/playgrounds_viewModel_state.dart';
import '../viewModel/with_stream/playgrounds_viewModel_with_streams.dart';

class PlaygroundScreenStreamMVVM extends StatelessWidget {
  const PlaygroundScreenStreamMVVM({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = PlaygroundsViewModelWithStreams(
      getGroundsDataSourceMVVM: GetGroundsDataSourceMVVM(
        firestoreServices: FirestoreService(),
      ),
    );
    return Scaffold(
      body: StreamBuilder<GetGroundViewModelState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          final state = snapshot.data;

          if (state == null) {
            return const SizedBox();
          }

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.isError) {
            return Center(child: Text(state.errorMessage ?? 'Unknown error'));
          }

          if (state.playgrounds?.isEmpty ?? true) {
            return const Center(child: Text('No playgrounds found'));
          }

          return ListView.builder(
            itemCount: state.playgrounds!.length,
            itemBuilder: (context, index) {
              final playground = state.playgrounds![index];
              return ListTile(
                title: Text(playground.name),
                // Add more playground details...
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.fetchPlaygroundsRequests(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

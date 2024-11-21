import 'package:flutter/material.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/mvp/presenter/playgrounds_interface.dart';
import '../../core/common/class/firestore_services.dart';
import '../model/playgrounds_data_source_mvp.dart';
import '../presenter/playgrounds_presenter.dart';

class PlaygroundsScreenMVP extends StatefulWidget {
  const PlaygroundsScreenMVP({super.key});

  @override
  _PlaygroundsScreenStateMVP createState() => _PlaygroundsScreenStateMVP();
}

class _PlaygroundsScreenStateMVP extends State<PlaygroundsScreenMVP>
    implements PlaygroundsInterface {
  late PlaygroundsPresenter viewModel;
  bool isLoading = false;
  String? errorMessage = "";
  List<PlaygroundModel> playgrounds = [];

  @override
  void initState() {
    super.initState();
    viewModel = PlaygroundsPresenter(
        getGroundsDataSourceMVP:
            GetGroundsDataSourceMVP(firestoreServices: FirestoreService()),
        view: this);
    viewModel.getGrounds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playgrounds'),
      ),
      body: Builder(
        builder: (context) {
          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (errorMessage != "") {
            return Center(child: Text('حدث خطأ: $errorMessage'));
          }

          return ListView.builder(
            itemCount: playgrounds.length,
            itemBuilder: (context, index) {
              final playground = playgrounds[index];
              return ListTile(
                title: Text(playground.name), // مثال على اسم الملعب
                subtitle:
                    Text(playground.price.toString()), // مثال على موقع الملعب
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.getGrounds(),
        child: const Icon(Icons.refresh),
      ),
    );
  }

  @override
  void getGrounds({required List<PlaygroundModel> playgroundsModel}) {
    playgrounds = playgroundsModel;
  }

  @override
  void onError({required String error}) {
    errorMessage = error;
  }

  @override
  void onHideLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void onLoading() {
    setState(() {
      isLoading = true;
    });
  }
}

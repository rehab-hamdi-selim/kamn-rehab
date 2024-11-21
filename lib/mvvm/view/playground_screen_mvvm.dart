import 'package:flutter/material.dart';
import 'package:kamn/mvvm/model/playgrounds_data_source_mvvm.dart';
import '../../core/common/class/firestore_services.dart';
import '../viewModel/playgrounds_viewModel.dart';

class PlaygroundsScreenMVVM extends StatefulWidget {
  const PlaygroundsScreenMVVM({super.key});

  @override
  _PlaygroundsScreenStateMVVM createState() => _PlaygroundsScreenStateMVVM();
}

class _PlaygroundsScreenStateMVVM extends State<PlaygroundsScreenMVVM> {
  late PlaygroundsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = PlaygroundsViewModel(
        getGroundsDataSourceMVVM:
            GetGroundsDataSourceMVVM(firestoreServices: FirestoreService()));
    _loadData();
  }

  Future<void> _loadData() async {
    // viewModel.setLoading(true);
    setState(() {});
    await viewModel.fetchPlaygroundsRequests();
    setState(() {}); // إعادة بناء الواجهة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playgrounds'),
      ),
      body: Builder(
        builder: (context) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return Center(child: Text('حدث خطأ: ${viewModel.errorMessage}'));
          }

          return ListView.builder(
            itemCount: viewModel.playgrounds.length,
            itemBuilder: (context, index) {
              final playground = viewModel.playgrounds[index];
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
        onPressed: () => _loadData(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/mvc/controller/playgrounds_controller.dart';
import '../../../../core/helpers/spacer.dart';
import '../../features/sports/data/models/playground_model.dart';
import '../../init_dependencies.dart';

class PlayGroundsScreenMVC extends StatefulWidget {
  const PlayGroundsScreenMVC({
    super.key,
  });

  @override
  State<PlayGroundsScreenMVC> createState() => PlayGroundsScreenMVCState();
}

class PlayGroundsScreenMVCState extends State<PlayGroundsScreenMVC> {
  late GetGroundsControllerMVC controller;

  List<PlaygroundModel> playgrounds = [];

  Future<void> getPlaygroundsRequests() async {
    final result = await controller.getPlaygroundsRequests();
    setState(() {
      playgrounds = result;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = serviceLocator<GetGroundsControllerMVC>();
    getPlaygroundsRequests();
    print(playgrounds.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.red,
        child: ListView.separated(
            itemBuilder: (context, index) => Text(
                  playgrounds[index].name ?? '',
                  style: TextStyle(fontSize: 16.h, color: Colors.black),
                ),
            separatorBuilder: (context, index) => verticalSpace(17.89),
            itemCount: playgrounds.length),
      ),
    ));
  }
}

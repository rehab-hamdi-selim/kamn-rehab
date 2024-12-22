import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class YourRiveWidget extends StatefulWidget {
  const YourRiveWidget({super.key});

  @override
  _YourRiveWidgetState createState() => _YourRiveWidgetState();
}

class _YourRiveWidgetState extends State<YourRiveWidget> {
  late RiveAnimationController _controller;
  Artboard? _artboard;

  @override
  void initState() {
    super.initState();
    // Load your Rive file
    _loadRiveFile();
  }

  Future<void> _loadRiveFile() async {
    final data = await rootBundle.load('assets/your_animation.riv');
    final file = RiveFile.import(data);
    _artboard = file.mainArtboard;

    // Find the state machine controller
    final stateMachine = _artboard!.stateMachines.first;
    _controller = SimpleAnimation('idle'); // Set the initial animation

    // Set the state machine controller
    _artboard!.addController(_controller);
    setState(() {});
  }

  void _onHover(bool isHovered) {
    // Change the state based on hover
    if (isHovered) {
      _controller.isActive = false; // Stop the idle animation
      _controller = SimpleAnimation('un hover'); // Play unhover animation
    } else {
      _controller.isActive = false; // Stop the unhover animation
      _controller = SimpleAnimation('idel'); // Play idle animation
    }
    _artboard!.addController(_controller);
  }

  @override
  Widget build(BuildContext context) {
    if (_artboard == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Rive(
        artboard: _artboard!,
        fit: BoxFit.cover,
      ),
    );
  }
}

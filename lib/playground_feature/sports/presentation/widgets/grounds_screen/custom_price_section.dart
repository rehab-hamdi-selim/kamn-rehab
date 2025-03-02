import 'package:flutter/material.dart';
import 'package:kamn/core/theme/style.dart';

class CustomPriceSection extends StatefulWidget {
  const CustomPriceSection({super.key, required this.price});
  final String price;

  @override
  State<CustomPriceSection> createState() => _CustomPriceSectionState();
}

class _CustomPriceSectionState extends State<CustomPriceSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3200),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: double.parse(widget.price),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => RichText(
        text: TextSpan(
          text: '${_animation.value.toStringAsFixed(0)} LE',
          style: TextStyles.fontCircularSpotify16BlackRegular,
          children: [
            TextSpan(
              text: '/hr',
              style: TextStyles.fontCircularSpotify10BlackRegular,
            ),
          ],
        ),
      ),
    );
  }
}

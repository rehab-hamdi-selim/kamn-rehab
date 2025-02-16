import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/sports/data/models/playground_model.dart';

class CustomeBottomBook extends StatefulWidget {
  const CustomeBottomBook({required this.playgroundModel, super.key});

  final PlaygroundModel? playgroundModel;

  @override
  _CustomeBottomBookState createState() => _CustomeBottomBookState();
}

class _CustomeBottomBookState extends State<CustomeBottomBook>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Duration of the animation
      vsync: this,
    );

    // Tween to animate from 0 to the price
    _animation =
        Tween<double>(begin: 0, end: widget.playgroundModel?.price ?? 0)
            .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(65),
          color: AppPallete.greenColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Animated price display
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return RichText(
                    text: TextSpan(
                      text: _animation.value
                          .toStringAsFixed(2), // Format to 2 decimal places
                      style: TextStyles.font32OfWhiteMedium,
                      children: [
                        TextSpan(
                          text: ' / hr',
                          style: TextStyles.font20OfWhiteReuglar,
                        ),
                      ],
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.pickTimeReservationScreen,
                    arguments: widget.playgroundModel,
                  );
                },
                child: Text(
                  Constants.bookNow,
                  style: TextStyles.font16greenSemiBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

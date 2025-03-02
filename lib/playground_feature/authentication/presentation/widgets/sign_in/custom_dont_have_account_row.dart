import 'package:flutter/material.dart';
import '../../../../../core/theme/style.dart';

class CustomDontHaveAccountRow extends StatelessWidget {
  final VoidCallback onTap;

  const CustomDontHaveAccountRow({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyles.fontRoboto14LiteBlackRegular,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            'Sign Up',
            style: TextStyles.fontRoboto14LiteBlackRegular,
          ),
        ),
      ],
    );
  }
}

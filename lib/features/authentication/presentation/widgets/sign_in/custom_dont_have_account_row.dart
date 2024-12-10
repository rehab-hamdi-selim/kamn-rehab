import 'package:flutter/material.dart';
import '../../../../../core/routing/routes.dart';
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
          style: TextStyles.font14RobotoLightBlackColorRegular,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            'Sign Up',
            style: TextStyles.font14RobotoLightBlackColorMedium,
          ),
        ),
      ],
    );
  }
}

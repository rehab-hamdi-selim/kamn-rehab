import 'package:flutter/material.dart';
import 'package:kamn/core/theme/style.dart';

class CustomPricePaymentItem extends StatelessWidget {
  const CustomPricePaymentItem({
    super.key,
    required this.name,
    required this.value,
  });
  final String name;
  final String value;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Text(
        name,
        style: name == 'Bill to' || name == 'Invoice'
            ? TextStyles.fontRoboto14BlackRegular
            : TextStyles.fontRoboto14AccentBlackLight,
      ),
      minTileHeight: 0,
      trailing: Text(
        value,
        style: name == 'Bill to' || name == 'Invoice'
            ? TextStyles.fontRoboto14BlackRegular
            : TextStyles.fontRoboto14AccentBlackLight,
      ),
    );
  }
}

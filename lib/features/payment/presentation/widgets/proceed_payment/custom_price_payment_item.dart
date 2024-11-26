import 'package:flutter/material.dart';
import 'package:kamn/core/theme/style.dart';

class CustomPricePaymentItem extends StatelessWidget {
  const CustomPricePaymentItem(
      {super.key,
      required this.name,
      required this.value,
      required this.textStyle});
  final String name;
  final String value;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Text(
        name,
        style: textStyle,
      ),
      minTileHeight: 0,
      trailing: Text(
        value,
        style: textStyle,
      ),
    );
  }
}

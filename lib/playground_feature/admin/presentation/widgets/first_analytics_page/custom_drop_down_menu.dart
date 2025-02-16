import 'package:flutter/material.dart';

Widget dropDownMenu() {
  List<String> list = <String>['monthly', 'yearly'];
  return DropdownButton<String>(
    isDense: true,
    value: list.first,
    icon: const Icon(
      Icons.keyboard_arrow_down,
      size: 15,
    ),
    elevation: 10,
    style: const TextStyle(color: Colors.grey),
    underline: Container(
      height: 0,
    ),
    onChanged: (String? value) {},
    items: list.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}

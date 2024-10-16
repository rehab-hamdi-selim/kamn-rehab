import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';

class MenuItemCustome extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuItemCustome({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple, size: 24.sp),
      // Responsive icon size
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp), // Responsive font size
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey),
      // Responsive icon size
      onTap: () {
        // Handle the tap action here
      },
    );
  }
}

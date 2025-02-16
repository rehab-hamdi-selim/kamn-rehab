import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bottomNavBar() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20).r,
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black, spreadRadius: 100, blurRadius: 100),
        ]),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_outline),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: '',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/routing/routes.dart';

class CustomeAddServiceButton extends StatelessWidget {
  const CustomeAddServiceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.serviceSelection);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 60.w),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFA117F1), Color(0xFF2954E3)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(42)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline,
              color: Colors.white,
            ),
            Text(
              textAlign: TextAlign.center,
              'Add Service',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

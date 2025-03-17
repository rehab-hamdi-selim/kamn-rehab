import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoToServices extends StatelessWidget {
  const GoToServices({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1F1F1F), // Dark background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 20.h, vertical: 10.w), // More padding
        ),
        onPressed: () {
          // Action when button is pressed
        },
        child: const Text(
          'Go to services',
          style: TextStyle(
            color: Colors.white, // Higher contrast
            fontSize: 16, // Slightly larger for readability
            fontWeight: FontWeight.bold, // Stronger text appearance
          ),
        ),
      ),
    );
  }
}

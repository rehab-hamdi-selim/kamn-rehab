import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

customErorrScreen() {
  return ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.black87,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: Image.asset("assets/images/loginLogo.png"),
            ),
            if (kDebugMode)
              Text(
                details.exception.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            if (kReleaseMode)
              const Text(
                "Something went wrong",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              )
          ],
        ),
      ),
    );
  };
}

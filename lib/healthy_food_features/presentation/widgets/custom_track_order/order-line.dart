import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Order_line extends StatelessWidget {
  const Order_line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 350.h,
      child: Stack(
        children: [
          // المسار المرسوم (CustomPaint أو Placeholder)
          Positioned.fill(
            child: CustomPaint(
              painter: PathPainter(),
            ),
          ),

          // نقطة البداية
          Positioned(
            top: 50.h,
            left: 35.w,
            child: Container(
              width: 17.w,
              height: 17.h,
              decoration: BoxDecoration(
                color: Color(0xff8A49F7),
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xff8A49F7), width: 2.w),
              ),
              child: SvgPicture.asset('assets/icons/dot.svg'),
            ),
          ),

          // نقطة النهاية - ايقونة الموقع داخل دائرة سوداء
          Positioned(
            bottom: 10.h,
            right: 15.w,
            child: Container(
              width: 62.w,
              height: 62.h,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset('assets/icons/location_order.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// CustomPainter لرسم المسار باللون المتدرج
class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5.w
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(
        colors: [Color(0xffA95EFA), Color(0xff1D0024)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    path.moveTo(50, 60); // نقطة البداية
    path.lineTo(120, 100);
    path.lineTo(150, 160);
    path.lineTo(130, 230);
    path.lineTo(200, 300); // نقطة النهاية

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

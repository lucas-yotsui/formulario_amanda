import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0x4441B241);
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.35,
      size.height * 0.50,
      size.width * 0.60,
      size.height * 0.70,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.79,
      size.width,
      size.height * 0.80,
    );
    path.lineTo(
      size.width,
      size.height,
    );
    path.lineTo(
      0,
      size.height,
    );

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

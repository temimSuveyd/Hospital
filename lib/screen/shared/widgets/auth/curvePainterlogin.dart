import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hosptail/core/constant/color.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // تدرج لوني للمنحنى العلوي
    final topPaint = Paint()
      ..shader = LinearGradient(
        colors: [Appcolor.primarycolor, Appcolor.primarycolor.withOpacity(0.7)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Top Curve
    Path topPath = Path();
    topPath.lineTo(0, size.height * 0.1);
    topPath.quadraticBezierTo(
      size.width * 0.5, size.height * 0.25,
      size.width, size.height * 0.1,
    );
    topPath.lineTo(size.width, 0);
    topPath.close();
    canvas.drawPath(topPath, topPaint);

    // تدرج لوني للمنحنى السفلي
    final bottomPaint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.blue.shade400, Colors.blue.shade300],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ).createShader(Rect.fromLTWH(0, size.height * 0.8, size.width, size.height));

    // Bottom Curve
    Path bottomPath = Path();
    bottomPath.moveTo(0, size.height);
    bottomPath.lineTo(0, size.height * 0.95);
    bottomPath.quadraticBezierTo(
      size.width * 0.5, size.height * 0.85,
      size.width, size.height * 0.95,
    );
    bottomPath.lineTo(size.width, size.height);
    bottomPath.close();
    canvas.drawPath(bottomPath, bottomPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

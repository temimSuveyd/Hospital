import 'dart:ui';

import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final topPaint = Paint()..color = Colors.blue.shade300;

    // Top Curve
    Path topPath = Path();
    topPath.lineTo(0, size.height * 0.10);
    topPath.quadraticBezierTo(
      size.width * 0.5, size.height * 0.17,
      size.width, size.height * 0.10,
    );
    topPath.lineTo(size.width, 0);
    topPath.close();
    canvas.drawPath(topPath, topPaint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

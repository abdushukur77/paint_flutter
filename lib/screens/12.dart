import 'dart:math';

import 'package:flutter/material.dart';

class FlagScreen extends StatelessWidget {
  const FlagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('O\'zbekiston Bayrog\'i'),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(300, 159),
          painter: FlagPainter(),
        ),
      ),
    );
  }
}


class FlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double stripeHeight = size.height / 3;
    final Paint bluePaint = Paint()..color = Colors.blue;
    final Paint whitePaint = Paint()..color = Colors.white;
    final Paint greenPaint = Paint()..color = Colors.green;
    final Paint starPaint = Paint()..color = Colors.white;

    // Chiziq ko'k rang
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, stripeHeight), bluePaint);

    // O'rtadagi oq chiziq
    canvas.drawRect(Rect.fromLTWH(0, stripeHeight, size.width, stripeHeight), whitePaint);

    // Pastki yashil chiziq
    canvas.drawRect(Rect.fromLTWH(0, stripeHeight * 2, size.width, stripeHeight), greenPaint);

    // Yulduzlar va oy
    drawStarsAndCrescent(canvas, size, starPaint);
  }

  void drawStarsAndCrescent(Canvas canvas, Size size, Paint paint) {
    const double starSpacing = 20;
    const double starSize = 10;
    const double crescentRadius = 12;
    const Offset crescentCenter = Offset(24, 25);

    // Oy chizish
    canvas.drawCircle(crescentCenter, crescentRadius, paint);

    // Yulduzlar chizish
    for (int i = 0; i < 12; i++) {
      double x = crescentCenter.dx + crescentRadius * 3 + starSpacing * (i % 3);
      double y = crescentCenter.dy + starSpacing * (i ~/ 3);
      drawStar(canvas, Offset(x, y), starSize, paint);
    }
  }
  void drawStar(Canvas canvas, Offset center, double size, Paint paint) {
    final Path path = Path();
    for (int i = 0; i < 5; i++) {
      double angle = -pi / 2 + (2 * pi / 5) * i;
      double x = center.dx + size * cos(angle);
      double y = center.dy + size * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      angle += pi / 5;
      x = center.dx + size * cos(angle) / 2;
      y = center.dy + size * sin(angle) / 2;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

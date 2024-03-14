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
    final Paint redPaint = Paint()..color = Colors.red;
    final Paint whitePaint = Paint()..color = Colors.white;
    final Paint whitePaint1 = Paint()..color = Colors.white;
    final Paint greenPaint = Paint()..color = Colors.green;
    final Paint starPaint = Paint()..color = Colors.white;
    final getPaint = Paint()..color = Colors.white..strokeWidth=7..style=PaintingStyle.stroke;
    var getPaintt = Paint()..color = Colors.blue..strokeWidth=7..style=PaintingStyle.stroke;


    // Chiziq ko'k rang
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, stripeHeight), bluePaint);
    canvas.drawRect(Rect.fromLTWH(0, 50, size.width, size.height/53), redPaint);

    // O'rtadagi oq chiziq
    canvas.drawRect(Rect.fromLTWH(0, stripeHeight+3, size.width, stripeHeight), whitePaint);
    canvas.drawRect(Rect.fromLTWH(0, 109, size.width, size.height/53), redPaint);
    // Pastki yashil chiziq
    canvas.drawRect(Rect.fromLTWH(0, stripeHeight * 2+6, size.width, stripeHeight), greenPaint);
    final Paint paint = Paint();
    whitePaint1.style =PaintingStyle.stroke;
    whitePaint1.strokeCap =StrokeCap.round;

    whitePaint1.strokeWidth =size.width*0.02;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = size.width * 0.02;
    drawStarsAndCrescent(canvas, size, starPaint);




    canvas.drawArc(
        Offset(size.width / 15 + 10, (size.height / 3 - 39) / 2) & Size(40, 35),
        1.6,
        180 * (pi / 180),
        false,
        getPaint
          ..style = PaintingStyle.stroke
          ..strokeWidth = 7);
    canvas.drawArc(
        Offset(size.width / 15 + 17, (size.height / 3 - 39) / 2) & Size(30, 35),
        1.6,
        360 * (pi / 180),
        false,
        getPaintt
          ..style = PaintingStyle.stroke
          ..strokeWidth = 7);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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
void drawStarsAndCrescent(Canvas canvas, Size size, Paint paint) {
  const double starSpacing = 15;
  const double starSize = 4;
  const double crescentRadius = 25;
  const Offset crescentCenter = Offset(20, 5);


  // Yulduzlar chizish
  for (int i = 1; i < 4; i++) {
    for(int j=0; j<3; j++) {
      double x = crescentCenter.dx + crescentRadius * 3 + starSpacing * (j % 3);
      double y = crescentCenter.dy + starSpacing * (j ~/ 3);
      drawStar(canvas, Offset(x, y), starSize, paint);
    }
    for(int j=0; j<4; j++) {
      double x = crescentCenter.dx + crescentRadius * 2.4 + starSpacing * (j % 4);
      double y = crescentCenter.dy + starSpacing * (j ~/ 4)+20;
      drawStar(canvas, Offset(x, y), starSize, paint);
    }
    for(int j=0; j<5; j++) {
      double x = crescentCenter.dx + crescentRadius * 1.8 + starSpacing * (j % 5);
      double y = crescentCenter.dy + starSpacing * (j ~/ 5)+40;
      drawStar(canvas, Offset(x, y), starSize, paint);
    }
  }

}



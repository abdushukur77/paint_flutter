import 'package:flutter/material.dart';

class BeizerScreen extends StatelessWidget {
  const BeizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("drawPath quadraticBezierTo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                child: CustomPaint(
                  size: const Size(300, 300),
                  painter: MyPainter(),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // Image.asset("assets/gifs/quadratic_bezier_to.gif")
            ],
          ),
        ));
  }
}
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.orange;
    paint.strokeWidth = 2.0;

    var path = Path();

    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.9,
        size.width * 0.35, size.height * 0.7);

    path.quadraticBezierTo(size.width * 0.45, size.height * 0.6,
        size.width * 0.6, size.height * 0.7);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.8, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

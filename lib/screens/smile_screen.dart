import 'package:flutter/material.dart';

class SmileScreen extends StatefulWidget {
  const SmileScreen({super.key});

  @override
  State<SmileScreen> createState() => _SmileScreenState();
}

class _SmileScreenState extends State<SmileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smile'),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(200, 200),
          painter: SmileyPainter(),
        ),
      ),
    );

  }
}

class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    // Draw face
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    // Draw eyes
    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.35), size.width * 0.1, paint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.35), size.width * 0.1, paint);

    // Draw mouth
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = size.width * 0.05;
    final Path path = Path()
      ..moveTo(size.width * 0.3, size.height * 0.6)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.7, size.width * 0.7, size.height * 0.6);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

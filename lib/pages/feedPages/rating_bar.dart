import 'dart:math';
import 'package:flutter/material.dart';

class PercentProgressBar extends StatelessWidget {
  final double size;
  final int percent;
  final Color selectedColor;
  final Color unselectedColor;

  const PercentProgressBar({
    required this.percent,
    required this.selectedColor,
    required this.unselectedColor,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.topRight,
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: MyPainter(
                percent: percent,
                selectedColor: selectedColor,
                unselectedColor: unselectedColor),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                textDirection: TextDirection.ltr,
                '$percent',
                style: TextStyle(
                    fontSize: size / 2.9,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final int percent;

  final Color selectedColor;
  final Color unselectedColor;

  MyPainter({
    required this.percent,
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint();
    backgroundPaint.color = Colors.black;
    backgroundPaint.isAntiAlias = true;
    canvas.drawOval(Offset.zero & size, backgroundPaint);

    final unselectedArcPaint = Paint();
    unselectedArcPaint.color = unselectedColor;
    unselectedArcPaint.isAntiAlias = true;
    unselectedArcPaint.style = PaintingStyle.stroke;
    unselectedArcPaint.strokeWidth = 3;
    canvas.drawArc(
      const Offset(4, 4) & Size(size.width - 8, size.height - 8),
      0,
      pi * 2,
      false,
      unselectedArcPaint,
    );

    final selectedArcPaint = Paint();
    selectedArcPaint.color = selectedColor;
    selectedArcPaint.isAntiAlias = true;
    selectedArcPaint.style = PaintingStyle.stroke;
    selectedArcPaint.strokeWidth = 3;
    selectedArcPaint.strokeCap = StrokeCap.round;
    canvas.drawArc(const Offset(4, 4) & Size(size.width - 8, size.height - 8),
        -pi / 2, pi * 2 * percent / 100, false, selectedArcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

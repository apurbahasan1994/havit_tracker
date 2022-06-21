import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habit_tracker/ui/theming/app_theme.dart';

class TaskComRing extends StatelessWidget {
  const TaskComRing({Key? key, required this.progress}) : super(key: key);
  final double progress;
  @override
  Widget build(BuildContext context) {
    final themedata = AppTheme.of(context);
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        painter: RingPainter(
            progress: progress,
            taskComColor: themedata.accent,
            taskNoComColor: themedata.taskRing),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  final double progress;
  final Color taskComColor;
  final Color taskNoComColor;

  RingPainter(
      {required this.progress,
      required this.taskComColor,
      required this.taskNoComColor});
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    final notCompleted = progress < 1.0;
    final strokeWidth = size.width / 15.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius =
        notCompleted ? (size.width - strokeWidth) / 2 : size.width / 2;
    if (notCompleted) {
      final bgPaint = Paint()
        ..strokeWidth = strokeWidth
        ..color = Colors.black
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, radius - 20, bgPaint);
    }

    final fgPaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = Colors.white
      ..style = notCompleted ? PaintingStyle.stroke : PaintingStyle.fill;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius - 20),
        -pi / 2, 2 * pi * progress, false, fgPaint);
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

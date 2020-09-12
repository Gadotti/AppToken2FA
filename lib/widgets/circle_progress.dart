import 'package:flutter/material.dart';
import 'dart:math';

class CirleProgress extends CustomPainter {

  double currentProgress;
  bool reversing;
  int durationSecondsCicle;

  CirleProgress(this.currentProgress, this.reversing, this.durationSecondsCicle);

  @override
  void paint(Canvas canvas, Size size) {
      //base circle
      Paint outerCircle = Paint()
        ..strokeWidth = 3
        ..color= Colors.black12
        ..style = PaintingStyle.stroke;

      Paint completeArc = Paint()
        ..strokeWidth = 3        
        ..shader = RadialGradient(
          colors: [
            Colors.redAccent,
            Colors.blue,
          ],
        ).createShader(Rect.fromCircle(
          center: Offset(10, 50),
          radius: 300,
        ))
        ..style = PaintingStyle.stroke        
        ..strokeCap = StrokeCap.round;        

      Offset center = Offset(size.width/2, size.height/2);
      double radius = min(size.width/2, size.height/2) - 3;

      //main outer circle
      canvas.drawCircle(center, radius, outerCircle);

      // debugPrint(currentProgress.toString());
      if (reversing) {
        currentProgress = currentProgress * -1;
      }

      double angle = 2 * pi * (currentProgress/durationSecondsCicle);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius:radius), 
        pi/2,
        angle,
        false,
        completeArc
      );

    }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      // TODO: implement shouldRepaint
      throw UnimplementedError();
    }


}
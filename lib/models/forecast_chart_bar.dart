import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Bar extends StatelessWidget {
  final int actualForecastValue;
  final double height;
  final String label;

  final int _baseDurationMs = 1200;
  final double _maxElementHeight = 100;

  Bar(this.actualForecastValue, this.height, this.label);

  @override
  Widget build(BuildContext context) {
    return CustomAnimation(
      duration: Duration(milliseconds: (height * _baseDurationMs).round()),
      tween: Tween(begin: 0.0, end: height),
      builder: (context, child, value) {
        return Column(
          children: <Widget>[
            Text(actualForecastValue.toString()),
            Container(
              height: (1 - (value as double)) * _maxElementHeight,
            ),
            Container(
              width: 20,
              height: value * _maxElementHeight,
              color: Colors.blue,
            ),
            Text(label)
          ],
        );
      },
    );
  }
}

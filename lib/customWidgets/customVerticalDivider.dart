import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  final double height;
  final double thickness;
  final Color color;
  final double lower;

  CustomVerticalDivider({@required this.height, @required this.color, this.thickness = 2.0, this.lower = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: VerticalDivider(
        color: color,
        thickness: thickness,
      ),
      transform: Matrix4.translationValues(0.0, lower, 0.0,),
    );
  }
}
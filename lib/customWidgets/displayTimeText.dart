import 'package:flutter/material.dart';
import 'package:workday/utilities/constants.dart';

class DisplayTimeText extends StatelessWidget {
//  final Function getHour;
  final Function getHours;
  final Function getMinutes;

  DisplayTimeText({@required this.getHours, @required this.getMinutes});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          getHours(),
          style: kDisplayTextStyle,
        ),
        Text(
          ":",
          style: kDisplayTextStyle,
        ),
        Text(
          getMinutes(),
          style: kDisplayTextStyle,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

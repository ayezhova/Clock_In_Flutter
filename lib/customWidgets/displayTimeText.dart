import 'package:flutter/material.dart';
import 'package:workday/utilities/constants.dart';

class DisplayTimeText extends StatelessWidget {
//  final Function getHour;
  final Function getHours;
  //debugging
  final Function getMinutes;

  final int secondsDTT = 0;
//  DisplayTimeText({this.getHour, this.getMinutes});
  //debugging
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

//
//class DisplayTimeText extends StatefulWidget {
//  final String hello = "hello";
//  final ClockedInTimer clockedInTimer;
//
//  DisplayTimeText(this.clockedInTimer);
//
//  @override
//  _DisplayTimeTextState createState() => _DisplayTimeTextState();
//}
//
//class _DisplayTimeTextState extends State<DisplayTimeText> {
////  ClockedInTimer clockedInTimer = new ClockedInTimer();
//
//  void updateInt()
//  {
//    setState(() {
//      widget.clockedInTimer.int_var++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      children: <Widget>[
//        Text(
//          //for debugging: will need to change to hours
//          widget.clockedInTimer.getMinutesDebug(),
//          style: kDisplayTextStyle,
//        ),
//        Text(
//          ":",
//          style: kDisplayTextStyle,
//        ),
//        Text(
//          //for debugging: change to mins
//          widget.clockedInTimer.getSecondsDebug(),
//          style: kDisplayTextStyle,
//        ),
//      ],
//      mainAxisAlignment: MainAxisAlignment.center,
//    );
//  }
//}
//

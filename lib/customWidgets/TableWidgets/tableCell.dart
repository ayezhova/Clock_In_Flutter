import 'package:flutter/material.dart';
import 'package:workday/utilities/constants.dart';

class CustomTableCell extends StatelessWidget {
  final String time;

  CustomTableCell({@required this.time});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Text(
          time,
          style: kSmallTitle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:workday/utilities/constants.dart';

class LargeDisplayCard extends StatelessWidget {
  final Widget child;
  LargeDisplayCard({this.child});
  final Color color = Colors.orange;

  @override
  Widget build(BuildContext context) {
    const double kMargin = 30.0;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 16.0,
            color: color,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          color: kBlue,
        ),
        margin: EdgeInsets.all(kMargin),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

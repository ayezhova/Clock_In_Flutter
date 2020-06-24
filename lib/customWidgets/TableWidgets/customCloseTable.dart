import 'package:flutter/material.dart';
import 'package:workday/utilities/constants.dart';

import '../customVerticalDivider.dart';

class CustomCloseTable extends StatelessWidget {
  final CustomVerticalDivider rowDivider = CustomVerticalDivider(
    height: 20.0,
    color: kDividerColor,
    lower: -10.0,
    thickness: 3.0,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            rowDivider,
            Expanded(
              child: Container(),
            ),
            rowDivider,
            Expanded(
              child: Container(),
            ),
          ],
        ),
        Container(
          transform: Matrix4.translationValues(0.0, -20.0, 0.0,),
          child: Divider(
            thickness: 3.0,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
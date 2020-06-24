import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/owner/AndroidStudioProjects/work_day/lib/customWidgets/TableWidgets/tableCell.dart';
import 'package:workday/utilities/constants.dart';

import '../customVerticalDivider.dart';

class CustomTableRow extends StatelessWidget {
  final List<String> strings;

  CustomTableRow({@required this.strings});

  final CustomVerticalDivider kRowDivider = CustomVerticalDivider(
    height: 40.0,
    color: kDividerColor,
    lower: -10.0,
    thickness: 3.0,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomTableCell(time: strings[0]),
        kRowDivider,
        CustomTableCell(time: strings[1]),
        kRowDivider,
        CustomTableCell(time: strings[2]),
      ],
    );
  }
}

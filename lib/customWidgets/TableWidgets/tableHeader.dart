import 'package:flutter/material.dart';
import 'package:workday/utilities/constants.dart';
import '../customVerticalDivider.dart';

class TableHeader extends StatelessWidget {
  final CustomVerticalDivider kHeaderDivider = CustomVerticalDivider(
    height: 50.0,
    color: kDividerColor,
    lower: 8.0,
    thickness: 3.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text("Time In",
              style: kMediumTitle,
              textAlign: TextAlign.center,
            ),
          ),
          kHeaderDivider,
          Expanded(
            child: Text("Time Out",
              style: kMediumTitle,
              textAlign: TextAlign.center,
            ),
          ),
          kHeaderDivider,
          Expanded(
            child: Text("Worked",
              style: kMediumTitle,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

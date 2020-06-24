import 'package:flutter/material.dart';
import 'package:workday/utilities/constants.dart';

class TableTotalRow extends StatelessWidget {
  final String total;

  TableTotalRow({@required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(child: Container(),),
          Expanded(
            child: Text(
              "Total:",
              textAlign: TextAlign.center,
              style: kSmallTitle,
            ),
          ),
          Expanded(
            child: Text(
              total,
              textAlign: TextAlign.center,
              style: kSmallTitle,
            ),
          ),
        ],
      ),
      transform: Matrix4.translationValues(0.0, -20.0, 0.0,),
    );
  }
}
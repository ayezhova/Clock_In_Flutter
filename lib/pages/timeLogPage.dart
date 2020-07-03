import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workday/customWidgets/TableWidgets/tableHeader.dart';
import 'package:workday/customWidgets/TableWidgets/tableTotalRow.dart';
import 'package:workday/customWidgets/iconButton.dart';
import 'package:workday/utilities/ClockedInTimer.dart';
import 'package:workday/utilities/constants.dart';
import 'package:workday/utilities/timeEntry.dart';
import 'package:workday/utilities/timeLogController.dart';

class TimeLogPage extends StatelessWidget {
//  final TimeLogController timeLogController;
  final ClockedInTimer clockedInTimer;

  void printJsons() {
    String encodedTimeLog = jsonEncode(clockedInTimer.timeLogController);
    print(encodedTimeLog);
    Map<String, dynamic> decodedTimeLog = jsonDecode(encodedTimeLog);
    TimeLogController newTimeLog = new TimeLogController.fromJson(decodedTimeLog);
  }

  TimeLogPage({@required this.clockedInTimer});

  @override
  Widget build(BuildContext context) {
    printJsons();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: CustomIconButton(
                onTap: () {
                  Navigator.pop(context);
                },
                icon: Icons.keyboard_arrow_down,
                iconSize: 80.0,
              ),
            ),
            Text(
              "TIME LOG",
              style: kLargeTitle,
              textAlign: TextAlign.center,
            ),
//            SizedBox(height: 30.0,),
            Expanded(
              child: ListView(
                children: <Widget>[
                  TableHeader(),
                  Divider(
                    thickness: 3.0,
                    color: Colors.orange,
                  ),
                  clockedInTimer.timeLogController.getTableRows(),
                  TableTotalRow(total: clockedInTimer.getHours() + ":" + clockedInTimer.getMinutes(),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:workday/customWidgets/TableWidgets/customCloseTable.dart';
import 'package:workday/customWidgets/TableWidgets/tableRow.dart';
import 'package:workday/utilities/timeEntry.dart';
import 'package:flutter/material.dart';

class TimeLogController{
  List<TimeEntry> _timeLog = [];

  TimeLogController();

  void clockIn() {
    _timeLog.add(new TimeEntry());
  }

  void clockOut() {
    int length = _timeLog.length;
    _timeLog[length - 1].setTimeOut();
  }

  String getTimeIn(int i) => _timeLog[i].getTimeIn();
  String getTimeOut(int i) => _timeLog[i].getTimeOut();
  String getTimeWorked(int i) => _timeLog[i].getTimeWorkedString();

  int getLength() => _timeLog.length;

  void printContentsDebugging() {
    int length = _timeLog.length;

    print("----TIME LOG------");
    for(int i = 0; i < length; i++) {
      print("CLOCK IN: " + _timeLog[i].getTimeIn());
      print("CLOCK OUT: " + _timeLog[i].getTimeOut());
    }
  }

  Column getTableRows() {
    return Column(
      children: <Widget>[
        Column(
          children: _timeLog.map((time) {
            return CustomTableRow(
              strings: [time.getTimeIn(), time.getTimeOut(), time.getTimeWorkedString()],
            );
          }).toList(),
        ),
        CustomCloseTable(),
      ],
    );
  }

  Map<String, dynamic> toJson() => {
    'timeLog': _timeLog,
  };

  TimeLogController.fromJson(Map<String, dynamic> jsonTimeLog) {
    List<dynamic> decodedJsonLog = jsonTimeLog['timeLog'];
    decodedJsonLog.map((elem) => elem.jsonDecode());
    List <TimeEntry> timeLog = [];
    for (int i = 0; i < decodedJsonLog.length; i++) {
      timeLog.add(new TimeEntry.fromJson(decodedJsonLog[i]));
    }
    _timeLog = timeLog;
  }
}
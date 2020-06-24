import 'package:flutter/cupertino.dart';
import 'package:workday/customWidgets/TableWidgets/tableRow.dart';
import 'package:workday/utilities/timeLogController.dart';

class MakeTable{
  TimeLogController timeLogController;
  int length;

  MakeTable({@required this.timeLogController}) {
    length = timeLogController.getLength();
  }

  List<CustomTableRow> getTableRows() {
    List<CustomTableRow> tableRows = [];

    for (int i = 0; i < length; i++) {
      tableRows.add(
        CustomTableRow(strings: [timeLogController.getTimeIn(i),
          timeLogController.getTimeOut(i),
          timeLogController.getTimeWorked(i)])
      );
    }
    return tableRows;
  }

}
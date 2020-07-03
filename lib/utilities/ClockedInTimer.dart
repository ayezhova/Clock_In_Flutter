import 'dart:async';
import 'package:workday/utilities/timeLogController.dart';

class ClockedInTimer{
  TimeLogController timeLogController = new TimeLogController();
  bool clockedIn = false;
  int hours = 0;
  int minutes = 0;
  //for debugging
  int seconds = 0;

  String getButtonText() {
    if (clockedIn == false)
      return "Clock In";
    else
      return "Clock Out";
  }

  void changeClockedIn() {
    clockedIn = !(clockedIn);
    if (clockedIn)
      timeLogController.clockIn();
    else
      timeLogController.clockOut();
  }

  String getHours() => hours.toString();

  String getMinutes() {
    if (minutes < 10){
      return "0" + minutes.toString();
    }
    else
      return minutes.toString();
  }

}
import 'package:workday/utilities/goalTime.dart';

class TimeEntry{
  DateTime _timeIn;
  DateTime _timeOut;
  //TODO: update to hours/minutes

  TimeEntry() {
    this._timeIn = DateTime.now();
  }

  void setTimeOut() {
    _timeOut = DateTime.now();
  }


  List<int> getTimeWorkedInt(){
    int hours;
    int minutes;
    DateTime tempTime;

    if (_timeOut != null){
      hours = _timeOut.difference(_timeIn).inHours;
      minutes = _timeOut.difference(_timeIn).inMinutes - 60 * hours;
    }
    else{
      tempTime = DateTime.now();
      hours = tempTime.difference(_timeIn).inHours;
      minutes = tempTime.difference(_timeIn).inMinutes - 60 * hours;
      print(hours);
      print(minutes);
    }

    return [hours, minutes];
  }

  String getTimeWorkedString() {
    List<int> timeWorked;
    int hours;
    int minutes;
    String timeSpent;

    timeWorked = getTimeWorkedInt();
    hours = timeWorked[0];
    minutes = timeWorked[1];

    timeSpent = hours.toString() + ":";
    if (minutes >= 10)
      timeSpent += minutes.toString();
    else
      timeSpent = timeSpent + "0" + minutes.toString();
    return timeSpent;
  }

  String getTimeString(DateTime time) {
    int hour;
    int minute;
    String timeStr;
    String timeOfDay;

    if (time.hour <= 12) {
      hour = time.hour;
      timeOfDay = (hour != 12) ? "AM" : "PM";
      if(hour == 0)
        hour = 12;
    }
    else {
      hour = time.hour - 12;
      timeOfDay = "PM";
    }
    minute = time.minute;
    timeStr = hour.toString() + ":";
    timeStr += (minute < 10) ? "0" + minute.toString() : minute.toString();
    timeStr += " " + timeOfDay;
    return timeStr;
  }

  String getTimeIn() => getTimeString(_timeIn);

  String getTimeOut() {
    if (_timeOut != null)
      return getTimeString(_timeOut);
    return "---";
  }

  Map<String, dynamic> toJson() => {
    'timeIn': _timeIn.toString(),
    'timeOut': _timeOut.toString()
  };

  TimeEntry.fromJson(Map<String, dynamic> jsonTimeEntry) {
    _timeIn = DateTime.parse(jsonTimeEntry['timeIn']);
    if (jsonTimeEntry['timeOut'] == null)
      _timeOut = DateTime.parse(jsonTimeEntry['timeOut']);
    else
      _timeOut = null;
  }
}

enum Direction{up, down}
enum Time{hours, minutes}

class GoalTime {
  int _goalHours = 8;
  int _goalMinute = 0;

  String getHours() => _goalHours.toString();

  String getMinute() {
    if (_goalMinute < 10){
      return "0" + _goalMinute.toString();
    }
    else
      return _goalMinute.toString();
  }

  void updateHour(Direction direction) {
    if (direction == Direction.up && _goalHours > 23)
      _goalHours = 0;
    else if (direction == Direction.down && _goalHours == 0)
      _goalHours = (_goalMinute == 0) ? 24 : 23;
    else
      _goalHours += (direction == Direction.up) ? 1 : -1;
  }

  void updateMinute(Direction direction) {
    if (direction == Direction.up && _goalHours == 24) {
      updateHour(Direction.up);
      _goalMinute = 5;
    }
    else if (direction == Direction.down && _goalHours == 0 && _goalMinute == 0) {
      updateHour(Direction.down);
      _goalHours = 23;
      _goalMinute = 55;
    }
    else if (direction == Direction.up && _goalMinute == 55){
      updateHour(Direction.up);
      _goalMinute = 0;
    }
    else if (direction == Direction.down && _goalMinute == 0){
      updateHour(Direction.down);
      _goalMinute = 55;
    }
    else
      _goalMinute += direction == Direction.up ? 5 : -5;
  }
}
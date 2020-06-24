import 'package:flutter/material.dart';
import 'package:workday/utilities/goalTime.dart';
import 'package:workday/customWidgets/iconButton.dart';
import 'package:workday/utilities/constants.dart';



class TimeBar extends StatefulWidget {
  @override
  _TimeBarState createState() => _TimeBarState();
}

class _TimeBarState extends State<TimeBar> {
  GoalTime goalTime = new GoalTime();

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Color(0xFFECE4B7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CustomIconButton(
                icon: Icons.keyboard_arrow_up,
                onTap: () {
                  setState(() {
                    goalTime.updateHour(Direction.up);
                  });
                },
              ),
              Text(
                goalTime.getHours(),
                style: kGoalTime,
              ),
              CustomIconButton(
                icon: Icons.keyboard_arrow_down,
                onTap: () {
                  setState(() {
                    goalTime.updateHour(Direction.down);
                  });
                },
              ),
            ],
          ),
          Text(
            ":",
            style: kGoalTime,
          ),
          Column(
            children: <Widget>[
              CustomIconButton(
                icon: Icons.keyboard_arrow_up,
                onTap: () {
                  setState(() {
                    goalTime.updateMinute(Direction.up);
                  });
                },
              ),
              Text(
                goalTime.getMinute(),
                style: kGoalTime,
              ),
              CustomIconButton(
                icon: Icons.keyboard_arrow_down,
                onTap: () {
                  setState(() {
                    goalTime.updateMinute(Direction.down);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workday/customWidgets/TimeBar.dart';
import 'package:workday/customWidgets/iconButton.dart';
import 'package:workday/customWidgets/largeDisplayCard.dart';
import 'package:workday/pages/timeLogPage.dart';
import 'package:workday/utilities/constants.dart';
import 'package:workday/utilities/ClockedInTimer.dart';
import 'package:workday/customWidgets/displayTimeText.dart';
import 'package:async/async.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Timer _timer;
  ClockedInTimer clockedInTimer = new ClockedInTimer();

  //secs -> minutes, minutes -> secs
  void updateSecs()
  {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      if (!clockedInTimer.clockedIn) {
        timer.cancel();
      }
      if(clockedInTimer.clockedIn)
        setState(() {
          if (clockedInTimer.minutes >= 59) {
            clockedInTimer.minutes = 0;
            clockedInTimer.hours++;
          }
          else
            clockedInTimer.minutes++;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: Text("GOAL",
                    style: kLargeTitle,
                  )
                ),
                TimeBar(),
              ],
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: LargeDisplayCard(
//                      child: DisplayTimeText(clockedInTimer,),
                      child: DisplayTimeText(
                        //will need to update to hours ands mins
                        getHours: clockedInTimer.getHours,
                        getMinutes: clockedInTimer.getMinutes,
                      ),
                    ),
                    flex: 3,
                  ),
//                  SizedBox(height: 10.0,),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            clockedInTimer.changeClockedIn();
                            updateSecs();
                          });
                        },
                        color: kLightYellow,
//                        color: Color(0xFF7FB069),
                        child: Text(
                          clockedInTimer.getButtonText(),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomIconButton(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TimeLogPage(clockedInTimer: clockedInTimer);
                    },
                  )
              );
            },
            icon: Icons.keyboard_arrow_up,
            iconSize: 80.0,
          ),
        ],
      ),
    );
  }
}

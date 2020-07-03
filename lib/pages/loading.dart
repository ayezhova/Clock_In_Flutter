import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:workday/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    nextPage();
  }

  void nextPage() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'goalHours': 6,
        'goalMinutes': 15,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SpinKitDualRing(
              color: Colors.white,
              size: 100.0,
              lineWidth: 20.0,
              controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 2400)),
            ),
          ),
          SizedBox(height: 100.0,),
          Text("Setting Up...",
            style: kMediumTitle,
          ),
        ],
      ),
    );
  }
}

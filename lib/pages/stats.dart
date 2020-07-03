import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {

  final String textToDisplay;

  StatsPage({this.textToDisplay});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stat Page"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            textToDisplay,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Image clock = Image.asset("assets/clock_v2.png");
  var time = DateFormat.yMEd().add_jms().format(new DateTime.now());
  //seconds for testing
  var seconds = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Timer App',
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
      ),
      body: Center(
        child: Column(
          children: <Widget> [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Text(time),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: FractionalOffset.topCenter,
                child: GestureDetector(
                  onTap: () {
                    print("onTap");
                    setState(() {
                      time = DateFormat.yMEd().add_jms().format(new DateTime.now());
                    });
                    print (time);
                  },
                  child: clock,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: () {},
                child: Text('Goal: 7:00'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

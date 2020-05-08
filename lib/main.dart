import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Image clock = Image.asset("assets/clock_v2.png");
  Image punchAnimation = Image.asset("assets/clock_animation_infinite.gif");
  Widget mainImage;
  //seconds for testing
  Duration seconds = Duration(seconds: 0);
  //0 not currently running, 1 - currently running
  var running = 0;
  var startTime;
  String runningText="Clocked In";
  String notRunningText = "Clocked Out";
  String title;
  AnimationController _controller;
  Animation<int> _animation;

  @override
  void initState()
  {
    super.initState();
    title = "Clocked Out";
    mainImage = clock;
    _controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 1100));
    _animation = new IntTween(begin: 1, end: 22).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          'Stats',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.brown,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings),
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
              Text('$title'),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Text(seconds.inSeconds.toString()),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (running == 0) {
                        startTime = new DateTime.now();
                        running = 1;
                        title = runningText;
                      }
                      else {
                        running = 0;
                        seconds += new DateTime.now().difference(startTime);
                        title = notRunningText;
                      }
                      _controller.value = 0.0;
                      _controller.forward();
                      mainImage = new AnimatedBuilder(
                          animation: _animation,
                          builder: (BuildContext context, Widget child){
                            String frame = _animation.value.toString();
                            return new Image.asset(
                              'animation/$frame.png',
                              gaplessPlayback: true,
                            );
                          });
                    });

                    Timer(Duration(milliseconds: 1200), (){
                      setState(() {
                        mainImage = clock;
                      });
                    });

                  },
                  child: mainImage,
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Stats'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

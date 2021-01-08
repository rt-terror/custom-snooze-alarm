import 'package:flutter/material.dart';
import 'package:screen/screen.dart';

import 'click_page.dart';
import 'countdown.dart';

class TimerPage extends StatefulWidget {
  TimerPage({Key key, this.from, this.extend}) : super(key: key) {
    Screen.keepOn(true);
    print("TimerPage created");
  }

  final int from;
  final int extend;

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin {
  static const double kFrom = 0.00000001;
  AnimationController _controller;
  Animation<int> _animation;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: new Duration(seconds: widget.from))
      ..forward(from: kFrom);
    _animation = StepTween(begin: widget.from + 1, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          complete();
        }
      });
  }

  Future<void> complete() async {
    print('Timer complete');
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ClickPage();
    }));
    resetTimer(widget.extend);
  }

  void resetTimer(int setpoint) {
    _controller.stop();
    _controller = new AnimationController(
        vsync: this, duration: new Duration(seconds: setpoint))
      ..forward(from: kFrom);
    _animation = StepTween(begin: setpoint + 1, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          complete();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Counting down..."),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            resetTimer(widget.extend);
          });
          _key.currentState.showSnackBar(SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Time extended.'),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {},
              )));
        },
        child: Container(
          color: Colors.grey.shade900,
          alignment: FractionalOffset.center,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Countdown(
                  animation: _animation, from: _controller.duration.inSeconds),
              Text(
                'Tap screen to extend time',
                style: TextStyle(color: Theme.of(context).disabledColor),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            resetTimer(widget.from);
          });
          _key.currentState.showSnackBar(SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Time reset.'),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {},
              )));
        },
        icon: Icon(Icons.settings_backup_restore),
        label: Text('Reset'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation, this.from})
      : super(key: key, listenable: animation);
  final Animation<int> animation;
  final int from;

  @override
  build(BuildContext context) {
    return new Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            child: CircularProgressIndicator(
              value: 1 - animation.value.toDouble() / from.toDouble(),
              strokeWidth: 10.0,
            ),
            height: 200.0,
            width: 200.0,
          ),
          Center(
            child: Text(
              animation.value.toString(),
              style: new TextStyle(fontSize: 80.0),
            ),
          ),
        ],
      ),
    );
  }
}

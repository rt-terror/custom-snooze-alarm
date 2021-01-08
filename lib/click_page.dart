import 'dart:async';

import 'package:flutter/material.dart';

class ClickPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClickPageState();

  ClickPage({Key key}) : super(key: key);
}

class _ClickPageState extends State<ClickPage> {
  bool isCyanBackground = true;
  Timer timer;
  @override
  void initState() {
    super.initState();
    timer = new Timer.periodic(new Duration(seconds: 1), (Timer timer) {
      setState(() {
        isCyanBackground = !isCyanBackground;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repeating Custom Timer'),
      ),
      backgroundColor:
          isCyanBackground ? Colors.cyanAccent : Colors.redAccent[400],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 90,
                  right: 90,
                ),
                child: Text(
                  "Snooze",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

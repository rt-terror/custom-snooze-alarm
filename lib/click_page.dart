import 'dart:async';

import 'package:flutter/material.dart';

class ClickPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClickPageState();

  ClickPage({Key key, this.message}) : super(key: key);

  final String message;
}

class _ClickPageState extends State<ClickPage> {
  _ClickPageState() {
    new Timer(Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  @override
  build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
            child: Text(widget.message,
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 100.0))));
  }
}

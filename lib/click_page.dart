import 'dart:async';

import 'package:flutter/material.dart';

class ClickPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClickPageState();

  ClickPage({Key key, this.message}) : super(key: key);

  final String message;
}

class _ClickPageState extends State<ClickPage> {
  @override
  build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(widget.message,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 100.0))),
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Snooze', style: TextStyle(fontSize: 20)),
                color: Colors.green.shade800,
              ),
            )
          ],
        ));
  }
}

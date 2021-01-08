import 'package:flutter/material.dart';

import './settings_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Click Timer',
      theme: ThemeData(
          primaryColor: Colors.green,
          brightness: Brightness.dark,
          accentColor: Colors.green,
          buttonColor: Colors.green,

          accentColorBrightness: Brightness.dark),
      home: SettingsForm(),
    );
  }
}

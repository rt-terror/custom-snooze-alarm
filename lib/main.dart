import 'package:flutter/material.dart';
import './first_view/first_view.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      title: 'Click Timer',
      theme: ThemeData(
          primaryColor: Colors.green,
          brightness: Brightness.dark,
          accentColor: Colors.green,
          buttonColor: Colors.green,
          accentColorBrightness: Brightness.dark),
          debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/welcome.png'), fit: BoxFit.cover)
            )
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,
                Color(0xff161d27).withOpacity(0.7),
                Color(0xff161d27)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            )
          )
        ]
      ),
    );
  }
}


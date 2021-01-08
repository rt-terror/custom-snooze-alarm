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
                Colors.grey[900].withOpacity(0.6),
                Colors.grey[900].withOpacity(0.7),
                Color(0xff161d27).withOpacity(0.8),
                Color(0xff161d27)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            )
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Welcome to",
                  style: TextStyle(
                    fontFamily: 'Courgette',
                    fontSize: 41,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text("CustomSnooze!",
                  style: TextStyle(
                      fontFamily: 'Courgette',
                      fontSize: 41,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(height: 10),
                Text("Please wake up on time.", style: TextStyle(color: Colors.grey[400], fontSize: 22),),
                SizedBox(height: 80),
                RaisedButton(onPressed: () {
                  Navigator.pushNamed(context, '/settingsForm');
                },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 90, right: 90),
                    child: Text("Proceed", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),)
                  )
                )
              ],
            )
          )
        ]
      ),
    );
  }
}


import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class ClickPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClickPageState();

  ClickPage({Key key, this.isFlashing}) : super(key: key);

  final bool isFlashing;
}

class _ClickPageState extends State<ClickPage> {
  bool isCyanBackground = true;
  Timer timer;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
        Playlist(audios: [
          Audio("assets/audios/alarm.mp3"),
        ]),
        loopMode: LoopMode.playlist //loop the full playlist
        );
    if (widget.isFlashing) {
      timer =
          new Timer.periodic(new Duration(milliseconds: 500), (Timer timer) {
        setState(() {
          isCyanBackground = !isCyanBackground;
        });
      });
    }
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
                assetsAudioPlayer.stop();
                Navigator.pop(context);
              },
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(50),
              // ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 92,
                  right: 92,
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
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: RaisedButton(
              color: Colors.white,
              onPressed: () {
                //Pop 2 times
                assetsAudioPlayer.stop();
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 25,
                  right: 25,
                ),
                child: Text(
                  "Exit",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

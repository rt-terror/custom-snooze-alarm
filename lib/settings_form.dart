import 'package:flutter/material.dart';
import 'package:screen/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './timer_page.dart';

final String aboutText = """
Created By: Adam Stevenson
Created For: Thomas Sarlitto, Virtual Tax Preparer

App icons made by Smashicons www.flaticon.com is licensed by CC 3.0 BY
    """;

class SettingsForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final fromController = TextEditingController();
  final extendController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final extendFocus = FocusNode();

  //for data persistence
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void dispose() {
    fromController.dispose();
    extendFocus.dispose();
    super.dispose();
  }

  void startCounter() async {
    if (_formKey.currentState.validate()) {
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        var from = int.tryParse(fromController.value.text);
        var extend = int.tryParse(extendController.value.text);
        return TimerPage(from: from, extend: extend);
      }));
      Screen.keepOn(false);
    }
  }

  Future<Map> getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loadedTime = prefs.getString("time");
    String loadedExtendTime = prefs.getString("extendTime");
    return {"loadedTime": loadedTime, "loadedExtendTime": loadedExtendTime};
  }

  Future<void> savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("time", fromController.text);
    prefs.setString("extendTime", extendController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // drawer: Drawer(
      //     child: ListView(
      //   children: <Widget>[
      //     AboutListTile(
      //       icon: Icon(Icons.info),
      //       child: Text('About'),
      //       applicationName: 'Repeating Custom Timer',
      //       aboutBoxChildren: <Widget>[
      //         Text(
      //           aboutText,
      //           style: TextStyle(fontSize: 12),
      //         )
      //       ],
      //     )
      //   ],
      // )),
      appBar: AppBar(
        title: Text('Repeating Custom Timer'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                SizedBox(width: 15),
                Text(
                  "Timer interval:",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[100]),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: FutureBuilder(
                future: getPreferences(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final _newValue = snapshot.data["loadedTime"] == null
                        ? ""
                        : snapshot.data["loadedTime"];
                    fromController.value = TextEditingValue(
                      text: _newValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: _newValue.length),
                      ),
                    );
                    return TextFormField(
                      cursorColor: Colors.cyanAccent,
                      style: TextStyle(color: Colors.black),
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      controller: fromController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        var n = int.tryParse(value);
                        if (n == null || n <= 0) {
                          return 'Please enter a positive number.';
                        }
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(extendFocus);
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 15),
                Text(
                  "Extend time:",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[100]),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: FutureBuilder(
                future: getPreferences(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final _newValue =
                        snapshot.data["loadedExtendedTime"] == null
                            ? ""
                            : snapshot.data["loadedExtendedTime"];
                    extendController.value = TextEditingValue(
                      text: _newValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: _newValue.length),
                      ),
                    );
                    return TextFormField(
                      cursorColor: Colors.cyanAccent,
                      style: TextStyle(color: Colors.black),
                      controller: extendController,
                      focusNode: extendFocus,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        var n = int.tryParse(value);
                        if (n == null || n <= 0) {
                          return 'Please enter a positive number.';
                        }
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            // Row(
            //   children: <Widget>[
            //     SizedBox(width: 15),
            //     Text("Message to display:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey[100])),
            //   ],
            // ),
            // Padding(
            //   padding: EdgeInsets.all(15),
            //   child:  TextFormField(
            //     cursorColor: Colors.cyanAccent,
            //     style: TextStyle(color: Colors.black),
            //     controller: messageController,
            //     focusNode: messageFocus,
            //     textInputAction: TextInputAction.done,
            //     onFieldSubmitted: (_) => startCounter(),
            //     decoration: InputDecoration(
            //         filled: true,
            //         fillColor: Colors.grey[300],
            //         enabledBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.all(
            //                 Radius.circular(10)
            //             ),
            //             borderSide: BorderSide(
            //                 color: Colors.grey
            //             )
            //         )
            //     ),
            //   )
            // ),
            SizedBox(height: 80),
            RaisedButton(
              onPressed: () async {
                await savePreferences();
                startCounter();
              },
              color: Colors.cyanAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: Text(
                  "Start",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () => startCounter(),
      //   icon: Icon(Icons.play_arrow),
      //   label: Text('Start'),
      // ),
    );
  }
}

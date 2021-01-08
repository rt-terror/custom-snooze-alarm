import 'package:flutter/material.dart';
import 'package:screen/screen.dart';

import './timer_page.dart';

class SettingsForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final fromController = TextEditingController(text: '63');
  final extendController = TextEditingController(text: '305');
  final messageController = TextEditingController(text: 'CLICK');
  final _formKey = GlobalKey<FormState>();
  final extendFocus = FocusNode();
  final messageFocus = FocusNode();

  @override
  void dispose() {
    fromController.dispose();
    extendFocus.dispose();
    messageFocus.dispose();
    super.dispose();
  }

  void startCounter() async {
    if (_formKey.currentState.validate()) {
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        var from = int.tryParse(fromController.value.text);
        var extend = int.tryParse(extendController.value.text);
        return TimerPage(
            from: from, extend: extend, message: messageController.value.text);
      }));
      Screen.keepOn(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var aboutText = """
Created By: Adam Stevenson
Created For: Thomas Sarlitto, Virtual Tax Preparer

App icons made by Smashicons www.flaticon.com is licensed by CC 3.0 BY
    """;

    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          AboutListTile(
            icon: Icon(Icons.info),
            child: Text('About'),
            applicationName: 'Repeating Custom Timer',
            aboutBoxChildren: <Widget>[
              Text(
                aboutText,
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      )),
      appBar: AppBar(
        title: Text('Repeating Custom Timer'),
      ),
      body: Center(
          child: Form(
              key: _formKey,
              child: ListView(children: [
                Text("Timer interval:"),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: fromController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      InputDecoration(hintText: "timer interval in seconds"),
                  validator: (value) {
                    var n = int.tryParse(value);
                    if (n == null || n <= 0) {
                      return 'Please enter a positive number.';
                    }
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(extendFocus);
                  },
                ),
                Text("Extend time:"),
                TextFormField(
                  controller: extendController,
                  focusNode: extendFocus,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(messageFocus);
                  },
                  decoration:
                      InputDecoration(hintText: "time extension in seconds"),
                  validator: (value) {
                    var n = int.tryParse(value);
                    if (n == null || n <= 0) {
                      return 'Please enter a positive number.';
                    }
                  },
                ),
                Text("Message to display:"),
                TextFormField(
                  controller: messageController,
                  focusNode: messageFocus,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => startCounter(),
                )
              ]))),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => startCounter(),
        icon: Icon(Icons.play_arrow),
        label: Text('Start'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:app1/main.dart';

class NewActivityState extends StatefulWidget {
  String inputText;
  NewActivityState({required this.inputText});

  @override
  NewActivity createState() => NewActivity();
}

class NewActivity extends State<NewActivityState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(widget.inputText),
      ),
    );
  }
}

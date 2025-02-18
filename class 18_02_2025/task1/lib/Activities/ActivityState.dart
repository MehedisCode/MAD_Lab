import 'package:flutter/material.dart';

class RedAcitvityState extends StatefulWidget {
  final String inputText;

  // Constructor to receive inputText
  const RedAcitvityState({required this.inputText});

  @override
  RedActivity createState() => RedActivity();
}

class RedActivity extends State<RedAcitvityState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: Text("Red Activity")),
      body: Center(
        child: Text(
          widget.inputText, // Accessing inputText using widget.inputText
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

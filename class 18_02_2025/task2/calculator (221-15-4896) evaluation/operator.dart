import 'package:flutter/material.dart';
import 'package:calculator/operand2.dart';

class OperatorState extends StatefulWidget {
  final String val1;

  OperatorState({required this.val1});

  @override
  Operator createState() => Operator();
}

class Operator extends State<OperatorState> {
  final TextEditingController tController = TextEditingController();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Operator",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              TextField(
                controller: tController,
                decoration: InputDecoration(
                  labelText: 'Enter Operator (+, -, *, /)',
                  border: OutlineInputBorder(),
                  errorText: errorMessage.isEmpty ? null : errorMessage,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (tController.text.isEmpty ||
                      !['+', '-', '*', '/'].contains(tController.text)) {
                    setState(() {
                      errorMessage =
                          "Please enter a valid operator (+, -, *, /)";
                    });
                  } else {
                    setState(() {
                      errorMessage = "";
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Operand2State(
                              operator: tController.text,
                              operand1: widget.val1,
                            ),
                      ),
                    );
                  }
                },
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

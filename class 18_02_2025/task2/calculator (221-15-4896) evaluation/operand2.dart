import 'package:flutter/material.dart';
import 'package:calculator/result.dart';

class Operand2State extends StatefulWidget {
  final String operator;
  final String operand1;
  Operand2State({required this.operator, required this.operand1});

  @override
  Operand2 createState() => Operand2();
}

class Operand2 extends State<Operand2State> {
  final TextEditingController tController = TextEditingController();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Operand 2",
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
                  labelText: 'Enter Operand 2',
                  border: OutlineInputBorder(),
                  errorText: errorMessage.isEmpty ? null : errorMessage,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  String operand2 = tController.text.trim();

                  if (operand2.isEmpty || double.tryParse(operand2) == null) {
                    setState(() {
                      errorMessage =
                          "Please enter a valid number for Operand 2";
                    });
                  } else {
                    setState(() {
                      errorMessage = "";
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ResultState(
                              operand1: widget.operand1,
                              operator: widget.operator,
                              operand2: operand2,
                            ),
                      ),
                    );
                  }
                },
                child: Text("Result"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

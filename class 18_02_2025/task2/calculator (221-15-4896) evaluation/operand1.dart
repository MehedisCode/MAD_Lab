import 'package:flutter/material.dart';
import 'operator.dart';

class Operand1State extends StatefulWidget {
  @override
  Operand1 createState() => Operand1();
}

class Operand1 extends State<Operand1State> {
  final TextEditingController tController = TextEditingController();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Operand 1",
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Operand 1 Value: ',
                  border: OutlineInputBorder(),
                  errorText: errorMessage.isEmpty ? null : errorMessage,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (tController.text.isEmpty ||
                      double.tryParse(tController.text) == null) {
                    setState(() {
                      errorMessage = "Please enter a valid number";
                    });
                  } else {
                    setState(() {
                      errorMessage = "";
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => OperatorState(val1: tController.text),
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

import 'package:flutter/material.dart';

class ResultState extends StatelessWidget {
  final String operand1;
  final String operator;
  final String operand2;

  ResultState({
    required this.operand1,
    required this.operator,
    required this.operand2,
  });

  @override
  Widget build(BuildContext context) {
    double op1 = double.parse(operand1);
    double op2 = double.parse(operand2);

    double result = 0;
    switch (operator) {
      case '+':
        result = op1 + op2;
        break;
      case '-':
        result = op1 - op2;
        break;
      case '*':
        result = op1 * op2;
        break;
      case '/':
        result = op1 / op2;
        break;
      default:
        return Scaffold(
          appBar: AppBar(title: Text("Error")),
          body: Center(child: Text('Invalid operator')),
        );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Result",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Result: $result', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}

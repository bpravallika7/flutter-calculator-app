import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = "";
  double num1 = 0;
  String operation = "";

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        display = "";
        num1 = 0;
        operation = "";
      } else if (["+", "-", "×", "÷"].contains(value)) {
        num1 = double.parse(display);
        operation = value;
        display = "";
      } else if (value == "=") {
        double num2 = double.parse(display);
        double result = 0;

        switch (operation) {
          case "+":
            result = num1 + num2;
            break;
          case "-":
            result = num1 - num2;
            break;
          case "×":
            result = num1 * num2;
            break;
          case "÷":
            result = num2 != 0 ? num1 / num2 : 0;
            break;
        }

        display = result.toString();
      } else {
        display += value;
      }
    });
  }

  Widget calcButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(20),
            height: 120,
            child: Text(
              display,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Column(
              children: [
                Row(children: [calcButton("7"), calcButton("8"), calcButton("9"), calcButton("÷")]),
                Row(children: [calcButton("4"), calcButton("5"), calcButton("6"), calcButton("×")]),
                Row(children: [calcButton("1"), calcButton("2"), calcButton("3"), calcButton("-")]),
                Row(children: [calcButton("C"), calcButton("0"), calcButton("="), calcButton("+")]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
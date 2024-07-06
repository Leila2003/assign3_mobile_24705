import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _result = "0";
  String _operand = "";
  double _num1 = 0.0;
  double _num2 = 0.0;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _result = "0";
      _num1 = 0.0;
      _num2 = 0.0;
      _operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷" ||
        buttonText == "^") {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _result = "0";
    } else if (buttonText == ".") {
      if (!_result.contains(".")) {
        _result += buttonText;
      }
    } else if (buttonText == "=") {
      _num2 = double.parse(_output);

      if (_operand == "+") {
        _result = (_num1 + _num2).toString();
      } else if (_operand == "-") {
        _result = (_num1 - _num2).toString();
      } else if (_operand == "×") {
        _result = (_num1 * _num2).toString();
      } else if (_operand == "÷") {
        _result = (_num1 / _num2).toString();
      } else if (_operand == "^") {
        _result = pow(_num1, _num2).toString();
      }

      _num1 = 0.0;
      _num2 = 0.0;
      _operand = "";
    } else if (buttonText == "√") {
      _result = sqrt(double.parse(_output)).toString();
    } else if (buttonText == "%") {
      _result = (double.parse(_output) / 100).toString();
    } else {
      _result += buttonText;
    }

    setState(() {
      _output = double.parse(_result).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, Color color, Color textColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 24.0, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(children: [
            Row(children: [
              buildButton("7", Colors.blue, Colors.white),
              buildButton("8", Colors.blue, Colors.white),
              buildButton("9", Colors.blue, Colors.white),
              buildButton("÷", Colors.orange, Colors.white)
            ]),
            Row(children: [
              buildButton("4", Colors.blue, Colors.white),
              buildButton("5", Colors.blue, Colors.white),
              buildButton("6", Colors.blue, Colors.white),
              buildButton("×", Colors.orange, Colors.white)
            ]),
            Row(children: [
              buildButton("1", Colors.blue, Colors.white),
              buildButton("2", Colors.blue, Colors.white),
              buildButton("3", Colors.blue, Colors.white),
              buildButton("-", Colors.orange, Colors.white)
            ]),
            Row(children: [
              buildButton(".", Colors.blue, Colors.white),
              buildButton("0", Colors.blue, Colors.white),
              buildButton("00", Colors.blue, Colors.white),
              buildButton("+", Colors.orange, Colors.white)
            ]),
            Row(children: [
              buildButton("√", Colors.purple, Colors.white),
              buildButton("^", Colors.purple, Colors.white),
              buildButton("%", Colors.purple, Colors.white),
              buildButton("C", Colors.red, Colors.white),
              buildButton("=", Colors.green, Colors.white)
            ]),
          ])
        ],
      ),
    );
  }
}

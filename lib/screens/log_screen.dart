import 'package:flutter/material.dart';

class LogScreen extends StatefulWidget {
  static const String id = 'LogScreen';
  String logOutput;
  LogScreen({required this.logOutput});

  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Terminal Output'),
        ),
      ),
      body: Center(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.black,
          child: Text(
            widget.logOutput,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Courier New',
            ),
          ),
        ),
      ),
    );
  }
}

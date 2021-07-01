import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const String id = 'AboutScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Docker App'),
        ),
      ),
    );
  }
}

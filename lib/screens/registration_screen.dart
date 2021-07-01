import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = 'RegistrationScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              // email = value;
            },
            decoration: InputDecoration(
              hintText: "Enter Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: true,
            onChanged: (value) {
              // password = value;
            },
            decoration: InputDecoration(
              hintText: "Enter Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Material(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(10),
            elevation: 10,
            child: MaterialButton(
              minWidth: 200,
              height: 40,
              child: Text('Login'),
              onPressed: () async {},
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;

  LoginButton({required this.buttonTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        10.0,
      ),
      width: 120.0,
      child: Material(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: MaterialButton(
          minWidth: 50,
          height: 40,
          child: Text(buttonTitle),
          onPressed: () => onPressed(),
        ),
      ),
    );
  }
}

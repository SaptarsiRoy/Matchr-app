import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;

  ContainerButton({required this.buttonTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        buttonTitle,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onPressed: () => onPressed(),
    );
  }
}

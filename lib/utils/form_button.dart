import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  FormButton({Key? key, required this.text, required this.onPressed})
    : super(key: key);

  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Colors.amber,
    );
  }
}

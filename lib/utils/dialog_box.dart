import 'package:flutter/material.dart';
import 'package:todo_app/utils/form_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Task'),
      backgroundColor: Colors.amber[200],
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Title",
        ),
      ),
      actions: [
        FormButton(text: "Cancel", onPressed: () => onCancel()),
        FormButton(text: "Save", onPressed: () => onSave()),
      ],
    );
  }
}

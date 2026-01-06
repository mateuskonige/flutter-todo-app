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
      backgroundColor: Colors.amber[200],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "New Task",
              ),
            ),

            //actions (cancel, save)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FormButton(text: "Cancel", onPressed: () => onCancel()),
                SizedBox(width: 8),
                FormButton(text: "Save", onPressed: () => onSave()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

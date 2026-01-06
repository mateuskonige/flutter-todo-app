import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  TodoTile({
    Key? key,
    required this.taskName,
    required this.isCompleted,
    required this.onChanged,
  }) : super(key: key);

  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(value: isCompleted, onChanged: onChanged),
            Text(taskName),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void checkTodo() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(title: Text("To Do App")),
      body: ListView(
        children: [
          TodoTile(
            taskName: "Make work",
            isCompleted: false,
            onChanged: (e) {},
          ),
          TodoTile(
            taskName: "Make exercise",
            isCompleted: true,
            onChanged: (e) {},
          ),
          TodoTile(
            taskName: "Make food",
            isCompleted: false,
            onChanged: (e) {},
          ),
        ],
      ),
    );
  }
}

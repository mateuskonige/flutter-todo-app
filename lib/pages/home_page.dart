import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ["Make work", false],
    ["Make exercise", true],
    ["Make food", false],
  ];

  void changeCheck(bool? value, int index) {
    toDoList[index][1] = !toDoList[index][1];
    //can call to set state after change some values
    setState(() {});
  }

  void saveTask() {
    //or can call set state and add the value inside of it
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });

    //this damn guy close the dialog
    Navigator.of(context).pop();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(title: Text("To Do App"), backgroundColor: Colors.amber),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: "${index + 1}. ${toDoList[index][0]}",
            isCompleted: toDoList[index][1],
            onChanged: (value) => changeCheck(value, index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewTask(),
        child: Icon(Icons.add),
      ),
    );
  }
}

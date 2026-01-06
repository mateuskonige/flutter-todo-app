import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/db.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //call the box
  final _myBox = Hive.box("myBox");
  //and instanciate the database class
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if its the 1st time ever opening the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // theres already exists some data
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void changeCheck(bool? value, int index) {
    db.toDoList[index][1] = !db.toDoList[index][1];
    //can call to setState after change some values
    setState(() {});
    db.updateData();
  }

  void saveTask() {
    //or can call setState and add the value inside of it
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateData();

    //this guy close the dialog box
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

  void deleteTask(int index) {
    db.toDoList.removeAt(index);
    setState(() {});
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(title: Text("To Do App"), backgroundColor: Colors.amber),
      body: db.toDoList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "The list is empty.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Try add a new task in button below"),
                ],
              ),
            )
          : ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: "${index + 1}. ${db.toDoList[index][0]}",
                  isCompleted: db.toDoList[index][1],
                  onChanged: (value) => changeCheck(value, index),
                  deleteFunction: (context) => deleteTask(index),
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

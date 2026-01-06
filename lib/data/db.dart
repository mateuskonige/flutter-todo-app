import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // open the box
  final _myBox = Hive.box("myBox");

  //run this mthod if this is the 1st time EVER opening this app
  void createInitialData() {
    toDoList = [
      ["Welcome!", false],
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}

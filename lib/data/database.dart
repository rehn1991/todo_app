import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  //reference our box
  final _myBox = Hive.box('myBox');

  //run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ['Watch Netflix', false],
      ['Take a walk', false]
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}

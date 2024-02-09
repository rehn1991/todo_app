import 'package:flutter/material.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//text controller
  final _controller = TextEditingController();

  //list of default task
  List toDoList = [
    ['Make a flutter project', false],
    ['Learn Flutter', false]
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void savedNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void createTasks() {
    showDialog(
        context: context,
        builder: (context) {
          return MyDialogBox(
            controller: _controller,
            onSave: savedNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTasks,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoListTile(
              taskName: toDoList[index][0],
              isChecked: toDoList[index][1],
              onChanged: (value) => checkboxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}

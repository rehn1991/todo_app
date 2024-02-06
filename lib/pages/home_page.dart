import 'package:flutter/material.dart';
import 'package:todo_app/util/todo_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ['Make a flutter project', false],
    ['Learn Flutter', false]
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
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
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoListTile(
                taskName: toDoList[index][0],
                isChecked: toDoList[index][1],
                onChanged: (value) => checkboxChanged(value, index));
          }),
    );
  }
}

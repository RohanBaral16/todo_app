import 'package:flutter/material.dart';
import 'package:todo_app/util/dialogbox.dart';
import 'package:todo_app/util/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _controller = TextEditingController();

  List toDoList = [
    ["Make tutorial", false], 
    ["To excercise", false]
  ];

  void CheckBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save new task
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(context: context,
    builder: (context){
      return Dialogbox(
        controller: _controller,
        onSaved: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    });
  }

  // void delete task
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
          backgroundColor: Colors.cyan[900],
          title: Center(child: Text('Not Todo', style: TextStyle(color: Colors.white),)),
          elevation: 20,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => CheckBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),);
        },
        )
      );
  }
}
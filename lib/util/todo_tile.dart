import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  void Function(bool?)? onChanged;

  TodoTile({
    super.key, 
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20 , top: 20),

      child: Container(
        padding: EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(30)
          ),

        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.lightGreen[900],
              ),
            Text(taskName, style: TextStyle(decoration:
            taskCompleted
            ?TextDecoration.lineThrough
            :TextDecoration.none,
            ),),
          ],
        ),
      ), 
    );
  }
}
import 'package:flutter/material.dart';
import 'package:todo_app/util/mybutton.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;

  Dialogbox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSaved,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.cyan[100],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
              hintText: "Add a new task",
              border: OutlineInputBorder(),
              ),
            ), 
            //buttons (save and cancel)
            Row(
              children: [
                //save button
                MyButton(text: "Save", onPressed: onSaved),
                const SizedBox(width: 45,),
                //cancel button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),

          ],
        ),
        ),
    );
  }
}
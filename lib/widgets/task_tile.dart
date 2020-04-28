import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.taskTitle, this.isChecked, this.toggle, this.longPressCallback});

  final String taskTitle;
  final bool isChecked;
  final Function toggle;
  final Function longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: toggle,
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}

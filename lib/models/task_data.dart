import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Buy Milk", isDone: true),
    Task(name: "Buy Eggs"),
    Task(name: "Buy Bread")
  ];

  addTask(taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }

  int get remainingTaskCount {
    return _tasks.where((x) => !x.isDone).length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }
}

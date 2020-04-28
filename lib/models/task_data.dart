import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:collection';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  SharedPreferences prefs;

  TaskData() {
    startPreferences();
  }

  startPreferences() async {
    prefs = await SharedPreferences.getInstance();

    final names = prefs.getStringList('names') ?? [];
    final status = prefs.getStringList('status') ?? [];

    List<Task> storedTasks = [];
    for (int i = 0; i < names.length; i++) {
      storedTasks.add(Task(name: names[i], isDone: status[i] == 'true'));
    }
    _tasks = storedTasks;
    
     notifyListeners();
  }

  addTask(taskName) {
    _tasks.add(Task(name: taskName));
    saveToStorage();
    notifyListeners();
  }

  updateTask(Task task) {
    task.toggleDone();
    saveToStorage();
    notifyListeners();
  }

  removeTask(Task task) {
    _tasks.remove(task);
    saveToStorage();
    notifyListeners();
  }

  saveToStorage() async {
    List<String> names = [];
    List<String> status = [];

    _tasks.forEach((x) {
      names.add(x.name);
      status.add(x.isDone.toString());
    });

    await prefs.setStringList("names", names);
    await prefs.setStringList("status", status);

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

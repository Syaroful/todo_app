import 'package:flutter/material.dart';
import 'package:todo_app/model/data.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/model/task_category.dart';

class TaskViewmodel extends ChangeNotifier {
  List<Task> tasks = [];

  String? taskName;
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  String? taskDescription;
  TaskCategory? taskCategory = taskCategories[0];

  bool get isValid =>
      taskName != null &&
      taskCategory != null &&
      dateController.text.isNotEmpty &&
      timeController.text.isNotEmpty;

  setTaskName(String? value) {
    taskName = value;
    notifyListeners();
  }

  setTaskDescription(String? value) {
    taskDescription = value;
    notifyListeners();
  }

  setTaskCategory(TaskCategory? value) {
    taskCategory = value;
    notifyListeners();
  }

  setDate(DateTime? date) {
    if (date == null) return;

    DateTime currentDate = DateTime.now();
    DateTime now =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    int diff = date.difference(now).inDays;

    if (diff == 0) {
      dateController.text = 'Today';
    } else if (diff == 1) {
      dateController.text = 'Tomorrow';
    } else {
      dateController.text = '${date.day}/${date.month}/${date.year}';
    }

    notifyListeners();
  }

  setTime(TimeOfDay? time) {
    if (time == null) return;
    timeController.text = '${time.hour}:${time.minute}';
    notifyListeners();
  }

  addTask() {
    if (!isValid) return;

    final task = Task(
      taskName!,
      taskDescription!,
      timeController.text,
      dateController.text,
      taskCategory!,
    );
    tasks.add(task);
    timeController.clear();
    dateController.clear();
    notifyListeners();
  }
}

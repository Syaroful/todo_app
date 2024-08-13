import 'package:todo_app/model/task_category.dart';

class Task {
  String title;
  String description;
  String time;
  String date;
  TaskCategory category;

  Task(this.title, this.description, this.time, this.date, this.category);
}

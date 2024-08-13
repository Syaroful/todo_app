import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/icons.dart';
import 'package:todo_app/model/task_category.dart';

List<TaskCategory> taskCategories = [
  TaskCategory(
    name: "Work",
    icon: AppIcon.work,
    color: AppColor.primary,
  ),
  TaskCategory(
    name: "Personal",
    icon: AppIcon.personal,
    color: AppColor.green,
  ),
  TaskCategory(
    name: "Finance",
    icon: AppIcon.finance,
    color: AppColor.orange,
  ),
  TaskCategory(
    name: "Shopping",
    icon: AppIcon.shopping,
    color: AppColor.purple,
  ),
  TaskCategory(
    name: "Household",
    icon: AppIcon.household,
    color: AppColor.yellow,
  ),
];

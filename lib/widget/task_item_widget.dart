import 'package:flutter/material.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/model/task.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
          color: task.category.color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: task.category.color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              task.category.icon,
              width: 32,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                      color: AppColor.indigoDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${task.date}, ${task.time}',
                  style: const TextStyle(
                      color: AppColor.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

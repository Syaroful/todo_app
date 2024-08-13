import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/viewmodel/task_viewmodel.dart';
import 'package:todo_app/widget/add_task_dialog.dart';
import 'package:todo_app/widget/task_item_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upcoming Tasks',
          style: TextStyle(
              color: AppColor.indigoDark,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const AddTaskDialog();
              });
        },
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: Consumer<TaskViewmodel>(builder: (context, taskProvider, _) {
        return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskProvider.tasks[index];
              return TaskItemWidget(task: task);
            },
            itemCount: taskProvider.tasks.length);
      }),
    );
  }
}

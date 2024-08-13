import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/data.dart';
import 'package:todo_app/model/task_category.dart';
import 'package:todo_app/viewmodel/task_viewmodel.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  TaskCategory? _sellectedCategory = taskCategories[0];

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;

    final taskProvider = Provider.of<TaskViewmodel>(context, listen: true);
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: sw * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text("New task"),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  taskProvider.setTaskName(value);
                },
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  taskProvider.setTaskDescription(value);
                },
              ),
              const SizedBox(height: 8),
              // create a dropdown button to select the task category
              DropdownButton<TaskCategory>(
                value: _sellectedCategory,
                isExpanded: true,
                items: taskCategories
                    .map(
                      (e) => DropdownMenuItem<TaskCategory>(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                onChanged: (TaskCategory? value) {
                  setState(() {
                    _sellectedCategory = value;
                    taskProvider.setTaskCategory(value);
                  });
                },
              ),
              const SizedBox(height: 8),
              // crate time picker here
              ElevatedButton(
                onPressed: () async {
                  TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  taskProvider.setTime(time);
                },
                child: const Text("Select Time"),
              ),
              const SizedBox(height: 8),
              // create date picker here
              ElevatedButton(
                onPressed: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 1),
                  );
                  taskProvider.setDate(date);
                },
                child: const Text("Select Date"),
              ),
              ElevatedButton(
                onPressed: () {
                  taskProvider.addTask();
                  Navigator.pop(context);
                },
                child: const Text("Add Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

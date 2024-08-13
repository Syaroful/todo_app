import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screen/task_screen.dart';
import 'package:todo_app/viewmodel/task_viewmodel.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskViewmodel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: const TaskScreen(),
      ),
    );
  }
}

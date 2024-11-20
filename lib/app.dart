import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_bloc/logic/todo_bloc.dart';
import 'package:todo_using_bloc/presentation/screens/home.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (context) => TodoBloc(),
      child: MaterialApp(
        title: 'Todo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

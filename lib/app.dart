import 'package:flex_color_scheme/flex_color_scheme.dart';
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
        theme: FlexThemeData.light(scheme: FlexScheme.aquaBlue),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.aquaBlue),
        home: const HomeScreen(),
      ),
    );
  }
}

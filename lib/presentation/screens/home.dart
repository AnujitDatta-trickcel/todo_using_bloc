import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_bloc/data/models/todo_model.dart';
import 'package:todo_using_bloc/logic/todo_bloc.dart';
import 'package:todo_using_bloc/presentation/screens/add.dart';

import '../widgets/home_screen/add_button.dart';
import '../widgets/home_screen/delete_all_todo_button.dart';
import '../widgets/home_screen/empty_notation.dart';
import '../widgets/home_screen/loading_notation.dart';
import '../widgets/home_screen/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    int length = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        centerTitle: true,
        actions: const [
          DeleteAllTodoButton()
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoListFetched) {
            length = state.todos.length;
            return Visibility(
              visible: state.todos.isNotEmpty,
              replacement: const EmptyNotation(),
              child: TodoList(length: length,state: state,),
            );
          } else {
            return const LoadingNotation();
          }
        },
      ),
      floatingActionButton: AddButton(length: length,),
    );
  }
}







import 'package:flutter/material.dart';
import 'package:todo_using_bloc/presentation/widgets/home_screen/todo_item.dart';
import '../../../logic/todo_bloc.dart';
import '../../screens/add.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.length,
    required this.state,
  });
  final TodoListFetched state;
  final int length;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: state.todos.length,
      separatorBuilder: (context, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTodoScreen(
                  length: length,
                  isNew: false,
                  todo: state.todos[index],
                ),
              ),
            );
          },
          child: TodoItem(state: state, index: index),
        );
      },
    );
  }
}

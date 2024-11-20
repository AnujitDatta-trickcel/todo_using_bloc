import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/todo_bloc.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.state,
    required this.index,
  });
  final TodoListFetched state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text((index + 1).toString()),
        ),
        title: Text(
          state.todos[index].title,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(state.todos[index].description),
        trailing: IconButton(
          onPressed: () {
            context.read<TodoBloc>().add(Delete(id: state.todos[index].id));
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}

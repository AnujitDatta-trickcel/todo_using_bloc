import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/todo_bloc.dart';

class DeleteAllTodoButton extends StatelessWidget {
  const DeleteAllTodoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<TodoBloc>().add(Clear());
      },
      icon: const Icon(Icons.delete_sweep),
    );
  }
}

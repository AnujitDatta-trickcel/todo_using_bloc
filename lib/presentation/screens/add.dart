import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_bloc/data/models/todo_model.dart';
import 'package:todo_using_bloc/logic/todo_bloc.dart';

import '../widgets/add_screen/discription_field.dart';
import '../widgets/add_screen/title_field.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen(
      {super.key, required this.isNew, this.todo});

  final bool isNew;
  final Todo? todo;

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTEC = TextEditingController();
  final TextEditingController _descriptionTEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (!widget.isNew) {
      _titleTEC.text = widget.todo!.title;
      _descriptionTEC.text = widget.todo!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              checkButtonPressed(context);
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TitleField(titleTEC: _titleTEC),
              const SizedBox(height: 20),
              DescriptionField(descriptionTEC: _descriptionTEC),
            ],
          ),
        ),
      ),
    );
  }

  void checkButtonPressed(BuildContext context,) {
    if (_formKey.currentState!.validate()) {
      if (widget.isNew) {
        addTodo(context);
      } else {
        updateTodo(context);
      }
      context.read<TodoBloc>().add(Fetch());
      Navigator.pop(context);
    }
  }

  void updateTodo(BuildContext context) {
    Todo updatedTodo = widget.todo!;
    updatedTodo.title = _titleTEC.text.trim();
    updatedTodo.description = _descriptionTEC.text;
    context
        .read<TodoBloc>()
        .add(Update(updatedTodo: updatedTodo));
  }

  void addTodo(BuildContext context) {
    context.read<TodoBloc>().add(Add(
        newTodo: Todo(
          id: 0,
          title: _titleTEC.text.trim(),
          description: _descriptionTEC.text,
        )));
  }
}


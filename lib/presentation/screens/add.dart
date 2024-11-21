import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:todo_using_bloc/data/models/todo_model.dart';
import 'package:todo_using_bloc/logic/todo_bloc.dart';

import '../widgets/add_screen/description_field.dart';
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
  final form=FormGroup({
    'title': FormControl<String>(
      validators: [Validators.required],
    ),
    'description': FormControl<String>(),
  });

  String get title => form.control('title').value;
  set title(String value) => form.control('title').value = value;
  String get description => form.control('description').value;
  set description(String value) => form.control('description').value = value;

  @override
  void initState() {
    super.initState();
    if (!widget.isNew) {
      title = widget.todo!.title;
      description = widget.todo!.description;
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
      body: ReactiveForm(
        formGroup: form,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TitleField(),
              SizedBox(height: 20),
              DescriptionField(),
            ],
          ),
        ),
      ),
    );
  }

  void checkButtonPressed(BuildContext context) {
    if (form.valid) {
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
    updatedTodo.title = title;
    updatedTodo.description = description;
    context
        .read<TodoBloc>()
        .add(Update(updatedTodo: updatedTodo));
  }

  void addTodo(BuildContext context) {
    context.read<TodoBloc>().add(Add(
        newTodo: Todo(
          id: 0,
          title: title,
          description: description,
        )));
  }
}




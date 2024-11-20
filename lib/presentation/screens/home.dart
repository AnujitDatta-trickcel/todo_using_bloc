import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_bloc/data/models/todo_model.dart';
import 'package:todo_using_bloc/logic/todo_bloc.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return Visibility(
            visible: state is TodoListFetched,
            replacement: const Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
            ),
            child: ListView.separated(
              itemCount: state is TodoListFetched ? state.todos.length : 0,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text(state is TodoListFetched?state.todos[index].id.toString():index.toString()),),
                  title: Text(state is TodoListFetched? state.todos[index].title+state.todos[index].id.toString():'Dummy Title'),
                  subtitle: Text(state is TodoListFetched? state.todos[index].description:'This is a dummy todo item'),
                  trailing: const Icon(Icons.delete),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<TodoBloc>().add(Add(newTodo: Todo(
            id: 1,
            title: 'Todo',
            description: 'This is a todo example',
          )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

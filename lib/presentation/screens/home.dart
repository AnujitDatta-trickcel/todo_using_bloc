
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_bloc/logic/todo_bloc.dart';
import 'package:todo_using_bloc/presentation/screens/table.dart';
import '../widgets/home_screen/add_button.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        centerTitle: true,
        actions: [
          //DeleteAllTodoButton()
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TableScreen()));
            },
            icon: const Icon(Icons.table_view),
          ),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoListFetched) {
            return Visibility(
              visible: state.todos.isNotEmpty,
              replacement: const EmptyNotation(),
              child: TodoList(state: state,),
            );
          } else {
            return const LoadingNotation();
          }
        },
      ),
      floatingActionButton: const AddButton(),
    );
  }
}







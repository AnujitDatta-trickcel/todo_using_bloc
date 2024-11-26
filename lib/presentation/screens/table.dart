import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_bloc/logic/todo_bloc.dart';

import '../../data/models/todo_model.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table'),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoListFetched) {
            return DataTable2(
              minWidth: 500,
              lmRatio: 2,
              smRatio: 0.5,
              columnSpacing: 30,
              columns: const [
                DataColumn2(label: Text('Id'),size: ColumnSize.S,numeric: true),
                DataColumn2(label: Text('Status'),size: ColumnSize.S),
                DataColumn2(label: Text('Todo'),size: ColumnSize.M),
                DataColumn2(label: Text('Description'),size: ColumnSize.L),
              ],
              rows: List.generate(
                state.todos.length*10,
                (index) => DataRow2(
                  cells: [
                    DataCell(FittedBox(child: Text((index+1).toString()))),
                    DataCell(
                      SizedBox(
                        width: 10,
                        child: Checkbox(
                          value: state.todos[index%state.todos.length].isCompleted,
                          onChanged: (value) {
                            Todo updatedTodo = state.todos[index%state.todos.length];
                            updatedTodo.isCompleted = value!;
                            context.read<TodoBloc>().add(
                              Update(updatedTodo: updatedTodo),
                            );
                          },
                        ),
                      ),
                    ),
                    DataCell(Text(state.todos[index%state.todos.length].title)),
                    DataCell(Text(state.todos[index%state.todos.length].description,softWrap: false,)),
                  ],
                  color: index%2!=0
                      ? WidgetStateProperty.all(Colors.grey[300])
                      : WidgetStateProperty.all(Colors.transparent),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

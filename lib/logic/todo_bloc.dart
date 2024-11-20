import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_using_bloc/data/models/todo_model.dart';
import 'package:todo_using_bloc/data/repositories/shared_prefs.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoListLoading()) {

    on<Fetch>((event, emit) async{
      final List<Todo> todos = await LocalData.load();
      await Future.delayed(const Duration(seconds: 2));
      emit(TodoListFetched(todos: todos));
    });

    on<Add>((event,emit)async{
      final List<Todo> todos = await LocalData.load();
      event.newTodo.id=todos.length+1;
      todos.add(event.newTodo);
      await LocalData.save(todos);
      emit(TodoListFetched(todos: todos));
    });

  }
}

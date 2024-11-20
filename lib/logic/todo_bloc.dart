import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_using_bloc/data/models/todo_model.dart';
import 'package:todo_using_bloc/data/data_providers/shared_prefs.dart';
import 'package:todo_using_bloc/data/repositories/todo_ripo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoListLoading()) {
    on<Fetch>((event, emit) async {
      final List<Todo> todos = await TodoRepository.getAllTodos();
      await Future.delayed(const Duration(seconds: 2));
      emit(TodoListFetched(todos: todos));
    });

    on<Add>((event, emit) async {
      await TodoRepository.addTodo(event.newTodo);
      emit(TodoListFetched(todos: LocalData.todos));
    });

    on<CompleteTodoStatus>((event, emit) async {
      await TodoRepository.completeTodo(event.id);
      emit(TodoListFetched(todos: LocalData.todos));
    });

    on<Delete>((event, emit) async {
      await TodoRepository.deleteTodo(event.id);
      emit(TodoListFetched(todos: LocalData.todos));
    });

    on<Update>((event, emit) async {
      await TodoRepository.updateTodo(event.updatedTodo);
      emit(TodoListFetched(todos: LocalData.todos));
    });

    on<Clear>((event, emit) async {
      await TodoRepository.clear();
      emit(TodoListFetched(todos: LocalData.todos));
    });

    on<Get>((event, emit) {
      emit(SingleTodoGot(todo: TodoRepository.getTodo(event.id)));
    });
  }
}

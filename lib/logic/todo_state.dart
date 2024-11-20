
part of 'todo_bloc.dart';

abstract class TodoState {}

class TodoListLoading extends TodoState {
  TodoListLoading();
}

class TodoListFetched extends TodoState {
  final List<Todo> todos;
  TodoListFetched({required this.todos});
}

class SingleTodoGot extends TodoState{
  final Todo todo;
  SingleTodoGot({required this.todo});
}


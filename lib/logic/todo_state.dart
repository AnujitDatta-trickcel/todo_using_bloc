
part of 'todo_bloc.dart';

abstract class TodoState {}

class TodoListLoading extends TodoState {
  final List<Todo> todos;
  TodoListLoading({this.todos=const[]});
}

class TodoListFetched extends TodoState {
  final List<Todo> todos;
  TodoListFetched({required this.todos});
}


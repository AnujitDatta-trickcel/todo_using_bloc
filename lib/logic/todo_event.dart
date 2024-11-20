part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
}

class Fetch extends TodoEvent{
  @override
  List<Object?> get props => [];
}
class Clear extends TodoEvent{
  @override
  List<Object?> get props => [];
}

class Add extends TodoEvent{
  final Todo newTodo;
  const Add({required this.newTodo});
  @override
  List<Object?> get props => [newTodo];
}
class Complete extends TodoEvent{
  final int id;
  const Complete({required this.id});
  @override
  List<Object?> get props => [id];
}
class Update extends TodoEvent{
  final int id;
  const Update({required this.id});
  @override
  List<Object?> get props => [id];
}
class Delete extends TodoEvent{
  final int id;
  const Delete({required this.id});
  @override
  List<Object?> get props => [id];
}
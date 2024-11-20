part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
}

class Fetch extends TodoEvent{  //Done
  @override
  List<Object?> get props => [];
}

class Clear extends TodoEvent{ //Done
  @override
  List<Object?> get props => [];
}

class Get extends TodoEvent{  //Done
  final int id;
  const Get({required this.id});
  @override
  List<Object?> get props => [];
}

class Add extends TodoEvent{ //Done
  final Todo newTodo;
  const Add({required this.newTodo});
  @override
  List<Object?> get props => [newTodo];
}
class CompleteTodoStatus extends TodoEvent{ //Done
  final int id;
  const CompleteTodoStatus({required this.id});
  @override
  List<Object?> get props => [id];
}
class Update extends TodoEvent{ //Done
  final Todo updatedTodo;
  const Update({required this.updatedTodo});
  @override
  List<Object?> get props => [updatedTodo];
}
class Delete extends TodoEvent{ //Done
  final int id;
  const Delete({required this.id});
  @override
  List<Object?> get props => [id];
}
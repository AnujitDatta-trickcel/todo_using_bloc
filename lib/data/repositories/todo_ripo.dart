import 'package:todo_using_bloc/data/data_providers/shared_prefs.dart';
import '../models/todo_model.dart';

class TodoRepository {
  static clear()async{
    await LocalData.clear();
  }
  static Future<List<Todo>> getAllTodos()async{
    return await LocalData.load();
  }
  static Todo getTodo(int id){
    Todo todo = LocalData.todos.firstWhere((e)=>e.id==id);
    return todo;
  }
  static Future<void> addTodo(Todo todo)async{
    LocalData.todos.add(todo);
    await LocalData.save();
  }
  static Future<void> deleteTodo(int id)async{
    LocalData.todos.removeWhere((todo)=>todo.id==id);
    await LocalData.save();
  }
  static Future<void> completeTodo(int id)async{
    int index = LocalData.todos.indexWhere((data) => data.id == id);
    LocalData.todos[index].isCompleted=true;
    await LocalData.save();
  }
  static Future<void> updateTodo(Todo updatedTodo)async{
    int index = LocalData.todos.indexWhere((data) => data.id == updatedTodo.id);
    LocalData.todos[index]=updatedTodo;
    LocalData.save();
  }
}
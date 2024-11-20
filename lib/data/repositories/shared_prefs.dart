import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_using_bloc/data/models/todo_model.dart';


class LocalData{
  static List<Todo> todos=[];
  static Future<void> save(List<Todo> givenTodos)async{
    todos=givenTodos;
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String data=jsonEncode(todos.map((e) => e.toJson()).toList());
    await prefs.setString('todos', data);
  }
  static Future<List<Todo>> load()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String? data=prefs.getString('todos');
    if(data==null){
      return [];
    }
    List<dynamic> decodedData=jsonDecode(data);
     List<Todo> decodedTodos= decodedData.map((e) => Todo.fromJson(e)).toList();
     return decodedTodos;
  }
  static Future<void> addTodo(Todo todo)async{
    todos.add(todo);
    await save(todos);
  }
  static Future<void> deleteTodo(int id)async{
    todos.removeWhere((todo)=>todo.id==id);
    save(todos);
  }
  static Future<void> completeTodo(int id)async{
    int index = todos.indexWhere((data) => data.id == id);
    todos[index].isCompleted=true;
  }
  static Future<void> updateTodo(Todo updatedTodo)async{
    int index = todos.indexWhere((data) => data.id == updatedTodo.id);
    todos[index]=updatedTodo;
    save(todos);
  }
}
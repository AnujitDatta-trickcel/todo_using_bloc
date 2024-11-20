import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_using_bloc/data/models/todo_model.dart';


class LocalData{
  static List<Todo> todos=[];
  static Future<void> save()async{
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
     todos=decodedTodos;
     return todos;
  }
  static clear()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    todos.clear();
    prefs.clear();
  }
}
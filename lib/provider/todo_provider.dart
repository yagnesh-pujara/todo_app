import 'package:flutter/material.dart';
import 'package:todo_app/database/hive_service.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  void createTodoTask(String data) {
    HiveService().addTodo(TodoModel(todoTitle: data));
    notifyListeners();
  }

  void deleteTodoTask(int index) {
    HiveService().deleteTodo(index);
    notifyListeners();
  }

  void updateTodoTask(int index, String data) {
    HiveService().updateTodo(index, TodoModel(todoTitle: data));
  }

  void deleteAllTodo() {}

  List<TodoModel> getAllTodoTask() {
    return HiveService().getAll();
  }
}

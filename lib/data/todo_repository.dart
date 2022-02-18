import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hey_task/data/i_todo_repository.dart';
import 'package:hey_task/domain/domain.dart';
import 'package:hey_task/data/drift/todo_database.dart';
import 'package:hey_task/data/drift/db_domain_bridging.dart';

import '../utils.dart';

class TodoRepository implements ITodoRepository {
  HeyTaskDatabase db;

  TodoRepository({required this.db});

  @override
  Future<List<Todo>> getAllTodos() async {
    var result = await db.getAllTodos();

    return Future.value(result.map((e) => e.asTodoModel).toList());
  }

  @override
  Stream<List<Todo>> getCompletedTodos() {
    // TODO: implement getCompletedTodos
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getCompletedTodosByDate(DateTime dateTime) {
    // TODO: implement getCompletedTodosByDate
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodosByCategory(Category category) {
    // TODO: implement getTodoByTag
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodosByDate(DateTime dateTime) {
    // TODO: implement getTodosByDate
    throw UnimplementedError();
  }

  @override
  Future<void> markTodoCompleted(Todo todo) {
    // TODO: implement markTodoCompleted
    throw UnimplementedError();
  }

  @override
  Stream<List<Todo>> watchTodos() {
    var elements = [
      Todo(id: 1, title:"Go shopping", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
      Todo(id: 1, title:"Go hunting", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
      Todo(id: 1, title:"Go beering", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
      Todo(id: 1, title:"Go having fun", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
      Todo(id: 1, title:"Go running", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
      Todo(id: 1, title:"Go playing", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
      Todo(id: 1, title:"Go see museum", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
      Todo(id: 1, title:"Go calling a teacher", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
      Todo(id: 1, title:"Go laughing", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
      Todo(id: 1, title:"Go nesting", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
      Todo(id: 1, title:"Go tuning the guitar", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
      Todo(id: 1, title:"Go masking", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
      Todo(id: 1, title:"Go rising the bar", description: "I have to go shopping tomorrow",subTasks: null, dueDate: DateTime.now(),category: null),
    ];
    return db.watchTodos().map((event) => event.map((e) => e.asTodoModel).toList());
  }

   Future<List<Todo>> test(List<Todo> todos) async {
    return todos;
  }

  @override
  Future<List<SubTask>> getAllTaskSubtasks(int todoId) async{
    var result = await db.getAllSubTasks(todoId);
    return Future.value(result.map((e) => e.asSubTaskModel).toList());
  }

  @override
  Future<void> insertTodo(Todo todo) async {
    db.insertTodo(todo.asDto);
  }

  @override
  Future<Result> deleteTodo(Todo todo) async {
    final output = await db.deleteTodo(todo.id);
    if(output < 1){
      return const Result.error('error deleting from database');
    }
    return Future.value(Result(output));
  }
}
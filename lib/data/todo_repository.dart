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
  Future markTodoCompleted(int todoId) {
    return db.markTodoCompleted(todoId);
  }

  @override
  Stream<List<Todo>> watchTodos() {
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
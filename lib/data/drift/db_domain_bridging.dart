import 'package:drift/drift.dart';
import 'package:hey_task/domain/domain.dart';

import 'todo_database.dart';

extension TodoWithCategoryToDomain on TodoWithCategory {
  Todo get asTodoModel => Todo(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      subTasks: null,
      dueDate: todo.dueDate,
      category: category.asCategoryModel,
      completed: todo.completed);
}

extension SubTaskWithTaskToDomain on SubtaskWithTask {
  SubTask get asSubTaskModel => SubTask(
        id: subTask.id,
        description: subTask.description,
        completed: subTask.completed,
      );
}

extension on DriftCategory {
  Category get asCategoryModel => Category(name: name, color:1);
}

extension TodoToDriftTodo on Todo {
  DriftTodosCompanion get asDto => DriftTodosCompanion(
      id: Value.absent(),
      title: Value(title),
      description:
          description == null ? const Value.absent() : Value(description),
      categoryId: const Value.absent(),
      dueDate: dueDate == null ? Value.absent() : Value(dueDate));
}

extension DriftTodoToTodo on DriftTodo {
  Todo get asTodoModel => Todo(
      id: id,
      title: title,
      description: description,
      subTasks: null,
      dueDate: dueDate,
      completed: completed,
      category: null);
}

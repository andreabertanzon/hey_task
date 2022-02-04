import 'package:hey_task/domain/domain.dart';

import 'todo_database.dart';

extension TodoWithCategoryToDomain on TodoWithCategory{
  Todo get asTodoModel =>
      Todo(id: todo.id,
        title: todo.title,
        description: todo.description,
        subTasks: null,
        dueDate: todo.dueDate,
        category: category.asCategoryModel
      );
}

extension SubTaskWithTaskToDomain on SubtaskWithTask{
  SubTask get asSubTaskModel =>
      SubTask(
        id: subTask.id,
        description: subTask.description,
        completed : subTask.completed,
      );
}


extension on DriftCategory{
  Category get asCategoryModel => Category(name: name);
}
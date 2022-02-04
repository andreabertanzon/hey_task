import 'package:hey_task/data/i_todo_repository.dart';
import 'package:hey_task/domain/domain.dart';
import 'package:hey_task/data/drift/todo_database.dart';
import 'package:hey_task/data/drift/db_domain_bridging.dart';

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
    // TODO: implement watchTodos
    throw UnimplementedError();
  }

  @override
  Future<List<SubTask>> getAllTaskSubtasks(int todoId) async{
    var result = await db.getAllSubTasks(todoId);
    return Future.value(result.map((e) => e.asSubTaskModel).toList());
  }

}

/*
* KEEP IN MIND
* Stream<List<CategoryWithTasks>> watchAllCategories() {
    return (select(categories)
          ..orderBy(([
            (c) => OrderingTerm(expression: c.name),
          ])))
        .join([leftOuterJoin(tasks, tasks.categoryId.equalsExp(categories.id))])
        .watch()
        .map((rows) {
          final groupedData = <Category, List<Task>>{};

          for (final row in rows) {
            final category = row.readTable(categories);
            final task = row.readTable(tasks);

            final list = groupedData.putIfAbsent(category, () => []);
            if (task != null) list.add(task);
          }

          return [
            for (final entry in groupedData.entries)
              CategoryWithTasks(category: entry.key, tasks: entry.value)
          ];
        });
  }
*
* */
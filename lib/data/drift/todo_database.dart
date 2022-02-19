import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'todo_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'hey_db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [DriftTodos, DriftSubTasks, DriftCategories])
class HeyTaskDatabase extends _$HeyTaskDatabase {
  @override
  int get schemaVersion => 1;

  HeyTaskDatabase() : super(_openConnection());

  /// Gets all DriftTodos joined with DriftCategories as a Future.
  /// It does not contain the subtasks of each Todos.
  Future<List<TodoWithCategory>> getAllTodos() {
    final query = select(driftTodos).join([
      innerJoin(
          driftCategories, driftCategories.id.equalsExp(driftTodos.categoryId)),
    ]);

    var result = query.map((row) {
      final todo = row.readTable(driftTodos);
      final category = row.readTable(driftCategories);
      var result = TodoWithCategory(todo: todo, category: category);
      return result;
    }).get();
    return result;
  }

  /// Gets a Stream of Todos that can be observed by the final receiver
  Stream<List<DriftTodo>> watchTodos() {
    return select(driftTodos).watch();
  }

  /// Inserts a new DriftTodo inside the Database
  /// you should call asDto to transform the Todo to the correspondent
  /// DriftTodo.
  Future insertTodo(DriftTodosCompanion todo) => into(driftTodos).insert(todo);

  /// Gets all the subTasks connected with a TaskId.
  /// It does not contain the category of the DriftTodo
  /// connected with the specific SubTask.
  Future<List<SubtaskWithTask>> getAllSubTasks(int taskId) {
    final query = select(driftSubTasks).join(
        [innerJoin(driftTodos, driftTodos.id.equalsExp(driftSubTasks.todoId))]);
    var result = query.map((row) {
      final subTask = row.readTable(driftSubTasks);
      final todo = row.readTable(driftTodos);
      var result = SubtaskWithTask(subTask: subTask, todo: todo);
      return result;
    }).get();
    return result;
  }

  /// Inserts a new DriftSubtask inside the Database
  /// you should call asDto to transform the SubTask to the correspondent
  /// DriftSubtask.
  Future insertSubTask(Insertable<DriftSubTask> subTask) =>
      into(driftSubTasks).insert(subTask);

  /// Gets all the Categories.
  Future<List<SubtaskWithTask>> getAllCategories(int taskId) {
    final query = select(driftSubTasks).join(
        [innerJoin(driftTodos, driftTodos.id.equalsExp(driftSubTasks.todoId))]);
    var result = query.map((row) {
      final subTask = row.readTable(driftSubTasks);
      final todo = row.readTable(driftTodos);
      var result = SubtaskWithTask(subTask: subTask, todo: todo);
      return result;
    }).get();
    return result;
  }

  /// Inserts a new DriftCategory inside the Database
  /// you should call asDto to transform the Category to the correspondent
  /// DriftCategory.
  Future insertCategory(Insertable<DriftCategory> category) =>
      into(driftCategories).insert(category);

  /// Deletes from DriftTodo and returns the number of rows affected
  /// when the number of rows is less than 1, delete did not work!
  Future<int> deleteTodo(int taskId) =>
      (delete(driftTodos)..where((tbl) => tbl.id.equals(taskId))).go();

  Future markTodoCompleted(int todoId) {
    return (update(driftTodos)
      ..where((t) => t.id.equals(todoId))
    ).write(const DriftTodosCompanion(
      completed: Value(true),
    ),
  );
  }
}

//************ Classes ***********************

@DataClassName("DriftTodo")
class DriftTodos extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get description => text().nullable()();

  IntColumn get categoryId => integer()
      .nullable()
      .customConstraint('NULL REFERENCES DriftCategory(id)')();

  DateTimeColumn get dueDate => dateTime().nullable()();

  DateTimeColumn get creationDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  DateTimeColumn get lastUpdateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}

@DataClassName("DriftSubTask")
class DriftSubTasks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get description => text()();

  BoolColumn get completed => boolean().withDefault(const Constant(false))();

  IntColumn get todoId =>
      integer().customConstraint('REFERENCES DriftTodo(id)')();
}

@DataClassName("DriftCategory")
class DriftCategories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
}

class SubtaskWithTask {
  final DriftSubTask subTask;
  final DriftTodo todo;

  SubtaskWithTask({required this.subTask, required this.todo});
}

class TodoWithCategory {
  final DriftTodo todo;
  final DriftCategory category;

  TodoWithCategory({required this.todo, required this.category});
}

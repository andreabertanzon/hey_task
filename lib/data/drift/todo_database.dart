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

  Future<List<TodoWithCategory>> getAllTodos() {
    final query = select(driftTodos).join([
      innerJoin(
          driftCategories, driftCategories.id.equalsExp(driftTodos.categoryId)),
    ]);

    var result = query.map((row) {
      final todo = row.readTable(driftTodos);
      final category = row.readTable(driftCategories);
      return TodoWithCategory(
          todo: todo,
          category: category);
    }).get();
    return result;
  }
}

@DataClassName("DriftTodo")
class DriftTodos extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get description => text().nullable()();

  IntColumn get categoryId => integer()
      .nullable()
      .customConstraint('NULL REFERENCES DriftCategory(id)')();

  DateTimeColumn get creationDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  DateTimeColumn get lastUpdateDate =>
      dateTime().withDefault(Constant(DateTime.now()))();

  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}
@DataClassName("DriftSubTask")
class DriftSubTasks extends Table {
  IntColumn get id => integer().autoIncrement()();

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

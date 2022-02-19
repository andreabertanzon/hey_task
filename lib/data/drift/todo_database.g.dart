// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DriftTodo extends DataClass implements Insertable<DriftTodo> {
  final int id;
  final String title;
  final String? description;
  final int? categoryId;
  final DateTime? dueDate;
  final DateTime creationDate;
  final DateTime lastUpdateDate;
  final bool completed;
  DriftTodo(
      {required this.id,
      required this.title,
      this.description,
      this.categoryId,
      this.dueDate,
      required this.creationDate,
      required this.lastUpdateDate,
      required this.completed});
  factory DriftTodo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DriftTodo(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      categoryId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id']),
      dueDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date']),
      creationDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_date'])!,
      lastUpdateDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_update_date'])!,
      completed: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}completed'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int?>(categoryId);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime?>(dueDate);
    }
    map['creation_date'] = Variable<DateTime>(creationDate);
    map['last_update_date'] = Variable<DateTime>(lastUpdateDate);
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  DriftTodosCompanion toCompanion(bool nullToAbsent) {
    return DriftTodosCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      creationDate: Value(creationDate),
      lastUpdateDate: Value(lastUpdateDate),
      completed: Value(completed),
    );
  }

  factory DriftTodo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTodo(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
      lastUpdateDate: serializer.fromJson<DateTime>(json['lastUpdateDate']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'categoryId': serializer.toJson<int?>(categoryId),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'lastUpdateDate': serializer.toJson<DateTime>(lastUpdateDate),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  DriftTodo copyWith(
          {int? id,
          String? title,
          String? description,
          int? categoryId,
          DateTime? dueDate,
          DateTime? creationDate,
          DateTime? lastUpdateDate,
          bool? completed}) =>
      DriftTodo(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        categoryId: categoryId ?? this.categoryId,
        dueDate: dueDate ?? this.dueDate,
        creationDate: creationDate ?? this.creationDate,
        lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
        completed: completed ?? this.completed,
      );
  @override
  String toString() {
    return (StringBuffer('DriftTodo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('categoryId: $categoryId, ')
          ..write('dueDate: $dueDate, ')
          ..write('creationDate: $creationDate, ')
          ..write('lastUpdateDate: $lastUpdateDate, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, categoryId, dueDate,
      creationDate, lastUpdateDate, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftTodo &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.categoryId == this.categoryId &&
          other.dueDate == this.dueDate &&
          other.creationDate == this.creationDate &&
          other.lastUpdateDate == this.lastUpdateDate &&
          other.completed == this.completed);
}

class DriftTodosCompanion extends UpdateCompanion<DriftTodo> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<int?> categoryId;
  final Value<DateTime?> dueDate;
  final Value<DateTime> creationDate;
  final Value<DateTime> lastUpdateDate;
  final Value<bool> completed;
  const DriftTodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.lastUpdateDate = const Value.absent(),
    this.completed = const Value.absent(),
  });
  DriftTodosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.lastUpdateDate = const Value.absent(),
    this.completed = const Value.absent(),
  }) : title = Value(title);
  static Insertable<DriftTodo> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String?>? description,
    Expression<int?>? categoryId,
    Expression<DateTime?>? dueDate,
    Expression<DateTime>? creationDate,
    Expression<DateTime>? lastUpdateDate,
    Expression<bool>? completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (categoryId != null) 'category_id': categoryId,
      if (dueDate != null) 'due_date': dueDate,
      if (creationDate != null) 'creation_date': creationDate,
      if (lastUpdateDate != null) 'last_update_date': lastUpdateDate,
      if (completed != null) 'completed': completed,
    });
  }

  DriftTodosCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<int?>? categoryId,
      Value<DateTime?>? dueDate,
      Value<DateTime>? creationDate,
      Value<DateTime>? lastUpdateDate,
      Value<bool>? completed}) {
    return DriftTodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      dueDate: dueDate ?? this.dueDate,
      creationDate: creationDate ?? this.creationDate,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int?>(categoryId.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime?>(dueDate.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    if (lastUpdateDate.present) {
      map['last_update_date'] = Variable<DateTime>(lastUpdateDate.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftTodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('categoryId: $categoryId, ')
          ..write('dueDate: $dueDate, ')
          ..write('creationDate: $creationDate, ')
          ..write('lastUpdateDate: $lastUpdateDate, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }
}

class $DriftTodosTable extends DriftTodos
    with TableInfo<$DriftTodosTable, DriftTodo> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DriftTodosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int?> categoryId = GeneratedColumn<int?>(
      'category_id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES DriftCategory(id)');
  final VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime?> dueDate = GeneratedColumn<DateTime?>(
      'due_date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  @override
  late final GeneratedColumn<DateTime?> creationDate =
      GeneratedColumn<DateTime?>('creation_date', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  final VerificationMeta _lastUpdateDateMeta =
      const VerificationMeta('lastUpdateDate');
  @override
  late final GeneratedColumn<DateTime?> lastUpdateDate =
      GeneratedColumn<DateTime?>('last_update_date', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool?> completed = GeneratedColumn<bool?>(
      'completed', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (completed IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        categoryId,
        dueDate,
        creationDate,
        lastUpdateDate,
        completed
      ];
  @override
  String get aliasedName => _alias ?? 'drift_todos';
  @override
  String get actualTableName => 'drift_todos';
  @override
  VerificationContext validateIntegrity(Insertable<DriftTodo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date']!, _creationDateMeta));
    }
    if (data.containsKey('last_update_date')) {
      context.handle(
          _lastUpdateDateMeta,
          lastUpdateDate.isAcceptableOrUnknown(
              data['last_update_date']!, _lastUpdateDateMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftTodo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DriftTodo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DriftTodosTable createAlias(String alias) {
    return $DriftTodosTable(_db, alias);
  }
}

class DriftSubTask extends DataClass implements Insertable<DriftSubTask> {
  final int id;
  final String description;
  final bool completed;
  final int todoId;
  DriftSubTask(
      {required this.id,
      required this.description,
      required this.completed,
      required this.todoId});
  factory DriftSubTask.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DriftSubTask(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      completed: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}completed'])!,
      todoId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}todo_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['completed'] = Variable<bool>(completed);
    map['todo_id'] = Variable<int>(todoId);
    return map;
  }

  DriftSubTasksCompanion toCompanion(bool nullToAbsent) {
    return DriftSubTasksCompanion(
      id: Value(id),
      description: Value(description),
      completed: Value(completed),
      todoId: Value(todoId),
    );
  }

  factory DriftSubTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftSubTask(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      completed: serializer.fromJson<bool>(json['completed']),
      todoId: serializer.fromJson<int>(json['todoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'completed': serializer.toJson<bool>(completed),
      'todoId': serializer.toJson<int>(todoId),
    };
  }

  DriftSubTask copyWith(
          {int? id, String? description, bool? completed, int? todoId}) =>
      DriftSubTask(
        id: id ?? this.id,
        description: description ?? this.description,
        completed: completed ?? this.completed,
        todoId: todoId ?? this.todoId,
      );
  @override
  String toString() {
    return (StringBuffer('DriftSubTask(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('completed: $completed, ')
          ..write('todoId: $todoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, completed, todoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftSubTask &&
          other.id == this.id &&
          other.description == this.description &&
          other.completed == this.completed &&
          other.todoId == this.todoId);
}

class DriftSubTasksCompanion extends UpdateCompanion<DriftSubTask> {
  final Value<int> id;
  final Value<String> description;
  final Value<bool> completed;
  final Value<int> todoId;
  const DriftSubTasksCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.completed = const Value.absent(),
    this.todoId = const Value.absent(),
  });
  DriftSubTasksCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.completed = const Value.absent(),
    required int todoId,
  })  : description = Value(description),
        todoId = Value(todoId);
  static Insertable<DriftSubTask> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<bool>? completed,
    Expression<int>? todoId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (completed != null) 'completed': completed,
      if (todoId != null) 'todo_id': todoId,
    });
  }

  DriftSubTasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<bool>? completed,
      Value<int>? todoId}) {
    return DriftSubTasksCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      todoId: todoId ?? this.todoId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (todoId.present) {
      map['todo_id'] = Variable<int>(todoId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftSubTasksCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('completed: $completed, ')
          ..write('todoId: $todoId')
          ..write(')'))
        .toString();
  }
}

class $DriftSubTasksTable extends DriftSubTasks
    with TableInfo<$DriftSubTasksTable, DriftSubTask> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DriftSubTasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool?> completed = GeneratedColumn<bool?>(
      'completed', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (completed IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _todoIdMeta = const VerificationMeta('todoId');
  @override
  late final GeneratedColumn<int?> todoId = GeneratedColumn<int?>(
      'todo_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES DriftTodo(id)');
  @override
  List<GeneratedColumn> get $columns => [id, description, completed, todoId];
  @override
  String get aliasedName => _alias ?? 'drift_sub_tasks';
  @override
  String get actualTableName => 'drift_sub_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<DriftSubTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('todo_id')) {
      context.handle(_todoIdMeta,
          todoId.isAcceptableOrUnknown(data['todo_id']!, _todoIdMeta));
    } else if (isInserting) {
      context.missing(_todoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftSubTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DriftSubTask.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DriftSubTasksTable createAlias(String alias) {
    return $DriftSubTasksTable(_db, alias);
  }
}

class DriftCategory extends DataClass implements Insertable<DriftCategory> {
  final int id;
  final String name;
  DriftCategory({required this.id, required this.name});
  factory DriftCategory.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DriftCategory(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  DriftCategoriesCompanion toCompanion(bool nullToAbsent) {
    return DriftCategoriesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory DriftCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftCategory(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  DriftCategory copyWith({int? id, String? name}) => DriftCategory(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('DriftCategory(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftCategory &&
          other.id == this.id &&
          other.name == this.name);
}

class DriftCategoriesCompanion extends UpdateCompanion<DriftCategory> {
  final Value<int> id;
  final Value<String> name;
  const DriftCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  DriftCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<DriftCategory> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  DriftCategoriesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return DriftCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $DriftCategoriesTable extends DriftCategories
    with TableInfo<$DriftCategoriesTable, DriftCategory> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DriftCategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'drift_categories';
  @override
  String get actualTableName => 'drift_categories';
  @override
  VerificationContext validateIntegrity(Insertable<DriftCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DriftCategory.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DriftCategoriesTable createAlias(String alias) {
    return $DriftCategoriesTable(_db, alias);
  }
}

abstract class _$HeyTaskDatabase extends GeneratedDatabase {
  _$HeyTaskDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DriftTodosTable driftTodos = $DriftTodosTable(this);
  late final $DriftSubTasksTable driftSubTasks = $DriftSubTasksTable(this);
  late final $DriftCategoriesTable driftCategories =
      $DriftCategoriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [driftTodos, driftSubTasks, driftCategories];
}

import 'package:equatable/equatable.dart';
import 'domain.dart';

// ignore: must_be_immutable
class Todo extends Equatable {

  int? id;
  final String title;
  final String? description;
  List<SubTask>? subTasks;
  DateTime? dueDate;
  List<Tag>? tags;
  bool completed = false;

  Todo({this.id,
    required this.title,
    this.description,
    this.subTasks,
    this.dueDate,
    this.tags});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
import 'package:equatable/equatable.dart';
import 'domain.dart';

// ignore: must_be_immutable
class Todo extends Equatable {

  int id;
  final String title;
  final String? description;
  List<SubTask>? subTasks;
  DateTime? dueDate;
  Category? category;
  bool completed = false;

  Todo({
    this.id = -1,
    required this.title,
    this.description,
    this.subTasks,
    this.dueDate,
    this.category});

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}
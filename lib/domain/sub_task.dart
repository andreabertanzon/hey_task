import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SubTask extends Equatable{
  int? id;
  String description;
  bool completed = false;

  SubTask({this.id, required this.description, required this.completed});

  @override
  List<Object?> get props => [description];

}
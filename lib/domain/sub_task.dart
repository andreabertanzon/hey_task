import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SubTask extends Equatable{
  String description;
  bool completed = false;

  SubTask({required this.description});

  @override
  List<Object?> get props => [description];

}
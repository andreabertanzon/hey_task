import 'package:flutter/material.dart';
import 'package:hey_task/data/i_todo_repository.dart';
import 'package:hey_task/domain/todo.dart';
import 'package:hey_task/ui/theme/colors.dart';
import 'package:provider/provider.dart';

class TodoWidgetItem extends StatelessWidget {
  const TodoWidgetItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                leading: Checkbox(
                  activeColor: LightColors.subTitleGrey,
                  checkColor: LightColors.defaultContainerColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  value: todo.completed,
                  onChanged: (boolean) async {
                    await Provider.of<ITodoRepository>(context, listen: false)
                        .markTodoCompleted(todo.id);
                  },
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    color: todo.completed ? LightColors.subTitleGrey : Colors.black,
                      decoration: todo.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
            ),
          ),
    );
  }
}

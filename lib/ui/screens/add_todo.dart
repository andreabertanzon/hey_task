import 'package:flutter/material.dart';
import 'package:hey_task/navigation/hey_task_pages.dart';
import 'package:hey_task/ui/theme/colors.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
        name: HeyTaskPages.addTodoPath,
        key: ValueKey(HeyTaskPages.addTodoPath),
        child: const AddTodoScreen());
  }

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000),
        upperBound: 1.3);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ClipPath(
          clipper: AddTaskClipper(value: _controller.value),
          child: child,
        );
      },
      child: Scaffold(
          backgroundColor: LightColors.iconBlue,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Add a task",
                    style: TextStyle(color: LightColors.defaultContainerColor),
                  ),
                  TextField(
                    style: TextStyle(color: LightColors.defaultContainerColor),
                  ),
                  // TEXTFIELD for inputing the name
                  // a way to input notes to remember
                  // DatePicker
                  // Category picker
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: LightColors.backgroundColor,
            onPressed: () async {
              //Provider.of<ITodoRepository>(context, listen: false).insertTodo(todo)
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.done,
              color: LightColors.iconBlue,
            ),
          )),
    );
  }
}

class AddTaskClipper extends CustomClipper<Path> {
  final double value;

  AddTaskClipper({required this.value});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height), radius: value * size.height));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

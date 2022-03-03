import 'package:flutter/material.dart';
import 'package:hey_task/data/i_todo_repository.dart';
import 'package:hey_task/domain/domain.dart';
import 'package:hey_task/navigation/hey_task_pages.dart';
import 'package:hey_task/ui/theme/colors.dart';
import 'package:hey_task/utils/app_strings.dart';
import 'package:provider/provider.dart';

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
  DateTime? _selectedDate;
  String? description;
  Category? category;
  String? title; 

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
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
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.addTaskText.toUpperCase(),
                    style: const TextStyle(
                        color: LightColors.defaultContainerColor, fontSize: 18),
                  ),
                  TextField(
                    onChanged: (value) => setState(() {
                      title = value;
                    }),
                    style: const TextStyle(color: LightColors.defaultContainerColor),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDatepickerColumn(),
                      _buildCategoryPickerColumn(),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildNotesTextForm()
                  // Category picker
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: LightColors.backgroundColor,
            onPressed: () async {
              if (title != null) {
                final todo = Todo(title: title!, completed: false, description: description, dueDate: _selectedDate);
                Provider.of<ITodoRepository>(context, listen: false).insertTodo(todo);
                Navigator.of(context).pop();  
              }
            },
            child: const Icon(
              Icons.done,
              color: LightColors.iconBlue,
            ),
          )),
    );
  }

  TextFormField _buildNotesTextForm() {
    return TextFormField(
      onChanged: (value) => {
        setState((){description = value;})
      },
      style: const TextStyle(color: LightColors.defaultContainerColor),
      decoration: const InputDecoration(
          labelText: AppStrings.notesLabel,
          labelStyle: TextStyle(color: LightColors.defaultContainerColor),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: LightColors.defaultContainerColor, width: 5)),
          fillColor: LightColors.defaultContainerColor,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: LightColors.defaultContainerColor,
          )),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 5))),
      minLines: 6,
      keyboardType: TextInputType.multiline,
      maxLines: 7,
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showCategoryDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            elevation: 16,
            child: Container(
              child: ListView(
                shrinkWrap: true,
                children: [],
              ),
            ),
          );
        });
  }

  Widget _buildDatepickerColumn() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              AppStrings.dateLabel,
              style: TextStyle(
                color: LightColors.defaultContainerColor,
              ),
            ),
            IconButton(
              onPressed: () => _selectDate(context),
              icon: const Icon(Icons.calendar_today),
              color: LightColors.defaultContainerColor,
            ),
            Text(
              _selectedDate == null
                  ? ""
                  : "${_selectedDate!.day} / ${_selectedDate!.month}",
              style: const TextStyle(
                color: LightColors.defaultContainerColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryPickerColumn() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              AppStrings.categoryLabel,
              style: TextStyle(
                color: LightColors.defaultContainerColor,
              ),
            ),
            IconButton(
              onPressed: () => _showCategoryDialog(context),
              icon: const Icon(Icons.color_lens),
              color: LightColors.defaultContainerColor,
            ),
            Text(
              _selectedDate == null
                  ? ""
                  : "${_selectedDate!.day} / ${_selectedDate!.month}",
              style: const TextStyle(
                color: LightColors.defaultContainerColor,
              ),
            ),
          ],
        ),
      ],
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

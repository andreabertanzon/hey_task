import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hey_task/domain/domain.dart';
import 'package:hey_task/navigation/drawer_manager.dart';
import 'package:hey_task/ui/components/drawer/drawer_menu_component.dart';
import 'package:hey_task/ui/screens/add_todo.dart';
import 'package:hey_task/ui/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../navigation/hey_task_pages.dart';
import '../../data/data.dart';

class TodoRoosterScreen extends StatefulWidget {
  final VoidCallback openDrawer;

  const TodoRoosterScreen({Key? key, required this.openDrawer})
      : super(key: key);

  static MaterialPage page({
    required VoidCallback openDrawer,
  }) {
    return MaterialPage(
        name: HeyTaskPages.firstPath,
        key: ValueKey(HeyTaskPages.firstPath),
        child: TodoRoosterScreen(
          openDrawer: openDrawer,
        ));
  }

  @override
  State<TodoRoosterScreen> createState() => _TodoRoosterScreenState();
}

class _TodoRoosterScreenState extends State<TodoRoosterScreen> {

  @override
  Widget build(BuildContext context) => Consumer<DrawerManager>(
        builder: (context, drawerManager, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: LightColors.backgroundColor,
              leading: DrawerMenuComponent(
                onClick: () {
                  Provider.of<DrawerManager>(context, listen: false)
                      .openDrawer();
                },
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.black38,
                )
              ],
              title: Text(AvailablePages.todoRooster.name),
            ),
            body: _buildTodoList(context),
            floatingActionButton: FloatingActionButton(
              backgroundColor: LightColors.iconBlue,
              onPressed: () async {
                Provider.of<DrawerManager>(context, listen: false).goTo(AvailablePages.addTodo);
                },
              child: const Icon(Icons.add),
            ),
          );
        },
      );

  Widget _buildTodoList(BuildContext context) {
    return StreamBuilder<List<Todo>>(
      stream: Provider.of<ITodoRepository>(context, listen: false).watchTodos(),
      builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
        if (snapshot.hasData) {
          final todos = snapshot.data ?? [];
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = todos[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: SizedBox(
                  height: 70,
                  child: _buildSlidable(context, todo),
                ),
              );
            },
          );
        } else if(snapshot.hasError) {
          return Text('${snapshot.error}');
        }
          return const Center(child: CircularProgressIndicator(),);
        }
    );
  }

  Widget _buildSlidable(BuildContext context, Todo todo) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
              label: 'Delete',
              backgroundColor: Colors.transparent,
              foregroundColor: LightColors.subTitleGrey,
              icon: Icons.delete,
              onPressed: (context) async {
                final result =
                    await Provider.of(context, listen: false)
                        .deleteTodo(todo);
                if (kDebugMode) {
                  print(result.when((value) => value,
                      loading: () => "I am loading",
                      error: (String? message) => '$message'));
                }
              }),
        ],
      ),
      child: Card(
        elevation: 0.1,
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
                checkColor: LightColors.defaultContainerColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                value: todo.completed,
                onChanged: (boolean) async {
                  await Provider.of<ITodoRepository>(context, listen: false).markTodoCompleted(todo.id);
                },
              ),
              title: Text(todo.title),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hey_task/domain/domain.dart';
import 'package:hey_task/navigation/drawer_manager.dart';
import 'package:hey_task/ui/components/drawer/drawer_menu_component.dart';
import 'package:provider/provider.dart';

import '../../navigation/hey_task_pages.dart';
import '../../data/data.dart';

class TodoRoosterScreen extends StatelessWidget {
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
  Widget build(BuildContext context) => Consumer<DrawerManager>(
        builder: (context, drawerManager, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
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
              onPressed: () async {
                final todo = Todo(
                    id: 1,
                    title: "Go rising the bar",
                    description: "I have to go shopping tomorrow",
                    subTasks: null,
                    dueDate: DateTime.now(),
                    category: null);
                await Provider.of<ITodoRepository>(context, listen: false)
                    .insertTodo(todo);
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      );

  Widget _buildTodoList(BuildContext context) {
    final repository = Provider.of<ITodoRepository>(context, listen: false);
    var output = StreamBuilder<List<Todo>>(
      stream: repository.watchTodos(),
      builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final todos = snapshot.data ?? [];
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = todos[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: SizedBox(
                  height: 70,
                  child: Slidable(
                    actionPane: const SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Card(
                      elevation: 1.0,
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
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                              value: todo.completed,
                              onChanged: (boolean) async {
                                
                              },
                            ),
                            title: Text(todo.title),
                          ),
                        ),
                      ),
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                          caption: 'Delete',
                          color: Colors.transparent,
                          foregroundColor: Colors.black,
                          iconWidget: const Icon(Icons.delete, color: Colors.red),
                          onTap: () async {
                            await Provider.of<ITodoRepository>(context, listen: false).deleteTodo(todo);
                          }),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Container(
            child: Text("Totally empty"),
          );
        }
      },
    );
    return output;
  }
}

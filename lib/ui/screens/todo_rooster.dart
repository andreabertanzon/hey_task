import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hey_task/domain/domain.dart';
import 'package:hey_task/navigation/drawer_manager.dart';
import 'package:hey_task/ui/components/cards/category_card.dart';
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
          return MaterialApp(
              initialRoute: '/',
              onGenerateRoute: (settings) => generateRoute(settings));
        },
      );

  Widget _buildTodoRoosterMain(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: LightColors.backgroundColor,
        leading: DrawerMenuComponent(
          onClick: () {
            Provider.of<DrawerManager>(context, listen: false).openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black38,
          )
        ],
        title: const Text(""),
      ),
      body: _buildTodoList(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightColors.iconBlue,
        onPressed: () async {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTodoList(BuildContext context) {
    return StreamBuilder<List<Todo>>(
        stream:
            Provider.of<ITodoRepository>(context, listen: false).watchTodos(),
        builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.hasData) {
            final todos = snapshot.data ?? [];
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CategoryCard(categoryTitle:"Casa",completionPerc: 0.9, numOfTasks: 10,totalTasks: 14,),
                          CategoryCard(categoryTitle:"Spesa",completionPerc: 0.2,numOfTasks: 10,totalTasks: 14,),
                          CategoryCard(categoryTitle:"Materiale",completionPerc: 0.3,numOfTasks: 10,totalTasks: 14,),
                          CategoryCard(categoryTitle:"Clienti",completionPerc: 0.5,numOfTasks: 10,totalTasks: 14,),
                          CategoryCard(categoryTitle:"Urgente",completionPerc: 0.6,numOfTasks: 10,totalTasks: 14,),
                          CategoryCard(categoryTitle:"Dottore",completionPerc: 0.7,numOfTasks: 10,totalTasks: 14,),
                          CategoryCard(categoryTitle:"Valeggio",completionPerc: 0.2,numOfTasks: 10,totalTasks: 14,),
                          CategoryCard(categoryTitle:"Puglia",completionPerc: 0.4,numOfTasks: 10,totalTasks: 14,),
                          CategoryCard(categoryTitle:"test",completionPerc: 0.7,numOfTasks: 10,totalTasks: 14,),
                          CategoryCard(categoryTitle:"test",completionPerc: 0.4,numOfTasks: 10,totalTasks: 14,),
                          CategoryCard(categoryTitle:"test",completionPerc: 0.5,numOfTasks: 10,totalTasks: 14,),
                          CategoryCard(categoryTitle:"test",completionPerc: 0.5,numOfTasks: 10,totalTasks: 14,),
                          CategoryCard(categoryTitle:"test",completionPerc: 0.5,numOfTasks: 10,totalTasks: 14,),
                        ]
                      ),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  final currentIndex =
                      index > todos.length ? todos.length - 1 : index;
                  final todo = todos[currentIndex];
                  return Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text("Tasks"),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                        child: SizedBox(
                          height: 70,
                          child: _buildSlidable(context, todo),
                        ),
                      ),
                    ],
                  );
                }, childCount: todos.length))
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
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
                    await Provider.of(context, listen: false).deleteTodo(todo);
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
                  await Provider.of<ITodoRepository>(context, listen: false)
                      .markTodoCompleted(todo.id);
                },
              ),
              title: Text(todo.title),
            ),
          ),
        ),
      ),
    );
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case '/':
        return PageRouteBuilder(
            settings:
                settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
            pageBuilder: (context, __, ___) => _buildTodoRoosterMain(context),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));
      default:
        return PageRouteBuilder(
          settings:
              settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
          pageBuilder: (context, __, ___) => AddTodoScreen(),
        );
    }
  }
}

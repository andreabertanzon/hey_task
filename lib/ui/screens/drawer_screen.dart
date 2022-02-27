import 'package:flutter/material.dart';
import 'package:hey_task/navigation/drawer_manager.dart';
import 'package:hey_task/navigation/hey_task_pages.dart';
import 'package:hey_task/ui/components/drawer/drawer_component.dart';
import 'package:hey_task/ui/screens/categories_screen.dart';
import 'package:hey_task/ui/screens/todo_rooster.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  late final DrawerManager _drawerManager;

  Widget _getSelectedPage() {
    late MaterialPage page;
    // This is for the pages on the navigator drawer
    if (_drawerManager.selectedPage == AvailablePages.todoRooster) {
      page = TodoRoosterScreen.page(openDrawer: _drawerManager.openDrawer);
    }
    if (_drawerManager.selectedPage == AvailablePages.categories) {
      page = CategoriesScreen.page(openDrawer: _drawerManager.openDrawer);
    }
    /*
                   if(drawerManager.selectedPage == AvailablePages.settings) SettingsScreen.page(openDrawer: drawerManager.openDrawer),
        if(drawerManager.selectedPage == AvailablePages.addTodo) AddTodoScreen.page(),*/
    return page.child;
  }

  @override
  void initState() {
    _drawerManager = Provider.of<DrawerManager>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerManager>(builder: (
      context,
      drawerManager,
      child,
    ) {
      return Scaffold(
          backgroundColor: const Color.fromARGB(255, 2, 9, 38),
          body: Stack(children: [
            const DrawerComponent(),
            WillPopScope(
              onWillPop: () async {
                if (_drawerManager.isDrawerOpen) {
                  _drawerManager.closeDrawer();
                  return false;
                } else {
                  return true;
                }
              },
              child: GestureDetector(
                onTap: () {
                  _drawerManager.closeDrawer();
                },
                onHorizontalDragStart: (details) =>
                    _drawerManager.setDragging(true),
                onHorizontalDragUpdate: (details) {
                  if (!_drawerManager.isDragging) return;
                  const minMove = 1;
                  if (details.delta.dx > minMove) {
                    _drawerManager.openDrawer();
                  } else if (details.delta.dx < -minMove) {
                    _drawerManager.closeDrawer();
                  }
                  _drawerManager.setDragging(false);
                },
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    transform: Matrix4.translationValues(
                        _drawerManager.xOffSet, _drawerManager.yOffSet, 0)
                      ..scale(_drawerManager.scaleFactor),
                    child: AbsorbPointer(
                      absorbing: _drawerManager.isDrawerOpen,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            _drawerManager.isDrawerOpen ? 20 : 0),
                        child: _getSelectedPage(),
                      ),
                    )),
              ),
            )
          ]));
    });
  }
}

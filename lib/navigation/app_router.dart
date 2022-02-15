import 'package:flutter/material.dart';
import 'package:hey_task/main.dart';
import 'package:hey_task/navigation/drawer_manager.dart';
import 'package:hey_task/ui/hey_task_pages.dart';
import 'package:hey_task/ui/screens/categories_screen.dart';
import 'package:hey_task/ui/screens/todo_rooster.dart';


// 1
class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final DrawerManager drawerManager;


  AppRouter({
    required this.drawerManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    drawerManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    drawerManager.addListener(notifyListeners);
    super.dispose();
  }

  // 5
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if(drawerManager.selectedPage == AvailablePages.todoRooster) TodoRoosterScreen.page(openDrawer: drawerManager.openDrawer),
        if(drawerManager.selectedPage == AvailablePages.categories) CategoriesScreen.page(openDrawer: drawerManager.openDrawer),
      ],
    );
  }



  bool _handlePopPage(Route<dynamic> route, result) {

    if (!route.didPop(result)) {
      return false;
    }
    return true;
  }

  // 9
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}


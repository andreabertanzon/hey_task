import 'package:flutter/material.dart';
import 'package:hey_task/navigation/drawer_manager.dart';
import 'package:hey_task/navigation/hey_task_pages.dart';
import 'package:hey_task/ui/screens/add_todo.dart';
import 'package:hey_task/ui/screens/screens_barrel.dart';

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
      transitionDelegate: NoAnimationTransitionDelegate(),
      key: navigatorKey,
      onPopPage: _handlePopPage,
      onGenerateRoute: (settings) {
        print('settings: ${settings.name}');
        late MaterialPage page;
        if (drawerManager.selectedPage == AvailablePages.todoRooster)
          page = TodoRoosterScreen.page(openDrawer: drawerManager.openDrawer);
        if (drawerManager.selectedPage == AvailablePages.categories)
          page = CategoriesScreen.page(openDrawer: drawerManager.openDrawer);

        return PageRouteBuilder(
          pageBuilder: (context, animation, __) => page.child,
        );
        /*
        if(drawerManager.selectedPage == AvailablePages.settings) SettingsScreen.page(openDrawer: drawerManager.openDrawer),
        if(drawerManager.selectedPage == AvailablePages.addTodo) AddTodoScreen.page(),*/
      },
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

class NoAnimationTransitionDelegate extends TransitionDelegate<void> {
  @override
  Iterable<RouteTransitionRecord> resolve({
    required List<RouteTransitionRecord> newPageRouteHistory,
    required Map<RouteTransitionRecord?, RouteTransitionRecord>
        locationToExitingPageRoute,
    required Map<RouteTransitionRecord?, List<RouteTransitionRecord>>
        pageRouteToPagelessRoutes,
  }) {
    final results = <RouteTransitionRecord>[];

    for (final pageRoute in newPageRouteHistory) {
      if (pageRoute.isWaitingForEnteringDecision) {
        pageRoute.markForAdd();
      }
      results.add(pageRoute);
    }

    for (final exitingPageRoute in locationToExitingPageRoute.values) {
      if (exitingPageRoute.isWaitingForExitingDecision) {
        exitingPageRoute.markForRemove();
        final pagelessRoutes = pageRouteToPagelessRoutes[exitingPageRoute];
        if (pagelessRoutes != null) {
          for (final pagelessRoute in pagelessRoutes) {
            pagelessRoute.markForRemove();
          }
        }
      }
      results.add(exitingPageRoute);
    }

    return results;
  }
}

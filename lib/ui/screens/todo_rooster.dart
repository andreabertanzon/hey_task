import 'package:flutter/material.dart';
import 'package:hey_task/navigation/drawer_manager.dart';
import 'package:hey_task/ui/components/drawer/drawer_menu_component.dart';
import 'package:provider/provider.dart';

import '../hey_task_pages.dart';

class TodoRoosterScreen extends StatelessWidget {
  final VoidCallback openDrawer;

  const TodoRoosterScreen({Key? key, required this.openDrawer}) : super(key: key);

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
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: DrawerMenuComponent(
              onClick: (){
                Provider.of<DrawerManager>(context, listen: false)
                    .openDrawer();
              },
            ),
            title: const Text("Page 1")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => {
                  Provider.of<DrawerManager>(context, listen: false).goTo(AvailablePages.categories)
                },
                child: const Text('Go to page 2'),
              ),
            ],
          ),
        ),
      );
}
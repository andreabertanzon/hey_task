
import 'package:flutter/material.dart';
import 'package:hey_task/navigation/drawer_manager.dart';
import 'package:hey_task/ui/components/drawer/drawer_menu_component.dart';
import 'package:provider/provider.dart';

import '../hey_task_pages.dart';

class CategoriesScreen extends StatelessWidget {
  final VoidCallback openDrawer;

  const CategoriesScreen({Key? key, required this.openDrawer}) : super(key: key);


  static MaterialPage page({
    required VoidCallback openDrawer,
  }) {
    return MaterialPage(
        name: HeyTaskPages.firstPath,
        key: ValueKey(HeyTaskPages.firstPath),
        child: CategoriesScreen(
          openDrawer: openDrawer,
        ));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.white,
        leading: DrawerMenuComponent(
            onClick: (){
              Provider.of<DrawerManager>(context, listen: false).openDrawer();
            }
        ),
        title: const Text("Page 2")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => {
              Provider.of<DrawerManager>(context, listen: false)
                  .goTo(AvailablePages.todoRooster)
            },
            child: const Text('Go to home page'),
          ),
        ],
      ),
    ),
  );
}
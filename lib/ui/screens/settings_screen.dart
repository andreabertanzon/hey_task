import 'package:flutter/material.dart';
import 'package:hey_task/navigation/drawer_manager.dart';
import 'package:hey_task/navigation/hey_task_pages.dart';
import 'package:hey_task/ui/components/drawer/drawer_menu_component.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key, required this.openDrawer}) : super(key: key);

  final VoidCallback openDrawer;

  static MaterialPage page({
    required VoidCallback openDrawer,
  }) {
    return MaterialPage(
        name: HeyTaskPages.settingsPath,
        key: ValueKey(HeyTaskPages.settingsPath),
        child: SettingsScreen(
          openDrawer: openDrawer,
        ));
  }

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
        children:  [
          Text("Settings Screen"),
        ],
      ),
    ),
  );
}

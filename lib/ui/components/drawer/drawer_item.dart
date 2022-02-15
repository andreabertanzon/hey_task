import 'package:flutter/material.dart';
import 'package:hey_task/ui/hey_task_pages.dart';

class DrawerItem {
  final String title;
  final IconData icon;
  final AvailablePages page;

  DrawerItem({required this.title, required this.icon, required this.page});
}

class DrawerItems {
  static final List<DrawerItem> linksBtnList = [
    DrawerItem(
        title: ScreenConfiguration.screensConfig[AvailablePages.todoRooster]!,
        icon: Icons.home,
        page: AvailablePages.todoRooster),
    DrawerItem(
        title: ScreenConfiguration.screensConfig[AvailablePages.categories]!,
        icon: Icons.calendar_today_sharp,
        page: AvailablePages.categories),
  ];
}

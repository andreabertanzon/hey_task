import 'package:flutter/material.dart';
import 'package:hey_task/ui/hey_task_pages.dart';

class DrawerItem {
  final String title;
  final IconData icon;
  final AvailablePages page;

  DrawerItem({required this.title, required this.icon, required this.page});
}

class DrawerItems {
  //TODO: find a way to have 1 and only 1 place to store screen names!!!!!!

  static final List<DrawerItem> linksBtnList = [
    DrawerItem(
        title: 'Page One', icon: Icons.home, page: AvailablePages.first),
    DrawerItem(title: 'Page Two', icon: Icons.calendar_today_sharp, page: AvailablePages.second),
  ];
}

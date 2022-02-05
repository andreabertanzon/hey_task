import 'package:flutter/material.dart';

class DrawerItem{
  final String title;
  final IconData icon;

  DrawerItem({required this.title,required this.icon});
}

class DrawerItems{
  //TODO: find a way to have 1 and only 1 place to store screen names!!!!!!


  static final List<DrawerItem> linksBtnList = [
    DrawerItem(title: 'Page One', icon: Icons.home),
    DrawerItem(title: 'Page Two', icon: Icons.calendar_today_sharp),
  ];
}
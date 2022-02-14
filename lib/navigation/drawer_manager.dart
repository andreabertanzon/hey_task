import 'package:flutter/material.dart';
import 'package:hey_task/ui/hey_task_pages.dart';

class DrawerManager extends ChangeNotifier{

  AvailablePages selectedPage = AvailablePages.first;

  void goTo(AvailablePages page){
    if(selectedPage == page) {
      closeDrawer();
      return;
    }

    selectedPage = page;
    closeDrawer();
  }

  double xOffSet = 0;
  double yOffSet = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  bool isDragging = false;

  void openDrawer() {
    xOffSet = 230;
    yOffSet = 100;
    scaleFactor = 0.8;
    isDrawerOpen = true;

    notifyListeners();
  }

  void closeDrawer() {
    xOffSet = 0;
    yOffSet = 0;
    scaleFactor = 1;
    isDrawerOpen = false;

    notifyListeners();
  }

  void setDragging(bool input) {
    isDragging = input;

    notifyListeners();
  }
}
class HeyTaskPages{
  static String firstPath = '/';
  static String secondPath = '/second';
}

enum AvailablePages {
  todoRooster,categories
}

class ScreenConfiguration{
  static Map<AvailablePages, String> screensConfig = {
    AvailablePages.todoRooster: "Tasks",
    AvailablePages.categories: "Categories"
  };
}
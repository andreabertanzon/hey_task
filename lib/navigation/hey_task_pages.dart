class HeyTaskPages{
  static String firstPath = '/';
  static String secondPath = '/second';
  static String settingsPath = '/settings';
}

enum AvailablePages {
  todoRooster,categories, settings
}

class ScreenConfiguration{
  static Map<AvailablePages, String> screensConfig = {
    AvailablePages.todoRooster: "Tasks",
    AvailablePages.categories: "Categories",
    AvailablePages.settings: "Settings"
  };
}
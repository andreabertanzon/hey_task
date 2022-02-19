class HeyTaskPages {
  static String firstPath = '/';
  static String secondPath = '/second';
  static String settingsPath = '/settings';
  static String addTodoPath = '/addTodo';
  static String categoriesPath = '/categories';
}

enum AvailablePages { todoRooster, categories, settings, addTodo }

class ScreenConfiguration {
  static Map<AvailablePages, String> screensConfig = {
    AvailablePages.todoRooster: "Tasks",
    AvailablePages.categories: "Categories",
    AvailablePages.settings: "Settings",
    AvailablePages.addTodo: "AddTodo"
  };
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hey_task/data/data.dart';
import 'package:hey_task/data/drift/todo_database.dart';
import 'package:hey_task/navigation/drawer_manager.dart';
import 'package:hey_task/ui/screens/add_todo.dart';
import 'package:hey_task/ui/screens/drawer_screen.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() {
  _setupLogging();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Provider<HeyTaskDatabase>(
    create: (context) => HeyTaskDatabase(),
    child: const MainPage(),
    dispose: (context, db) => db.close(),
  ));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    if (kDebugMode) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    }
  });
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _drawerManager = DrawerManager();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _drawerManager),
        Provider<ITodoRepository>(
          lazy: false,
          create: (_) =>
              TodoRepository(db: Provider.of<HeyTaskDatabase>(context)),
        )
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          late final Widget child;
          //this is for the pages
          switch (settings.name) {
            case '/add':
              child = const AddTodoScreen();
            // define screens
          }
          return PageRouteBuilder(
              opaque: false,
              pageBuilder: (
                context,
                animation,
                _,
              ) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        },
        home: const DrawerScreen(),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hey_task/data/drift/todo_database.dart';
import 'package:hey_task/ui/components/drawer/drawer_component.dart';
import 'package:hey_task/ui/components/drawer/drawer_menu_component.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blue,
            body: Stack(children: [DrawerComponent(), App()])));
  }
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  static const title = 'GoRouter Example: Declarative Routes';

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late double xOffSet;
  late double yOffSet;
  late double scaleFactor;
  late bool isDrawerOpen;
  bool isDragging = false;

  @override
  void initState() {
    super.initState();

    closeDrawer();
  }

  void openDrawer() => setState(() {
        xOffSet = 230;
        yOffSet = 100;
        scaleFactor = 0.8;
        isDrawerOpen = true;
      });

  void closeDrawer() => setState(() {
        xOffSet = 0;
        yOffSet = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  @override
  Widget build(BuildContext context) => buildMainApp();

  Widget buildMainApp() {
    return WillPopScope(
      onWillPop: () async{
        if(isDrawerOpen){
          closeDrawer();
          return false;
        }else{
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details)=> isDragging=true,
        onHorizontalDragUpdate: (details){
          if(!isDragging) return;
          const minMove = 1;
          if(details.delta.dx > minMove){
            openDrawer();
          }else if(details.delta.dx < -minMove){
            closeDrawer();
          }
          isDragging = false;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
            transform: Matrix4.translationValues(xOffSet, yOffSet, 0)
              ..scale(scaleFactor),
            child: AbsorbPointer(
              absorbing: isDrawerOpen,
              child: ClipRRect(
                borderRadius:BorderRadius.circular(isDrawerOpen ? 20 : 0),
                child: AppRouter(
                  openDrawer: openDrawer,
                ),
              ),
            )),
      ),
    );
  }
}

class AppRouter extends StatelessWidget {
  final VoidCallback openDrawer;

  const AppRouter({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Page1Screen(openDrawer: openDrawer),
        ),
        GoRoute(
          path: '/page2',
          builder: (context, state) => Page2Screen(
            openDrawer: openDrawer,
          ),
        ),
      ],
    );
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: App.title,
    );
  }
}

class Page1Screen extends StatelessWidget {
  final VoidCallback openDrawer;

  const Page1Screen({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: DrawerMenuComponent(
              onClick: openDrawer,
            ),
            title: const Text(App.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.go('/page2'),
                child: const Text('Go to page 2'),
              ),
            ],
          ),
        ),
      );
}

class Page2Screen extends StatelessWidget {
  final VoidCallback openDrawer;

  const Page2Screen({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: DrawerMenuComponent(
              onClick: openDrawer,
            ),
            title: const Text(App.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Go to home page'),
              ),
            ],
          ),
        ),
      );
}

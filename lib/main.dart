import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hey_task/data/drift/todo_database.dart';
import 'package:hey_task/navigation/app_router.dart';
import 'package:hey_task/navigation/drawer_manager.dart';
import 'package:hey_task/ui/hey_task_pages.dart';
import 'package:hey_task/ui/components/drawer/drawer_component.dart';
import 'package:hey_task/ui/components/drawer/drawer_menu_component.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() {
  _setupLogging();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Provider<HeyTaskDatabase>(
    create: (context) => HeyTaskDatabase(),
    child:  MainPage(),
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
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final _drawerManager = DrawerManager();
  late AppRouter _appRouter;

  @override
  void initState(){
    super.initState();

    _appRouter = AppRouter(
      drawerManager: _drawerManager
    );
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _drawerManager),
      ],
      child: Consumer<DrawerManager>(
        builder: (context, drawerManager, child){
          return MaterialApp(
              home: Scaffold(
                  backgroundColor: Colors.blue,
                  body:  Stack(children: [
                    const DrawerComponent(),
                    WillPopScope(
                      onWillPop: () async {
                        if (drawerManager.isDrawerOpen) {
                          drawerManager.closeDrawer();
                          return false;
                        } else {
                          return true;
                        }
                      },
                      child: GestureDetector(
                        onTap: (){
                          drawerManager.closeDrawer();
                          },
                        onHorizontalDragStart: (details) => drawerManager.setDragging(true),
                        onHorizontalDragUpdate: (details) {
                          if (!drawerManager.isDragging) return;
                          const minMove = 1;
                          if (details.delta.dx > minMove) {
                            drawerManager.openDrawer();
                          } else if (details.delta.dx < -minMove) {
                            drawerManager.closeDrawer();
                          }
                          drawerManager.setDragging(false);
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            transform: Matrix4.translationValues(drawerManager.xOffSet,drawerManager.yOffSet, 0)
                              ..scale(drawerManager.scaleFactor),
                            child: AbsorbPointer(
                              absorbing: drawerManager.isDrawerOpen ,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(drawerManager.isDrawerOpen ? 20 : 0),
                                child: Router(
                                  routerDelegate: _appRouter,
                                  backButtonDispatcher: RootBackButtonDispatcher(),
                                ),
                              ),
                            )),
                      ),
                    )
                  ])
              )
          );
        },
      ),
    );
  }
}

class Page1Screen extends StatelessWidget {
  final VoidCallback openDrawer;

  const Page1Screen({Key? key, required this.openDrawer}) : super(key: key);

  static MaterialPage page({
    required VoidCallback openDrawer,
  }) {
    return MaterialPage(
        name: HeyTaskPages.firstPath,
        key: ValueKey(HeyTaskPages.firstPath),
        child: Page1Screen(
          openDrawer: openDrawer,
        ));
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: DrawerMenuComponent(
              onClick: (){
                Provider.of<DrawerManager>(context, listen: false)
                  .openDrawer();
                },
            ),
            title: const Text("Page 1")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => {
                  Provider.of<DrawerManager>(context, listen: false).goTo(AvailablePages.second)
                },
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


  static MaterialPage page({
    required VoidCallback openDrawer,
  }) {
    return MaterialPage(
        name: HeyTaskPages.firstPath,
        key: ValueKey(HeyTaskPages.firstPath),
        child: Page2Screen(
          openDrawer: openDrawer,
        ));
  }

  @override
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
            children: [
              ElevatedButton(
                onPressed: () => {
                Provider.of<DrawerManager>(context, listen: false)
                    .goTo(AvailablePages.first)
                },
                child: const Text('Go to home page'),
              ),
            ],
          ),
        ),
      );
}

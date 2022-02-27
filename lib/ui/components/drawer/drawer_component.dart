import 'package:flutter/material.dart';
import 'package:hey_task/navigation/drawer_manager.dart';
import 'package:hey_task/ui/components/drawer/drawer_item.dart';
import 'package:hey_task/ui/theme/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.8,
        child: Column(
          children: [
            buildTopPart(context,
                imageProvider: const AssetImage('assets/IMG_0005.jpeg')), //TODO: Remove hard coding
            const Divider(
              height: 48,
              color: LightColors.drawerBlue,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                "Andrea's Hey Tasks", //TODO: This Must not be hard coded
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              height: 32,
              color: Color.fromARGB(255, 2, 9, 38),
            ),
            buildDrawerItems(context)
          ],
        ),
      ),
    ));
  }

  Widget buildTopPart(BuildContext context,
      {required ImageProvider imageProvider}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CircularPercentIndicator(
            radius: 50.0,
            lineWidth: 4.0,
            percent: 0.40,
            center: CircleAvatar(
              radius: 42,
              backgroundImage: imageProvider,
            ),
            backgroundColor: const Color.fromARGB(255, 210, 188, 252),
            progressColor: Colors.deepPurple,
          ),
        ),
      ],
    );
  }

  Widget buildDrawerItems(BuildContext context) => Column(
        children: DrawerItems.linksBtnList
            .map((e) => ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  leading: Icon(
                    e.icon,
                    color: Colors.white,
                  ),
                  title: Text(
                    e.title,
                    style: const TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                  onTap: () {
                    Provider.of<DrawerManager>(context, listen: false)
                        .goTo(e.page);
                  },
                ))
            .toList(),
      );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hey_task/ui/components/drawer/drawer_item.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>
      SingleChildScrollView(
        child: SafeArea(child: Column(
          children: [
            //buildTopPart(),
            buildDrawerItems(context)
          ],
        ),
      ));

  Widget buildDrawerItems(BuildContext context) =>
      Column(
        children: DrawerItems.linksBtnList
        .map((e) => ListTile(
          leading: Icon(e.icon, color: Colors.white,),
          title: Text(
            e.title,
            style: const TextStyle(color: Colors.white, fontSize: 14.0),
          ),
          onTap: (){
            context.go('/page2');
          },
        )).toList(),
      );
}

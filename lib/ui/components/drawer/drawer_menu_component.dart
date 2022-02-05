import 'package:flutter/material.dart';

class DrawerMenuComponent extends StatelessWidget {
  final VoidCallback onClick;

  const DrawerMenuComponent({Key? key, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onClick, icon: const Icon(Icons.menu), color: Colors.black);
  }
}

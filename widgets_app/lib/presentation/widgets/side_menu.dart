import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 40;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() => navDrawerIndex = value);

        // final sideMenuItems = [
        //   MenuItem(title: 'Home', subtitle: '', link: '', icon: Icons.home),
        //   ...appMenuItems,
        // ];
        final menuItem = appMenuItems[value];

        context.push(menuItem.link);
        // widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(25, hasNotch ? 10 : 20, 15, 10),
          child: Text('Main'),
        ),

        NavigationDrawerDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),

        ...appMenuItems
            .sublist(0, 3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),

        Padding(padding: EdgeInsets.fromLTRB(25, 18, 15, 10), child: Divider()),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 20, 15, 10),
          child: Text('Secondary Options'),
        ),

        ...appMenuItems
            .sublist(3, 6)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),

        Padding(padding: EdgeInsets.fromLTRB(25, 18, 15, 10), child: Divider()),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 20, 15, 10),
          child: Text('More Options'),
        ),
        ...appMenuItems
            .sublist(6, 8)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}

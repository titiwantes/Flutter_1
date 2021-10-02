import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:app/config/routes.dart';
import 'package:app/utils/routes-animation/slideLeftRoute.dart';

class NavMenu extends StatefulWidget {
  NavMenu({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  _NavMenu createState() => _NavMenu();
}

class _NavMenu extends State<NavMenu> {

  final constraintsIcons = BoxConstraints(
    minWidth: 40,
    minHeight: 40,
    maxHeight: 40,
    maxWidth: 40
  );
  final divider = Divider(
    color: Colors.black,
    height: 1,
    thickness: 1,
    indent: 20,
    endIndent: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(0.0),
            child: Container(
              color: Color.fromARGB(255, 180, 167, 214),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Jules",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: Colors.white,
                      fontSize: 38
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: ConstrainedBox(
              constraints: constraintsIcons,
              //child: Image.asset(''),
            ),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).pop();
              widget.navigatorKey.currentState?.push(slideLeftRoute(ProfileRoute));
            },
          ),
          divider,
          ListTile(
            leading: ConstrainedBox(
              constraints: constraintsIcons,
              //child: Image.asset(''),
            ),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).pop();
              widget.navigatorKey.currentState?.push(slideLeftRoute(SettingsRoute));
            },
          ),
          divider,
          ListTile(
            leading: ConstrainedBox(
              constraints: constraintsIcons,
              //child: Image.asset(''),
            ),
            title: Text('Favoris'),
            onTap: () {
              Navigator.of(context).pop();
              widget.navigatorKey.currentState?.push(slideLeftRoute(FavorisRoute));
            }
          ),
          divider,
          ListTile(
            leading: ConstrainedBox(
              constraints: constraintsIcons,
              //child: Image.asset(''),
            ),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              widget.navigatorKey.currentState?.push(slideLeftRoute(HomeRoute));
            },
          ),
          divider,
          ListTile(
            leading: ConstrainedBox(
              constraints: constraintsIcons,
              //child: Image.asset(''),
            ),
            title: Text('Help'),
            onTap: () {
              Navigator.of(context).pop();
              widget.navigatorKey.currentState?.push(slideLeftRoute(HelpRoute));
            },
          ),
          divider,
          ListTile(
            leading: ConstrainedBox(
              constraints: constraintsIcons,
              //child: Image.asset(''),
            ),
            title: Text('Déconnexion'),
            onTap: () {
              Navigator.of(context).pop();
              widget.navigatorKey.currentState?.push(slideLeftRoute(LogoutRoute));
            },
          ),
          divider,
        ],
      ),
    );
  }
}
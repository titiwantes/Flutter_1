import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:app/config/routes.dart';
import 'package:app/utils/routes-animation/slideLeftRoute.dart';
import 'package:app/config/Colors.dart';
import 'package:flutter/services.dart';

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
    color: Pcolors.white,
    height: 1,
    thickness: 1,
    indent: 20,
    endIndent: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
      color: Pcolors.whiteButton,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(0.0),
            child: Container(
              color: Pcolors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Pcolors.whiteButton,
                    ),
                  ),
                  Text(
                    "",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: Pcolors.black,
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
            title: Text('Profile', style: TextStyle(color: Pcolors.black)),
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
            title: Text('Settings', style: TextStyle(color: Pcolors.black)),
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
            title: Text('Favoris', style: TextStyle(color: Pcolors.black)),
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
            title: Text('Home', style: TextStyle(color: Pcolors.black)),
            onTap: () {
              Navigator.of(context).pop();
              widget.navigatorKey.currentState?.push(slideLeftRoute(musicPlayerRoute));
            },
          ),
          divider,
          ListTile(
            leading: ConstrainedBox(
              constraints: constraintsIcons,
              //child: Image.asset(''),
            ),
            title: Text('Help', style: TextStyle(color: Pcolors.black)),
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
            title: Text('quit', style: TextStyle(color: Pcolors.black)),
            onTap: () {
              SystemNavigator.pop();
              //Navigator.of(context).pop();
              //widget.navigatorKey.currentState?.push(slideLeftRoute(LogoutRoute));
            },
          ),
          divider,
        ],
      ),
    )
    );
  }
}
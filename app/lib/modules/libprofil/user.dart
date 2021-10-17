import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppBar myAppBar(BuildContext contextl) {
  return AppBar(
    leading: BackButton(color: Colors.black),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {
          print('coucou');
        },
        icon: Icon(CupertinoIcons.moon),
        color: Colors.black,
      )
    ],
  );
}

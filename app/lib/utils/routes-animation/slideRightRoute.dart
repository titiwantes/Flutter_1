import 'package:flutter/material.dart';
import 'package:app/config/routes.dart';
import 'package:app/utils/Arguments.dart';

Route slideRightRoute(String routeName, [Arguments? args]) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => getRoute(routeName, args),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
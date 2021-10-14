import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:app/utils/Arguments.dart';
import 'package:app/modules/testPage/testPage1.dart';
import 'package:app/modules/testPage/testPage2.dart';
import 'package:app/modules/Favoris/Favoris.dart';
import 'package:app/modules/Help/Help.dart';
import 'package:app/modules/Home/Home.dart';
import 'package:app/modules/Logout/Logout.dart';
import 'package:app/modules/Profile/Profile.dart';
import 'package:app/modules/Settings/Settings.dart';
import 'package:app/modules/musicPlayer/music_player.dart';
import 'package:app/modules/Settings/appearance/AppearanceSettingsPage.dart';


class RouteModel {
  RouteModel({
    required this.path,
    required this.buildRoute
  });

  String path;
  Function([Arguments?]) buildRoute;
}

const String HomeRoute = '/';
const String FavorisRoute = '/favoris';
const String HelpRoute = '/Help';
const String LogoutRoute = '/Logout';
const String ProfileRoute = '/Profile';
const String SettingsRoute = '/Settings';
const String testPage1 = '/testPage1';
const String testPage2 = '/testPage2';
const String musicPlayerRoute = '/musicPlayerPage';
const String appearanceSettingsRoute = '/settings/appearance';

var routes = [
  //RouteModel(path: homeRoute, buildRoute: ([Arguments? args]) => HomePage()),
  RouteModel(path: testPage1, buildRoute: ([Arguments? args]) => TestPage1()),
  RouteModel(path: testPage2, buildRoute: ([Arguments? args]) => TestPage2()),
  RouteModel(path: FavorisRoute, buildRoute: ([Arguments? args]) => Favoris()),
  RouteModel(path: LogoutRoute, buildRoute: ([Arguments? args]) => Logout()),
  RouteModel(path: ProfileRoute, buildRoute: ([Arguments? args]) => Profile()),
  RouteModel(path: SettingsRoute, buildRoute: ([Arguments? args]) => Settings()),
  RouteModel(path: HelpRoute, buildRoute: ([Arguments? args]) => Help()),
  RouteModel(path: HomeRoute, buildRoute: ([Arguments? args]) => Home()),
  RouteModel(path: musicPlayerRoute, buildRoute: ([Arguments? args]) => MusicPlayer()),
  RouteModel(path: appearanceSettingsRoute, buildRoute: ([Arguments? args]) => AppearanceSettingsPage())

];

getRoute(String? routeName, [Arguments? args]) {
  return routes.firstWhere((element) => element.path == routeName).buildRoute(args);
}
import 'dart:developer';

import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:app/config/MainBehavior.dart';
import 'package:app/config/routes.dart';
import 'package:app/shared/CustomAppBar.dart';
import 'package:app/shared/NavMenu.dart';

void main() {

  runApp(Main());
}

class Main extends StatelessWidget {
=======
import './profil.dart';
import './edit.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/painting.dart';
import './user.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Userpref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
>>>>>>> 05bc74b5148997df77e91d0002f58401ced11efe
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Flutter Demo',
<<<<<<< HEAD
      theme: ThemeData(
        backgroundColor: Colors.white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        // Define the default brightness and colors.
        // primaryColor: Colors.white,
        // accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Quicksand',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: GoogleFonts.baloo(
              fontSize: 28,
              color: Colors.black
          ),
          headline6:  GoogleFonts.quicksand(
              fontSize: 20,
              color: Color.fromARGB(255, 53, 28, 117),
              fontWeight: FontWeight.bold
          ),
          bodyText1: GoogleFonts.quicksand(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.normal
          ),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: App(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MainBehavior(),
          child: child!,
        );
      },
=======
      home: ProfilInfo(),
>>>>>>> 05bc74b5148997df77e91d0002f58401ced11efe
    );
  }
}

<<<<<<< HEAD
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  Future<bool> _willPopCallback() async {
    if (_navigatorKey.currentState!.canPop()) {
      _navigatorKey.currentState?.pop();
      return false;
    }

    // Navigator.of(context).pop(slideLeftRoute(generalSettingsRoute));
    // await showDialog or Show add banners or whatever
    // then
    return true; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              drawerEnableOpenDragGesture: false,
              drawer: NavMenu(navigatorKey: _navigatorKey),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: CustomAppBar(),
              ),
              backgroundColor: Colors.white,
              body: Navigator(
                key: _navigatorKey,
                initialRoute: HomeRoute,
                onPopPage: (route, result) {
                  // if (!route.didPop(result)) {
                  //   return false;
                  // }
                  // _navigatorKey.currentState?.pop(result);
                  return true;
                },
                onGenerateRoute: (RouteSettings settings) {
                  WidgetBuilder builder;
                  builder = (BuildContext context) => getRoute(settings.name);

                  return MaterialPageRoute(
                    builder: builder,
                    settings: settings,
                  );
                },
              )
          ),
        ),
        onWillPop: _willPopCallback
    );
  }
=======
class MyThemes {
  static final primaryColor = Colors.green;

  static final darkTheme = ThemeData(
    primaryColorDark: primaryColor,
    dividerColor: Colors.white,
  );
  static final lightTheme =
      ThemeData(primaryColor: primaryColor, dividerColor: Colors.black);
>>>>>>> 05bc74b5148997df77e91d0002f58401ced11efe
}

import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.black,
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
      ),
      title: 'Flutter Demo',
      home: ProfilInfo(),
    );
  }
}

class MyThemes {
  static final primaryColor = Colors.green;

  static final darkTheme = ThemeData(
    primaryColorDark: primaryColor,
    dividerColor: Colors.white,
  );
  static final lightTheme =
      ThemeData(primaryColor: primaryColor, dividerColor: Colors.black);
}

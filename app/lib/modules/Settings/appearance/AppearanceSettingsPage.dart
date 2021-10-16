import 'package:flutter/material.dart';
import 'package:app/config/CustomTextStyle.dart';
import 'package:app/config/Colors.dart';
import 'package:app/shared/SettingsSwitchButton.dart';
import 'package:app/shared/UnderlineTitle.dart';
import 'package:app/main.dart';
import 'package:app/utils/services/SharedPreferencesService.dart';

class AppearanceSettingsPage extends StatefulWidget {
  AppearanceSettingsPage({
    Key? key
  }) : super(key: key);

  @override
  _AppearanceSettingsPage createState() => _AppearanceSettingsPage();
}

class _AppearanceSettingsPage extends State<AppearanceSettingsPage> {

  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    SharedPreferencesService.getThemeParameters().then((theme) {
      if (theme == null) {
        SharedPreferencesService.setThemeParameters('light');
      } else {
        print(theme);
        if (theme == 'dark') {
          setState(() {
            _darkMode = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Pcolors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UnderlineTitle(title: "Apparence", color: Pcolors.purple),
            SizedBox(height: 30),
            SettingsSwitchButton(
              keyChild: Key('Dark mode settings'),
              text: "Light mode",
              value: _darkMode,
              onChanged: (bool val) async {
                await SharedPreferencesService.setThemeParameters(val == true ? 'dark' : 'light');
                setState(() {
                  _darkMode = val;
                  if (_darkMode) {
                    Pcolors.white = Color.fromARGB(255, 255, 255, 255);
                    Pcolors.greyMessage = Color.fromARGB(255, 241, 240, 240);
                    Pcolors.blue = Color.fromARGB(180, 1, 110, 238);
                    Pcolors.transparentGrey = Color.fromARGB(150, 115, 115, 115);
                    Pcolors.red = Color.fromARGB(255, 242, 80, 80);
                    Pcolors.green = Color.fromARGB(255, 123, 201, 138);
                    Pcolors.purple = Color.fromARGB(255, 180, 167, 214);
                    Pcolors.black = Color.fromARGB(255, 3, 3, 3);
                    Pcolors.orange = Color.fromARGB(255, 255, 174, 92);
                    Pcolors.whiteButton = Color.fromARGB(255, 255, 255, 255);
                  } else {
                    Pcolors.white = PcolorsBackUp.white;
                    Pcolors.greyMessage = PcolorsBackUp.greyMessage;
                    Pcolors.blue = PcolorsBackUp.blue;
                    Pcolors.transparentGrey = PcolorsBackUp.transparentGrey;
                    Pcolors.red = PcolorsBackUp.red;
                    Pcolors.green = PcolorsBackUp.green;
                    Pcolors.purple = PcolorsBackUp.purple;
                    Pcolors.black = PcolorsBackUp.black;
                    Pcolors.orange = PcolorsBackUp.orange;
                    Pcolors.whiteButton = PcolorsBackUp.whiteButton;
                  }
                  main();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
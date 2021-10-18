import 'package:app/config/CustomTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:app/config/routes.dart';
import 'package:app/utils/routes-animation/slideRightRoute.dart';
import 'package:app/shared/UnderlineTitle.dart';
import 'package:app/utils/routes-animation/slideLeftRoute.dart';
import 'package:app/utils/routes-animation/slideBottomRoute.dart';
import 'package:app/config/Colors.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

    Widget navigationSettings(BuildContext context, String text, String route, Key key) {
      return InkWell(
        key: key,
        onTap: () {
          Navigator.of(context).push(slideRightRoute(route));
        },
        child: Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          width: MediaQuery.of(context).size.width * 0.90,
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Pcolors.whiteButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(100, 0, 0, 0),
                spreadRadius: 0,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: CustomTextStyle.quicksandMedium(context, Pcolors.black, 15),
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 30,
              )
            ],
          ),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {

    final settingsNav = Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          this.navigationSettings(context, "Apparence", appearanceSettingsRoute, Key('Apparence settings')),
          ],
      ),
    );




    return Scaffold(
      backgroundColor: Pcolors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UnderlineTitle(title: "Paramètres", color: Pcolors.purple),
            settingsNav,
          ],
        ),
      ),
    );
  }
}
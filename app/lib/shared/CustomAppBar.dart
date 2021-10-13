import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, right: 20),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align (
              alignment: Alignment.centerLeft,
              child: IconButton(
                iconSize: 35,
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "FLUTTER APP",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                children: <Widget>[
                  Text(
                    "",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    //child: Image.asset(''),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
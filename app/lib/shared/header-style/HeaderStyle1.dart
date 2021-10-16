import 'package:flutter/material.dart';
import 'package:app/config/CustomTextStyle.dart';
import 'package:app/config/Colors.dart';
import 'package:app/config/routes.dart';
import 'package:app/utils/routes-animation/slideLeftRoute.dart';

class HeaderStyle1 extends StatefulWidget {
  HeaderStyle1({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.routeRedirect
  }) : super(key: key);

  String text1;
  String text2;
  String text3;
  String routeRedirect;

  @override
  _HeaderStyle1State createState() => _HeaderStyle1State();
}

class _HeaderStyle1State extends State<HeaderStyle1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: Image(
            image: AssetImage('assets/images/logo/logo_black.png'),
            width: 60,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.text1,
                    style: CustomTextStyle.baloo(context, Colors.black, 23),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.text2,
                        style: CustomTextStyle.quicksandRegular(context, Colors.black, 15),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(slideLeftRoute(widget.routeRedirect));
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.text3,
                          style: CustomTextStyle.quicksandRegular(context, Pcolors.orange, 15),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

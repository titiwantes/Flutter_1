import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:app/config/CustomTextStyle.dart';
import 'package:app/config/Colors.dart';

class PopupArrive extends StatefulWidget {
  PopupArrive({
    Key? key,
  }) : super(key: key);

  @override
  _PopupArrive createState() => _PopupArrive();
}

class _PopupArrive extends State<PopupArrive> {

  @override
  Widget build(BuildContext context) {

    final searchIcon = Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Image(
          image: AssetImage('assets/images/icons/search.png'),
          width: 18,
        )
    );

    final input = Container(
          margin: EdgeInsets.only(top: 20),
          alignment : Alignment.center,
          child: Text(
            'Vous êtes arrivé à destination !',
            style: CustomTextStyle.quicksandBold(context, Pcolors.black, 19),
          )
        );

    final input2 = Container(
          margin: EdgeInsets.only(top: 5),
          alignment : Alignment.center,
          child: Text(
            'Ce trajet vous a-t-il convenu ?',
            style: CustomTextStyle.quicksandRegular(context, Pcolors.black, 19),
            )
        );

    final boxOui = Container(
        height: 47,
        width : 110,
        margin: EdgeInsets.only(top:20, bottom: 25),
        alignment : Alignment.center,
        decoration: BoxDecoration(
          color: Pcolors.red,
          borderRadius: BorderRadius.circular(16.0),
        ),
          child: Text(
            'NON',
            style: CustomTextStyle.quicksandBold(context, Colors.white, 20),
            textAlign: TextAlign.center,
          )
    );

    final boxNon = Container(
        height: 47,
        width : 110,
        margin: EdgeInsets.only(top:20, left:20, bottom: 25), //mettre un pourcentage à la place de left
        alignment : Alignment.center,
        decoration: BoxDecoration(
          color: Pcolors.green,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          'OUI',
          style: CustomTextStyle.quicksandBold(context, Colors.white, 20),
          textAlign: TextAlign.center,
        )
    );

    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), //ajuster l'oppacité pour voir la carte en dessous
        borderRadius: BorderRadius.circular(40.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(100, 0, 0, 0),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          input,
          input2,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              boxOui,
              boxNon,
            ],
          )
        ],
      ),
    );
  }
}
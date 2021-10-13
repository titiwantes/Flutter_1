import 'package:flutter/material.dart';
import 'package:app/config/CustomTextStyle.dart';
import 'package:app/config/Colors.dart';

class ButtonStyle1 extends StatefulWidget {
  ButtonStyle1({
    Key? key,
    required this.iconPath,
    required this.text
  }) : super(key: key);

  String text;
  String iconPath;

  @override
  _ButtonStyle1State createState() => _ButtonStyle1State();
}

class _ButtonStyle1State extends State<ButtonStyle1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: PColors.transparentGrey)
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage(widget.iconPath),
              width: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              widget.text,
              style: CustomTextStyle.quicksandMedium(context, Colors.black, 16),
            ),
          )
        ],
      ),
    );
  }
}

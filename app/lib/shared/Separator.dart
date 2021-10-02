import 'package:flutter/material.dart';
import 'package:app/config/CustomTextStyle.dart';
import 'package:app/config/Colors.dart';

class Separator extends StatefulWidget {
  Separator({
    Key? key,
    this.text = ""
  }) : super(key: key);

  String text;

  @override
  _SeparatorState createState() => _SeparatorState();
}

class _SeparatorState extends State<Separator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 1,
              color: PColors.transparentGrey,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "OU",
              style: CustomTextStyle.quicksandRegular(context, PColors.transparentGrey, 13),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: PColors.transparentGrey,
            ),
          )
        ],
      ),
    );
  }
}

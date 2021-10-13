import 'package:flutter/material.dart';
import 'package:app/config/CustomTextStyle.dart';
import 'package:app/config/Colors.dart';

class MainButton extends StatefulWidget {
  MainButton({
    Key? key,
    required this.text,
    this.color = Colors.white
  }) : super(key: key);

  String text;
  Color color;

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        widget.text,
        style: CustomTextStyle.quicksandMedium(context, Colors.white, 12),
      ),
    );
  }
}

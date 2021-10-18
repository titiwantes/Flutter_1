import 'package:flutter/material.dart';
import 'package:app/config/CustomTextStyle.dart';
import 'package:app/shared/SwitchButton.dart';
import 'package:app/config/Colors.dart';

class SettingsSwitchButton extends StatefulWidget {

  SettingsSwitchButton({
    Key? key,
    this.keyChild,
    required this.text,
    required this.value,
    required this.onChanged
  }) : super(key: key);

  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Key? keyChild;


  @override
  _SettingsSwitchButton createState() => _SettingsSwitchButton();
}

class _SettingsSwitchButton extends State<SettingsSwitchButton> {
  bool _enable = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              widget.text,
              style: CustomTextStyle.quicksandMedium(context, Pcolors.black, 15),
            ),
            SwitchButton(
              value: widget.value,
              onChanged: widget.onChanged
            )
          ],
        ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:app/config/CustomTextStyle.dart';

class UnderlineTitle extends StatelessWidget {

  const UnderlineTitle({Key? key, required this.title, required this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Align(
          child: Column(
            children: <Widget>[
              Text(
                this.title,
                style: CustomTextStyle.quicksandBold(context, this.color, 17),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 4,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: this.color,
                ),
              )
            ],
          ),
        )
    );
  }
}
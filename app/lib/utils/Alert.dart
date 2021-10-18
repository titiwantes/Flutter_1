import 'package:flutter/material.dart';
import 'package:app/config/CustomTextStyle.dart';
import 'package:app/config/Colors.dart';
import 'package:app/utils/Percentage.dart';

enum AlertStatus {
  SUCCESS,
  ERROR
}

class Alert {

  static void show(BuildContext context, AlertStatus status, String text) {
    // To change
    final snackBar = SnackBar(
      backgroundColor: status == AlertStatus.SUCCESS ? Pcolors.green : Pcolors.red,
      content: Text(
        text,
        style: CustomTextStyle.quicksandMedium(context, status == AlertStatus.SUCCESS ? Colors.black : Colors.white, 15),
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // showDialog(
    //     context: context,
    //     builder: (_) => Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisSize: MainAxisSize.max,
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: [
    //         Container(
    //           decoration: BoxDecoration(
    //             color: status == AlertStatus.SUCCESS ? ZephyColors.green : ZephyColors.red,
    //             borderRadius: BorderRadius.circular(15.0),
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Color.fromARGB(100, 0, 0, 0),
    //                 spreadRadius: 0,
    //                 blurRadius: 4,
    //                 offset: Offset(0, 4),
    //               ),
    //             ],
    //           ),
    //           padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
    //           margin: EdgeInsets.only(bottom: 30),
    //           width: Percentage.width(context, 95),
    //           child: Text(
    //             text,
    //             style: CustomTextStyle.quicksandMedium(context, Colors.black, 15),
    //             textAlign: TextAlign.center,
    //           ),
    //         ),
    //       ],
    //     ),
    //     barrierColor: Colors.transparent
    // );
  }
}
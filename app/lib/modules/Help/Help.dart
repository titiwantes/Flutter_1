import 'dart:developer';

//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:app/config/CustomTextStyle.dart';
import 'package:app/config/Colors.dart';
import 'package:app/config/routes.dart';
//import 'package:app/core/api/ZephyAPI.dart';
//import 'package:app/core/api/models/Parameters.dart';
//import 'package:app/core/api/models/User.dart';
//import 'package:app/core/states/UserState.dart';
import 'package:app/shared/MainButton.dart';
import 'package:app/shared/MainInput.dart';
import 'package:app/shared/SubmitInput.dart';
import 'package:app/shared/Separator.dart';
import 'package:app/shared/button-style/ButtonStyle1.dart';
import 'package:app/shared/header-style/HeaderStyle1.dart';
import 'package:app/utils/Arguments.dart';
import 'package:app/utils/Percentage.dart';
//import 'package:app/utils/services/SecureStorageService.dart';
import 'package:app/utils/Alert.dart';
import 'package:app/utils/routes-animation/slideLeftRoute.dart';

class Help extends StatefulWidget {
  Help({Key? key, this.args}) : super(key: key);

  Arguments? args;

  @override
  State<Help> createState() => _LoginPageState();
}

class _LoginPageState extends State<Help> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  ///
  /// Called when user click on connect button.
  ///
  ///
  /// Called when user click on connect button.
  ///
  void _onClickConnect() {
    Navigator.pushNamed(context, '/');
  }


  @override
  Widget build(BuildContext context) {
    //return Consumer<UserState>(
      //builder: (context, user, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(left: Percentage.width(context, 3), right: Percentage.width(context, 3), top: 20),
            child: Column(
              children: <Widget>[
                Text("Contact Us", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: MainInput(
                    key: Key("Input email connect"),
                    textPlaceholder: "Your message title...",
                    showIcon: false,
                    fontSizeInput: 15,
                    label: "Title",
                    inputBorder: Border.all(color: Pcolors.transparentGrey),
                    onValidate: (String text) {
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: SubmitInput(
                    key: Key("Input password connect"),
                    textPlaceholder: "Type your message...",
                    showIcon: false,
                    fontSizeInput: 15,
                    label: "Message",
                    inputBorder: Border.all(color: Pcolors.transparentGrey),
                    onValidate: (String text) {
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: MainButton(
                    key: Key("Button connect"),
                    text: "SUBMIT MESSAGE",
                    color: Pcolors.blue,
                    onTap: () {
                      print("Message submited");
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
//    );
//  }
}
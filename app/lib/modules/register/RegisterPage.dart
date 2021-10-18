import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:app/config/Colors.dart';
import 'package:app/config/routes.dart';
import 'package:app/shared/MainButton.dart';
import 'package:app/shared/MainInput.dart';
import 'package:app/shared/Separator.dart';
import 'package:app/shared/button-style/ButtonStyle1.dart';
import 'package:app/shared/header-style/HeaderStyle1.dart';
import 'package:app/utils/Arguments.dart';
import 'package:app/utils/Percentage.dart';
import 'package:app/utils/Alert.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key, this.args}) : super(key: key);

  Arguments? args;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  bool _usernameError = false;
  bool _firstnameError = false;
  bool _lastnameError = false;
  bool _emailError = false;
  bool _passwordError = false;
  bool _confirmPasswordError = false;

  ///
  /// Reset all errors, called just after the user click on register button.
  ///
  void resetErrors() {
    setState(() {
      _usernameError = false;
      _firstnameError = false;
      _lastnameError = false;
      _emailError = false;
      _passwordError = false;
      _confirmPasswordError = false;
    });
  }

  ///
  /// Empty all input in the form.
  /// Called when the user have been well registered.
  ///
  void resetForm() {
    setState(() {
      _username.clear();
      _firstname.clear();
      _email.clear();
      _lastname.clear();
      _password.clear();
      _confirmPassword.clear();
    });
  }

  ///
  /// Check if form contains errors
  ///
  bool haveErrors() {
    /// if username is empty.
    if (_username.text.isEmpty) {
      Alert.show(
          context, AlertStatus.ERROR, "Veuillez rentrer un nom d'utilisateur.");
      setState(() {
        _usernameError = true;
      });
      return true;
    }

    /// if email is empty
    if (_email.text.isEmpty) {
      Alert.show(context, AlertStatus.ERROR, "Veuillez rentrer un email.");
      setState(() {
        _emailError = true;
      });
      return true;
    }

    /// if password and confirm password don't match.
    if (_password.text != _confirmPassword.text) {
      Alert.show(
          context, AlertStatus.ERROR, "Les mots de passes sont différents.");
      setState(() {
        _passwordError = true;
        _confirmPasswordError = true;
      });
      return true;
    }

    /// If password is empty
    if (_password.text.isEmpty) {
      Alert.show(
          context, AlertStatus.ERROR, "Veuillez rentrer un mot de passe.");
      setState(() {
        _passwordError = true;
      });
      return true;
    }
    return false;
  }

  ///
  /// Called when user click on register button.
  ///
  void _onClickRegister() {
    /*resetErrors();

    if (haveErrors()) {
      return;
    }*/

    Navigator.pushNamed(context, '/musicPlayerPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: Percentage.width(context, 3), right: Percentage.width(context, 3), top: 20, bottom: 40),
        child: Column(
          children: <Widget>[
            HeaderStyle1(
              text1: "Sign-up !",
              text2: "Already register ? ",
              text3: "Click there",
              routeRedirect: LoginRoute,

            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: MainInput(
                  key: Key('Username input'),
                  textPlaceholder: "marc_durand",
                  showIcon: false,
                  fontSizeInput: 15,
                  label: "Username*",
                  inputBorder: Border.all(color: Pcolors.transparentGrey),
                  onValidate: (String text) {
                  },
                  controller: _username,
                  error: _usernameError
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: MainInput(
                key: Key('Firstname input'),
                textPlaceholder: "Marc",
                showIcon: false,
                fontSizeInput: 15,
                label: "First name",
                inputBorder: Border.all(color: Pcolors.transparentGrey),
                onValidate: (String text) {
                },
                  controller: _firstname,
                  error: _firstnameError
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: MainInput(
                key: Key('Lastname input'),
                textPlaceholder: "Durand",
                showIcon: false,
                fontSizeInput: 15,
                label: "Last name",
                inputBorder: Border.all(color: Pcolors.transparentGrey),
                onValidate: (String text) {
                },
                  controller: _lastname,
                  error: _lastnameError
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: MainInput(
                key: Key('Email input'),
                textPlaceholder: "contact@exemple.com",
                showIcon: false,
                fontSizeInput: 15,
                label: "Email*",
                inputBorder: Border.all(color: Pcolors.transparentGrey),
                onValidate: (String text) {
                },
                  controller: _email,
                  error: _emailError
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: MainInput(
                key: Key('Password input'),
                textPlaceholder: "********",
                showIcon: false,
                fontSizeInput: 15,
                label: "Password*",
                inputBorder: Border.all(color: Pcolors.transparentGrey),
                onValidate: (String text) {
                },
                controller: _password,
                error: _passwordError,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: MainInput(
                key: Key('Confirm password input'),
                textPlaceholder: "********",
                showIcon: false,
                fontSizeInput: 15,
                label: "Confirm password*",
                inputBorder: Border.all(color: Pcolors.transparentGrey),
                onValidate: (String text) {
                },
                controller: _confirmPassword,
                error: _confirmPasswordError,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: MainButton(
                key: Key("Button register"),
                text: "REGISTER",
                color: Pcolors.orange,
                onTap: _onClickRegister,
              ),
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
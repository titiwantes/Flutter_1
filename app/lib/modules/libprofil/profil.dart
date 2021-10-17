import 'dart:convert';

import './edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff90caf9),
        body: Center(child: Container(child: ProfilInfo())));
  }
}

class ProfilInfo extends StatefulWidget {
  const ProfilInfo({Key? key}) : super(key: key);

  @override
  State<ProfilInfo> createState() => ProfilInfoState();
}

class ProfilInfoState extends State<ProfilInfo> {
  @override
  User user = Userpref.getUser();
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ProfileWidget(image: user.image, onClicked: () async {}),
        const SizedBox(height: 30),
        DataWidget(user),
        const SizedBox(height: 10),
        Center(
            child: ButtonWidget(
          text: 'EDIT PROFIL',
          onClicked: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => EditPage()));
            setState(() {
              user = user;
            });
          },
        )),
        const SizedBox(height: 20),
        NumberWidget(),
        const SizedBox(height: 40),
        MusicWidget(context, 'God Plan', 'Song Drake',
            'https://images.unsplash.com/photo-1623969451926-10c5e52b707a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80'),
        const SizedBox(height: 5),
        MusicWidget(context, 'God Plan', 'Song Drake',
            'https://images.unsplash.com/photo-1562403681-c1e256fdc27b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1606&q=80'),
        const SizedBox(height: 5),
        MusicWidget(context, 'God Plan', 'Song Drake',
            'https://images.unsplash.com/photo-1494232410401-ad00d5433cfa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80')
      ],
    ));
  }
}

Widget MusicWidget(
        BuildContext context, String name, String value, String img) =>
    MaterialButton(
        onPressed: () {
          print(name);
        },
        child: Row(
          children: <Widget>[
            Container(
              child: Row(children: <Widget>[
                Image.network(img, cacheHeight: 70, cacheWidth: 70),
              ]),
            ),
            SizedBox(width: 10, height: 70),
            Container(
                height: 70,
                child: Column(children: [
                  Align(
                      child: Container(
                    child: Column(
                      children: [
                        Text(
                          name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        )
                      ],
                    ),
                  )),
                ])),
          ],
        ));

class NumberWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NumberButton(context, '10', 'PLAYLIST'),
          NumberButton(context, '129 654', 'FOLLOWERS'),
          NumberButton(context, '273', 'FOLLOWING'),
        ],
      );
}

Widget NumberButton(BuildContext context, String value, String type) =>
    MaterialButton(
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 2),
          Text(type,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
        ],
      ),
    );

Widget EditButton(BuildContext context) => ButtonWidget(
      text: 'EDIT PROFIL',
      onClicked: () async {
        await Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EditPage()));
      },
    );

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({Key? key, required this.text, required this.onClicked})
      : super(key: key);
  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
        child: Text(text),
        onPressed: onClicked,
      );
}

Widget DataWidget(User user) => Column(
      children: [
        Text(user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27))
      ],
    );

class ProfileWidget extends StatelessWidget {
  final String image;
  final VoidCallback onClicked;
  final bool edit;

  const ProfileWidget({
    Key? key,
    required this.image,
    required this.onClicked,
    this.edit = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
        child: Center(
            child: Stack(
      children: [
        createImage(),
      ],
    )));
  }

  Widget createImage() {
    final img = image.contains('https://')
        ? NetworkImage(image)
        : FileImage(File(image));
    return ClipOval(
        child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image: img as ImageProvider,
              fit: BoxFit.cover,
              width: 150,
              height: 150,
              child: InkWell(
                onTap: onClicked,
              ),
            )));
  }

  Widget editIcon(Color color) => IconCircle(
      color: Colors.white,
      all: 3,
      child: IconCircle(
          color: color,
          all: 8,
          child: Icon(Icons.edit, color: Colors.white, size: 25)));

  Widget IconCircle(
          {required Widget child, required double all, required Color color}) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ));
}

class User {
  final String name;
  final String mail;
  final String image;
  final bool isDarkMode;

  const User(
      {required this.name,
      required this.mail,
      required this.image,
      required this.isDarkMode});

  static User fromJson(Map<String, dynamic> json) => User(
      name: json['name'],
      mail: json['mail'],
      image: json['image'],
      isDarkMode: json['isDarkMode']);

  User copy({String? name, String? mail, String? image, String? isDarkMode}) =>
      User(
          name: name ?? this.name,
          mail: mail ?? this.mail,
          image: image ?? this.image,
          isDarkMode: false);

  Map<String, dynamic> tojson() =>
      {'name': name, 'mail': mail, 'image': image, 'isDarkMode': isDarkMode};
}

class Userpref {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';
  static const myUser = User(
      name: 'Drake',
      mail: 'test@gmail.com',
      image:
          'https://images.unsplash.com/photo-1534308143481-c55f00be8bd7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1630&q=80',
      isDarkMode: false);

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.tojson());
    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);
    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}

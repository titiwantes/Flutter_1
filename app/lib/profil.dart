import 'dart:html';

import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key, required this.name}) : super(key: key);

  final String name;
  @override
  State<ProfilPage> createState() => ProfilPageState();
}

class ProfilUserInfo extends StatelessWidget {
  const ProfilUserInfo({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(
        'https://www.jeancoutu.com/photo/conseils-photo/reseaux-sociaux-photo-de-profil/',
      ),
    );
  }
}

class ProfilPageState extends State<ProfilPage> {
  final user = UserList.jean;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: profilAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfilUserInfo(),
          ],
        ));
  }
}

AppBar profilAppBar(BuildContext constext) {
  return AppBar(
      leading: BackButton(), backgroundColor: Colors.black, elevation: 0);
}

class User {
  final String img;
  final String name;

  const User({
    required this.img,
    required this.name,
  });
}

class UserList {
  static const jean = User(
      img:
          'https://www.jeancoutu.com/photo/conseils-photo/reseaux-sociaux-photo-de-profil/',
      name: 'Jean');
}

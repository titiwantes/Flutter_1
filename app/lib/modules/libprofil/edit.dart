import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import './user.dart';
import './profil.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  User user = Userpref.getUser();

  @override
  Widget build(BuildContext context) => Scaffold(
          body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileEditWidget(
              image: user.image,
              onClicked: () async {
                print('image');
                final image =
                    await ImagePicker().getImage(source: ImageSource.camera);
                if (image == null) return;

                final dir = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${dir.path}/$name');

                final newImage = await File(image.path).copy(imageFile.path);

                setState(() {
                  user = user.copy(image: newImage.path);
                });
              }),
          const SizedBox(height: 24),
          NameField(
            name: user.name,
            onChanged: (name) => user = user.copy(name: name),
          ),
          ButtonWidgetSave(
            text: 'Save',
            onClicked: () {
              print('save');
              Userpref.setUser(user);
              Navigator.of(context).pop();
            },
          )
        ],
      ));
}

class ButtonWidgetSave extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidgetSave(
      {Key? key, required this.text, required this.onClicked})
      : super(key: key);
  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
          shape: StadiumBorder(),
        ),
        child: Text(text),
        onPressed: onClicked,
      );
}

class NameField extends StatefulWidget {
  final String name;
  final ValueChanged<String> onChanged;

  const NameField({
    Key? key,
    required this.name,
    required this.onChanged,
  }) : super(key: key);

  @override
  _NameFieldState createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.name);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            onChanged: widget.onChanged,
          )
        ],
      );
}

class ProfileEditWidget extends StatelessWidget {
  final String image;
  final VoidCallback onClicked;
  final bool edit;

  const ProfileEditWidget({
    Key? key,
    required this.image,
    required this.onClicked,
    this.edit = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.black;

    return Center(
        child: Center(
            child: Stack(
      children: [
        createImage(),
        Positioned(bottom: 0, right: 4, child: editIcon(color))
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
              width: 250,
              height: 250,
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

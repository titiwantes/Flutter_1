import 'package:flutter/material.dart';
import 'package:app/config/Colors.dart';

class RoutesPage extends StatelessWidget {
  const RoutesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pcolors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          child: const Text('RoutesPage screen'),
        ),
      ),
    );
  }
}
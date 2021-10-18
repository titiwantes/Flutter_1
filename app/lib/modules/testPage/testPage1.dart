import 'package:flutter/material.dart';

class TestPage1 extends StatelessWidget {
  const TestPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: const Text('testPage1 screen'),
      ),
    );
  }
}
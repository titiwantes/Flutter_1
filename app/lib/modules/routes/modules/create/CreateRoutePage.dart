import 'package:flutter/material.dart';

class CreateRoutePage extends StatelessWidget {
  const CreateRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: const Text('CreateRoutePage screen'),
      ),
    );
  }
}
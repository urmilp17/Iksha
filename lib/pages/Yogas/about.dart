import 'package:flutter/material.dart';

class AboutYoga extends StatefulWidget {
  const AboutYoga({super.key});

  @override
  State<AboutYoga> createState() => _AboutYogaState();
}

class _AboutYogaState extends State<AboutYoga> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'What is Yoga ?',
        style: TextStyle(
            fontFamily: 'Eczar',
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),
      ),
      content: const Text(
        'AlertDialog description',
        style: TextStyle(
            fontFamily: 'Eczar',
            fontSize: 14,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Yoga extends StatelessWidget {
  const Yoga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.5, 38, 16.5, 0),
            child: Container(
              height: 500,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                image: DecorationImage(
                    image: AssetImage('assets/images/ka.jpg'), fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),
    );
  }
}
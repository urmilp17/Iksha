import 'package:flutter/material.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Article(),
        Article(),
      ],
    );
  }

  Container Article() {
    return Container(
      width: double.maxFinite,
      child: Card(
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                'assets/images/img1.jpeg',
                width: 100,
                height: 100,
              ),
            ),
            const Column(
              children: <Widget>[
                Text(
                  "Title",
                  style: TextStyle(fontFamily: 'Ezcar'),
                ),
                Text(
                  "date",
                  style: TextStyle(fontFamily: 'Ezcar'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

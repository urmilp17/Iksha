import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'rajas.dart';
class Trigunas extends StatefulWidget {
  const Trigunas({super.key});

  @override
  State<Trigunas> createState() => _TrigunasState();
}

class _TrigunasState extends State<Trigunas> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) { // Swiping left
          Navigator.of(context).push(SwipeablePageRoute(
            canSwipe: true,
            builder: (BuildContext context) => RajasPage(),
          ));
        }
      },
      child: const Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              "Sattva",
              style: TextStyle(color: Colors.black,fontSize: 40),
            ),
          ],
        ),
        ),
    );
  }
}

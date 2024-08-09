import 'package:flutter/material.dart';
import 'package:iksha/pages/Other%20Modules/trigunas.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'tamas.dart';

class RajasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) { // Swiping left
          Navigator.of(context).push(SwipeablePageRoute(
            canSwipe: true,
            builder: (BuildContext context) => TamasPage(),
          ));
        }

      },
        onHorizontalDragStart: (details) {
          Navigator.of(context).push(SwipeablePageRoute(
            canSwipe: true,
            builder: (BuildContext context) => const Trigunas(),
          ));
        },
      child: const Scaffold(
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(
            "Rajas",
            style: TextStyle(color: Colors.black,fontSize: 40),
          ),
        ],
      ),
      ),
    );
  }
}

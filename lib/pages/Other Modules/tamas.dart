import 'package:flutter/material.dart';
import 'package:iksha/pages/Other%20Modules/rajas.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class TamasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
      Navigator.of(context).push(SwipeablePageRoute(
        canSwipe: true,
        builder: (BuildContext context) => RajasPage(),
      ));
    },
      child: const Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              "Tamas",
              style: TextStyle(color: Colors.black,fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}

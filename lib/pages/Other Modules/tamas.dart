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
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 20), // Adds some space between the two texts
            Text(
              "Tamas is one of the three Gunas (qualities) in Hindu philosophy. "
                  "It represents darkness, inertia, and ignorance. "
                  "Tamas is associated with a state of confusion, laziness, and dullness, "
                  "often leading to inaction, stagnation, and a lack of clarity.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

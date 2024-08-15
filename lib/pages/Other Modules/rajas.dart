import 'package:flutter/material.dart';
import 'package:iksha/pages/Other%20Modules/trigunas.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'tamas.dart';

class RajasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Rajas",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
          ),
        ),
        SizedBox(height: 20), // Adds some space between the two texts
        Text(
          "Rajas is one of the three Gunas (qualities) in Hindu philosophy. "
              "It represents activity, passion, and movement. "
              "Rajas is associated with energy, desire, and a restless state of mind, "
              "often driving one towards action and change but can lead to attachment and agitation.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18,
          ),
        ),
      ],
    ),
    );
  }
}

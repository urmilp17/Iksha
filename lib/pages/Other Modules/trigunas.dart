import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trigunas"),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 0) {
              // Swiping left
              Navigator.of(context).push(SwipeablePageRoute(
                canSwipe: true,
                builder: (BuildContext context) => RajasPage(),
              ));
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sattva",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 20), // Adds some space between the two texts
                Text(
                  "Sattva is one of the three Gunas (qualities) in Hindu philosophy. "
                  "It represents purity, harmony, balance, and goodness. "
                  "Sattva is associated with a peaceful and clear state of mind, "
                  "and it leads to positive and virtuous thoughts and actions.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

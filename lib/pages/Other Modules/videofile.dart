import 'package:flutter/material.dart';

import '../../colours.dart';

class VideoPlaylistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: background,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(17, 17, 0, 0),
                child: Text(
                  "Video Recommendations",
                  style: TextStyle(fontFamily: "Eczar",fontWeight: FontWeight.w500,fontSize: 25),
                ),
              ),
              Text("Explore underated video playlist from ")
            ],
          ),
        ));
  }
}

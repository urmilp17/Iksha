import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';

class KeyFeatures extends StatelessWidget {

  const KeyFeatures({Key? key}) : super(key: key);
  final double iheight = 170;
  final double iwidth = 140;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
          child: Card(
            color: background,
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/Logo.png',
                  height: iheight,
                  width: iwidth,
                ),
                const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "TITLE",
                        style: TextStyle(
                            fontFamily: 'Playfair', fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "Lorem ipsum blah blah."
                              "\nLorem ipsum blah blah."
                              "\nLorem ipsum blah blah."
                              "\nLorem ipsum blah blah."
                              "\nLorem ipsum blah blah."
                              "\nLorem ipsum blah blah.",
                        style: TextStyle(
                            fontFamily: 'Playfair', fontWeight: FontWeight.w400),
                      )
                    ])
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
          child: Card(
            color: background,
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/Logo.png',
                  height: iheight,
                  width: iwidth,
                ),
                const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "TITLE",
                        style: TextStyle(
                            fontFamily: 'Playfair', fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Lorem ipsum blah blah."
                            "\nLorem ipsum blah blah."
                            "\nLorem ipsum blah blah."
                            "\nLorem ipsum blah blah."
                            "\nLorem ipsum blah blah."
                            "\nLorem ipsum blah blah.",
                        style: TextStyle(
                            fontFamily: 'Playfair', fontWeight: FontWeight.w400),
                      )
                    ])
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
          child: Card(
            color: background,
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/Logo.png',
                  height: iheight,
                  width: iwidth,
                ),
                const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "TITLE",
                        style: TextStyle(
                            fontFamily: 'Playfair', fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Lorem ipsum blah blah."
                            "\nLorem ipsum blah blah."
                            "\nLorem ipsum blah blah."
                            "\nLorem ipsum blah blah."
                            "\nLorem ipsum blah blah."
                            "\nLorem ipsum blah blah.",
                        style: TextStyle(
                            fontFamily: 'Playfair', fontWeight: FontWeight.w400),
                      )
                    ])
              ],
            ),
          ),
        )
      ],
    );
  }
}

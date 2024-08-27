import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';

class KeyFeatures extends StatelessWidget {
  const KeyFeatures({Key? key}) : super(key: key);
  final double iheight = 170;
  final double iwidth = 140;
  final double? subtitle = 15;

  @override
  Widget build(BuildContext context) {
    const double subtitle = 16;
    const double title = 20;
    const String familyf = 'Eczar';
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
          child: Container(
            width: double.maxFinite,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/images/ka.jpg',
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Text(
                        textAlign: TextAlign.end,
                        "Question Answer",

                        style: TextStyle(
                            fontFamily: familyf,
                            fontWeight: FontWeight.bold,
                            fontSize: title),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "The Question Answer Vector Model "
                        "uses advanced AI to analyze user "
                        "questions and provide answers based on "
                        "Hindu scriptures. \nIt helps users explore "
                        "Dharma, spiritual paths, and "
                        "philosophical concepts by delivering "
                        "accurate, and insightful responses.",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontFamily: familyf,
                            fontWeight: FontWeight.w400,
                            fontSize: subtitle),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        //   child: Card(
        //     color: background,
        //     child: Row(
        //       children: <Widget>[
        //         Image.asset(
        //           'assets/images/Logo.png',
        //           height: iheight,
        //           width: iwidth,
        //         ),
        //         const Expanded(
        //           child: Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: <Widget>[
        //                   Text(
        //                     "Question Answer",
        //                     style: TextStyle(
        //                         fontFamily: familyf,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: title),
        //                   ),
        //                   SizedBox(height: 5,),
        //                   Text(
        //                     "The Question Answer Vector Model"
        //                         "\nuses advanced AI to analyze user"
        //                         "\nquestions and provide answers based on"
        //                         "\nHindu scriptures. It helps users explore"
        //                         "\nDharma, spiritual paths, and"
        //                         "\nphilosophical concepts by delivering"
        //                         "\naccurate, and insightful responses.",
        //
        //                     style: TextStyle(
        //                         fontFamily: familyf,
        //                         fontWeight: FontWeight.w400,
        //                         fontSize: subtitle),
        //                   )
        //                 ]),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        //   child: Card(
        //     color: background,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         const SizedBox(width: 10,),
        //         const Expanded(
        //           flex: 2,
        //           child: Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: <Widget>[
        //                   Text(
        //                     "Questionnaire",
        //                     style: TextStyle(
        //                         fontFamily: familyf,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: title),
        //                   ),
        //                   SizedBox(height: 5,),
        //                   Text(
        //                     "The Questionnaire helps users identify"
        //                         "\ntheir spiritual path—Karma (action),"
        //                         "\nBhakti (devotion), or Gyan (knowledge)"
        //                         "\nthrough a series of introspective"
        //                         "\nquestions,providing personalized"
        //                         "\nguidance based on their responses"
        //                         "\nto enhance their spiritual journey.",
        //                     style: TextStyle(
        //                         fontFamily: familyf,
        //                         fontWeight: FontWeight.w400,
        //                         fontSize: subtitle),
        //                   )
        //                 ]),
        //           ),
        //         ),
        //         Expanded(
        //           flex: 1,
        //           child: Image.asset(
        //             'assets/images/ka.jpg',
        //             height: iheight,
        //             width: iwidth,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        //   child: Card(
        //     color: background,
        //     child: Row(
        //       children: <Widget>[
        //         Image.asset(
        //           'assets/images/Logo.png',
        //           height: iheight,
        //           width: iwidth,
        //         ),
        //         const Expanded(
        //           child: Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: <Widget>[
        //                   Text(
        //                     "Garbha Sanskar",
        //                     style: TextStyle(
        //                         fontFamily: familyf,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: title),
        //                   ),
        //                   SizedBox(height: 5,),
        //                   Text(
        //                     "The Garbha Sanskar Guide offers"
        //                         "\ncomprehensive prenatal education,"
        //                         "\ncombining traditional Hindu practices"
        //                         "\nand modern knowledge to enhance the"
        //                         "\nwell-being of both mother and child."
        //                         "\nIt includes rituals, dietary music,"
        //                         "\nrecommendations, and meditative"
        //                         "\ntechniques for a healthy pregnancy.",
        //                     style: TextStyle(
        //                         fontFamily: familyf,
        //                         fontWeight: FontWeight.w400,
        //                         fontSize: subtitle),
        //                   )
        //                 ]),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

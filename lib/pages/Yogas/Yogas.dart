import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/pages/Yogas/about.dart';
import 'package:iksha/pages/Yogas/bhakti.dart';
import 'package:iksha/pages/Yogas/dnyan.dart';
import 'package:iksha/pages/Yogas/karma.dart';
import 'package:iksha/pages/Yogas/questionnaire.dart';

class Yogas extends StatefulWidget {
  const Yogas({super.key});

  @override
  State<Yogas> createState() => _YogasState();
}

class _YogasState extends State<Yogas> {
  final List<Widget> _tabs = [
    const KarmaYog(),
    const BhaktiYog(),
    const DnyanYog()
  ];

  void handleClick(BuildContext context, String value) {
    switch (value) {
      case 'About Yoga':
      // Example: Navigate to a Logout confirmation screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutYoga()),
        );
        break;
      case 'Quiz':
      // Example: Navigate to a Settings screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const YogaQuizScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: background,
          centerTitle: true,
          title: const Text(
            "Yoga",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'LibreBaskerville', fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Karma'),
              Tab(text: 'Bhakti'),
              Tab(text: 'Dnyan'),
            ],
            labelStyle: TextStyle(
                fontFamily: 'Eczar', fontSize: 17, fontWeight: FontWeight.w600),
            indicatorColor: Color(0xDF644C00),
            labelColor: Color(0xDF644C00),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) => handleClick(context, value),
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'About Yoga',
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.black54),
                        SizedBox(width: 8),
                        Text('About Yoga'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Quiz',
                    child: Row(
                      children: [
                        Icon(Icons.question_mark_sharp, color: Colors.black54),
                        SizedBox(width: 8),
                        Text('Quiz'),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: TabBarView(
          children: _tabs,
        ),
      ),
    );
  }
}

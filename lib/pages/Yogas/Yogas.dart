import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/pages/Yogas/about.dart';
import 'package:iksha/pages/Yogas/bhakti.dart';
import 'package:iksha/pages/Yogas/dnyan.dart';
import 'package:iksha/pages/Yogas/karma.dart';
import 'package:iksha/pages/Yogas/questionnaire.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final localizations = AppLocalizations.of(context);
    return DefaultTabController(
      initialIndex: 0,
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: background,
          centerTitle: true,
          title: Text(
            localizations?.yoga_title ?? "Yoga",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Eczar', fontWeight: FontWeight.w500),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: localizations?.karmaYoga_title ?? 'Karma'),
              Tab(text: localizations?.bhaktiYoga_title ?? 'Bhakti'),
              Tab(text: localizations?.jnana_title ?? 'Dnyan'),
            ],
            labelStyle: const TextStyle(
                fontFamily: 'Eczar', fontSize: 17, fontWeight: FontWeight.w600),
            indicatorColor: const Color(0xDF644C00),
            labelColor: const Color(0xDF644C00),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) => handleClick(context, value),
              itemBuilder: (BuildContext context) {
                final localizations = AppLocalizations.of(context);
                return [
                  PopupMenuItem<String>(
                    value: 'About Yoga',
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, color: Colors.black54),
                        const SizedBox(width: 8),
                        Text(
                          localizations?.yoga_title ?? 'About Yoga',
                          style: const TextStyle(fontFamily: "Eczar"),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'Quiz',
                    child: Row(
                      children: [
                        const Icon(Icons.question_mark_sharp,
                            color: Colors.black54),
                        const SizedBox(width: 8),
                        Text(
                          localizations?.quiz ?? 'Quiz',
                          style: const TextStyle(fontFamily: "Eczar"),
                        ),
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

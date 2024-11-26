import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/pages/Yogas/about.dart';
import 'package:iksha/pages/Yogas/bhakti.dart';
import 'package:iksha/pages/Yogas/dnyan.dart';
import 'package:iksha/pages/Yogas/karma.dart';

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
                 fontFamily: 'LibreBaskerville',
                 fontWeight: FontWeight.bold
             ),
          ),

          bottom: const TabBar(

            tabs: [
              Tab(text: 'Karma'),
              Tab(text: 'Bhakti'),
              Tab(text: 'Dnyan'),
            ],
            labelStyle: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 17,
                fontWeight: FontWeight.w600
            ),
            indicatorColor: Color(0xDF644C00),
            labelColor: Color(0xDF644C00),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.question_mark_sharp,size: 20,),
                onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AboutYoga(),
            ),),
          ],
        ),

        body: TabBarView(
          children: _tabs,
        ),
      ),
    );
  }
}

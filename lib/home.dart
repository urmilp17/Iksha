import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'NavBar.dart';
import 'pages/firstpage.dart';
import 'pages/secondpage.dart';
import 'pages/thirdpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: const Text("IKSHA", style: TextStyle(fontFamily: 'LibreBaskerville',fontWeight: FontWeight.bold),),
        elevation: 0,
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: <Widget>[
          Home(),
          KeyFeatures(),
          Articles(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Colors.grey,
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: destinations(),),
    );
  }




}

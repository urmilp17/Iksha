import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/pages/login.dart';
import 'NavBar.dart';
import 'pages/firstpage.dart';
import 'pages/thirdpage.dart';
import 'pages/secondpage.dart';

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
      // appBar: AppBar(
      //   backgroundColor: background,
      //   centerTitle: true,
      //   title: const Text(
      //     "IKSHA",
      //      textAlign: TextAlign.center,
      //      style: TextStyle(
      //          fontFamily: 'LibreBaskerville', fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //     PopupMenuButton(
      //         itemBuilder: (context) => [
      //               PopupMenuItem(
      //                 onTap: () async {
      //                   final auth = FirebaseAuth.instance;
      //                   await auth.signOut();
      //                   Navigator.pushAndRemoveUntil(
      //                       context,
      //                       MaterialPageRoute(
      //                           builder: (_) => const LoginPage()),
      //                       (route) => false);
      //                 },
      //                 child: Text(
      //                   'Logout',
      //                   style: TextStyle(fontFamily: 'Eczar'),
      //                 ),
      //               ),
      //             ],),
      //   ],
      //   elevation: 0,
      // ),
      body: IndexedStack(
        index: currentPageIndex,
        children: const <Widget>[
          Home(),
          KeyFeatures(),
          Articles(),
        ],
      ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(18.5, 0.0, 18.5, 20),
          child: Material(
            elevation: 8.0,  // This adds the shadow to create the floating effect
            borderRadius: BorderRadius.circular(30.0),
            //color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25.0),
              ),
              clipBehavior: Clip.antiAlias,  // This ensures the content inside the container is clipped by the border radius
              child: NavigationBar(

                onDestinationSelected: (int index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                height: 65,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                backgroundColor: background, // Use transparent since the color is set in the container
                indicatorColor: Colors.amber,
                selectedIndex: currentPageIndex,
                indicatorShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),  // Increase the radius for a larger indicator
                ),
                destinations: destinations(),
              ),
            ),
          ),
        ),

    );
  }
}

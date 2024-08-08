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
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: const Text(
          "IKSHA",
           textAlign: TextAlign.center,
           style: TextStyle(
               fontFamily: 'LibreBaskerville', fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () async {
                        final auth = FirebaseAuth.instance;
                        await auth.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginPage()),
                            (route) => false);
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(fontFamily: 'Eczar'),
                      ),
                    ),
                  ])
        ],
        elevation: 0,
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: const <Widget>[
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
        destinations: destinations(),
      ),
    );
  }
}

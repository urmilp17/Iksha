import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/pages/Articles/addarticle.dart';
import 'package:iksha/pages/Articles/articlepage.dart';
import 'package:iksha/pages/fourthpage.dart';
import 'package:iksha/pages/login.dart';
import 'package:iksha/pages/nointernet.dart';
import 'package:iksha/pages/nointernethi.dart';
import 'NavBar.dart';
import 'pages/firstpage.dart';

import 'pages/secondpage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  late final StreamSubscription _internetConnectionStreamSubscription;


  @override
  void initState() {
    super.initState();
    _checkUserLoggedIn();
  }
  void _checkUserLoggedIn() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // User is not logged in, redirect to login page
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
              (route) => false,
        );
      }
    });
  }
  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context).languageCode;
    Widget getPage(String locale, Widget engPage, Widget hinPage) {
      return locale == 'hi' ? hinPage : engPage;
    }

    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: const <Widget>[
          Home(),
          KeyFeatures(),
          ArticlesPage(),
          GarbhaSanskar()
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 340,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.0), color: background),
        clipBehavior: Clip
            .antiAlias, // This ensures the content inside the container is clipped by the border radius
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            height: 70,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            backgroundColor: Colors
                .transparent, // Use transparent since the color is set in the container
            indicatorColor: Colors.amber,
            selectedIndex: currentPageIndex,
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  100), // Increase the radius for a larger indicator
            ),
            destinations: destinations(),
          ),
        ),
      ),
    );
  }
}

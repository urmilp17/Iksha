import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/pages/Main%20Features/Yoga.dart';
import 'package:iksha/pages/Main%20Features/garbha.dart';
import 'package:iksha/pages/Main%20Features/prashna.dart';

class KeyFeatures extends StatefulWidget {
  const KeyFeatures({Key? key}) : super(key: key);

  @override
  State<KeyFeatures> createState() => _KeyFeaturesState();
}

class _KeyFeaturesState extends State<KeyFeatures> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  final double iheight = 170;

  final double iwidth = 140;

  final double? subtitle = 15;

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    const double subtitle = 16;
    const double title = 20;
    const String familyf = 'Eczar';
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: <Widget>[
            Prashna(),
            Yoga(),
            Garbha()
          ],
        ),
      ],
    );
  }
}


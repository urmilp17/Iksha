import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iksha/pages/Other%20Modules/sattva.dart';
import 'package:iksha/pages/Other%20Modules/tamas.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'rajas.dart';

class Trigunas extends StatefulWidget {
  const Trigunas({super.key});

  @override
  State<Trigunas> createState() => _TrigunasState();
}

class _TrigunasState extends State<Trigunas> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

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
    return Stack(
      children: [
        PageView(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children:  [
            SattvaPage(),
            RajasPage(),
            TamasPage()
          ],
        )
      ],
    );
  }
}

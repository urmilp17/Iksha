import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/pages/Main%20Features/yoga.dart';
import 'package:iksha/pages/Main%20Features/prashna.dart';

class KeyFeatures extends StatefulWidget {
  const KeyFeatures({super.key});

  @override
  State<KeyFeatures> createState() => _KeyFeaturesState();
}

class _KeyFeaturesState extends State<KeyFeatures> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  void _handlePageViewChanged(int currentPageIndex) {
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
    _tabController.index = currentPageIndex;
  }

  void _updateCurrentPageIndex(int index) {
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPageIndex = index;
    });
    _tabController.index = index;
  }

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        children: <Widget>[
          SizedBox(height: 32,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              2,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                height: 12.0,
                width: _currentPageIndex == index ? 25.0 : 12.0,
                decoration: BoxDecoration(
                  color: _currentPageIndex == index ? iconcolor : Colors.grey,
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
              children: const <Widget>[
                Prashna(),
                Yoga(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

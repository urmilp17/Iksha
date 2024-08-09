import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipeable Page Route Demo',
      home: const HomeScreen(),
      navigatorObservers: [HeroController()],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              SwipeablePageRoute(
                builder: (BuildContext context) => const Trigunas(),
                canOnlySwipeFromEdge: true, // Optional: swipe only from the edge
              ),
            );
          },
          child: const Text('Go to Trigunas'),
        ),
      ),
    );
  }
}

class Trigunas extends StatelessWidget {
  const Trigunas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Trigunas Screen'),
        actions: [
          IconButton(
            key: const ValueKey('play'),
            icon: const Icon(Icons.play_arrow),
            onPressed: () {},
          ),
          IconButton(
            key: const ValueKey('favorite'),
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          PopupMenuButton<void>(
            key: const ValueKey('overflow'),
            itemBuilder: (context) => [
              const PopupMenuItem<void>(child: Text('Overflow action 1')),
              const PopupMenuItem<void>(child: Text('Overflow action 2')),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text('Swipe left or right to navigate to the Next Page.'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  SwipeablePageRoute(
                    builder: (BuildContext context) => const NextPage(),
                    canOnlySwipeFromEdge: true, // Optional: swipe only from the edge
                  ),
                );
              },
              child: const Text('Go to Next Page'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(); // Go back to the previous page
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Next Page'),
        actions: [
          // IconButton(
          //   key: const ValueKey('back'),
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.of(context).pop(); // Go back to the previous page
          //   },
          // ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Center(
            child: Text('Swipe left or right to navigate to the Another Page.'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  SwipeablePageRoute(
                    builder: (BuildContext context) => const AnotherPage(),
                    canOnlySwipeFromEdge: true, // Optional: swipe only from the edge
                  ),
                );
              },
              child: const Text('Go to Another Page'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(); // Go back to the previous page
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Another Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Hello from Another Page!'),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(); // Go back to the previous page
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                SwipeablePageRoute(
                  builder: (BuildContext context) => const Trigunas(),
                  canOnlySwipeFromEdge: true,
                ),
              );
            },
            style: _buttonStyle(),
            child: const Text('Go to Trigunas'),
          ),
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
        backgroundColor: Colors.blueGrey[700],
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
                    canOnlySwipeFromEdge: true,
                  ),
                );
              },
              style: _buttonStyle(),
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
        backgroundColor: Colors.blueGrey[700], // Same color as other buttons
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
        backgroundColor: Colors.blueGrey[700],
        title: const Text('Next Page'),
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
                    canOnlySwipeFromEdge: true,
                  ),
                );
              },
              style: _buttonStyle(),
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
        backgroundColor: Colors.blueGrey[700], // Same color as other buttons
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
        backgroundColor: Colors.blueGrey[700],
        title: const Text('Another Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Hello from Another Page!'),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.of(context).pop(); // Go back to the previous page
          //     },
          //     style: _buttonStyle(),
          //     child: const Text('Go Back'),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(); // Go back to the previous page
        },
        child: const Icon(Icons.arrow_back),
        backgroundColor: Colors.blueGrey[700], // Same color as other buttons
      ),
    );
  }
}

// Common button style
ButtonStyle _buttonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.blueGrey[700], // Background color
    foregroundColor: Colors.white, // Text color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // Rounded corners
    ),
    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0), // Padding
  );
}

import 'package:flutter/material.dart' hide CarouselController;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iksha/pages/Sadhana/Discrimination.dart';
import 'package:iksha/pages/Sadhana/Non-attachment.dart';
import 'package:iksha/pages/Sadhana/Six-virtues.dart';
import 'package:iksha/pages/Sadhana/Longing.dart';

import 'package:iksha/pages/Other%20Modules/books.dart';
import 'package:iksha/pages/Other%20Modules/trigunas.dart';
import 'package:iksha/pages/sampradayas/sampradaya1.dart';
import 'package:iksha/pages/sampradayas/sampradaya2.dart';
import 'package:iksha/pages/sampradayas/sampradaya3.dart';
import 'package:iksha/pages/sampradayas/sampradaya4.dart';
import 'package:iksha/pages/sampradayas/sampradaya5.dart';
import 'package:iksha/pages/Other%20Modules/videofile.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0; // Track the index of the current slide

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = [
      buildCarouselItem(
          'assets/images/sp1.jpg', 'Shaivism', context, const Sampradaya1()),
      buildCarouselItem(
          'assets/images/sp2.jpg', 'Shaktism', context, const Sampradaya2()),
      buildCarouselItem(
          'assets/images/sp3.jpg', 'Vaishnavism', context, const Sampradaya3()),
      buildCarouselItem(
          'assets/images/sp4.jpg', 'Ganpatya', context, const Sampradaya4()),
      buildCarouselItem(
          'assets/images/sp5.jpg', 'Smarthism', context, const Sampradaya5()),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60, // Slightly reduced height
        title: const Padding(
          padding: EdgeInsets.only(top: 10), // Adjusted padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hey, David 👋",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Welcome to Iksha",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/ka.jpg'),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            16.5, 10, 16.5, 0), // Adjusted top padding
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              const SizedBox(height: 15), // Reduced space
              CarouselSlider(
                items: imageSliders,
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 1.5,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index; // Update the current index
                    });
                  },
                ),
              ),
              const SizedBox(height: 10), // Reduced space
              // Add dots indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageSliders.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () =>
                        buttonCarouselController.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              buildSectionTitle("Sadhana Chatusthaya"),
              buildHorizontalList([
                buildSmallCard(context, "assets/images/card1.jpg",
                    "हिंदी टेक्स्ट 1", "English Text 1", const Viveka()),
                buildSmallCard(context, "assets/images/card2.jpg",
                    "हिंदी टेक्स्ट 2", "English Text 2", const Vairagya()),
                buildSmallCard(context, "assets/images/card3.jpg",
                    "हिंदी टेक्स्ट 3", "English Text 3", const ShadSampati()),
                buildSmallCard(context, "assets/images/card4.jpg",
                    "हिंदी टेक्स्ट 4", "English Text 4", const Mumukshatva()),
              ]),
              const SizedBox(height: 20),
              buildExploreSection(context), // Updated Explore section
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarouselItem(
    String file,
    String text,
    BuildContext context,
    StatelessWidget widget,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          SwipeablePageRoute(
            builder: (_) => widget,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(file),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.all(15),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Eczar',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildHorizontalList(List<Widget> cards) {
    return SizedBox(
      height: 160, // Increased height for the card
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }

  Widget buildSmallCard(BuildContext context, String image, String hindiText,
      String englishText, StatelessWidget pagewidget) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            SwipeablePageRoute(
              builder: (_) => pagewidget,
            ),
          );
        },
        child: Container(
          width: 200,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10), // Add spacing above the avatar
              CircleAvatar(
                radius: 30, // Set the desired radius for the avatar
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(height: 8),
              Text(
                hindiText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                englishText,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }

  Widget buildExploreSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionTitle("Explore"),
        const SizedBox(height: 15),
        buildExploreCard(
          context,
          icon: Icons.play_circle_filled,
          title: "Video Recommendation",
          description:
              "Explore a curated selection of videos on various topics.",
          color: Colors.amberAccent,
          onTap: () {
            Navigator.push(
              context,
              SwipeablePageRoute(
                builder: (_) => VideoPlaylistPage(),
              ),
            );
          },
        ),
        const SizedBox(height: 10), // Reduced space between cards
        buildExploreCard(
          context,
          icon: Icons.auto_stories,
          title: "Books to Read",
          description: "Recommended reading materials for your growth.",
          color: Colors.greenAccent,
          onTap: () {
            Navigator.push(
              context,
              SwipeablePageRoute(
                builder: (_) => const Books(),
              ),
            );
          },
        ),
        const SizedBox(height: 10), // Reduced space between cards
        buildExploreCard(
          context,
          icon: Icons.book,
          title: "Trigunas",
          description: "Understanding the three gunas in daily life.",
          color: Colors.lightBlueAccent,
          onTap: () {
            Navigator.push(
              context,
              SwipeablePageRoute(
                builder: (_) => const Trigunas(),
              ),
            );
          },
        ),
        const SizedBox(height: 100), // Added space below the Trigunas card
      ],
    );
  }

  Widget buildExploreCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.all(12), // Reduced padding to fit content better
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.5), width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

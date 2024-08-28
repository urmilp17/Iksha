import 'package:flutter/material.dart' hide CarouselController;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iksha/pages/Other%20Modules/books.dart';
import 'package:iksha/pages/Other%20Modules/trigunas.dart';
import 'package:iksha/pages/sampradayas/sampradaya1.dart';
import 'package:iksha/pages/sampradaya/sampradaya2.dart';
import 'package:iksha/pages/sampradaya/sampradaya3.dart';
import 'package:iksha/pages/sampradaya/sampradaya4.dart';
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
      buildCarouselItem('assets/images/sp1.jpg', 'Shaivism', context, const Sampradaya1()),
      buildCarouselItem('assets/images/sp2.jpg', 'Shaktism', context, const Sampradaya2()),
      buildCarouselItem('assets/images/sp3.jpg', 'Vaishnavism', context, const Sampradaya3()),
      buildCarouselItem('assets/images/sp4.jpg', 'Ganpatya', context, const Sampradaya4()),
      buildCarouselItem('assets/images/sp5.jpg', 'Smarthism', context, const Sampradaya5()),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70, // Increased height to add space between the status bar and AppBar content
        title: const Padding(
          padding: EdgeInsets.only(top: 15), // Adds space between the AppBar content and the top
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
                      fontSize: 20,
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
        padding: const EdgeInsets.fromLTRB(16.5, 16, 16.5, 0),
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
              // Removed the SizedBox here
              const SizedBox(height: 20),
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

              const SizedBox(height: 15),
              // Add dots indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageSliders.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => buttonCarouselController.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
              const SizedBox(height: 25),
              buildSectionTitle("Sadhana Chatusthaya"),
              buildHorizontalList([
                buildSmallCard(context, "assets/images/card1.jpg"),
                buildSmallCard(context, "assets/images/card2.jpg"),
                buildSmallCard(context, "assets/images/card3.jpg"),
                buildSmallCard(context, "assets/images/card4.jpg"),
              ]),
              const SizedBox(height: 20),
              buildSectionTitle("Explore"),
              buildVerticalList([
                buildLargeCard(context, "assets/images/card4.jpg"),
                buildLargeCard(context, "assets/images/card5.jpg"),
                buildLargeCard(context, "assets/images/card6.jpg"),
              ]),
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
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }

  Widget buildSmallCard(BuildContext context, String image) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget buildVerticalList(List<Widget> cards) {
    return Column(
      children: cards,
    );
  }

  Widget buildLargeCard(BuildContext context, String image) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

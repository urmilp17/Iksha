import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = [
      buildCarouselItem('assets/images/sp1.jpg', 'Shaivism', context, Sampradaya1()),
      buildCarouselItem('assets/images/sp2.jpg', 'Shaktism', context, Sampradaya2()),
      buildCarouselItem('assets/images/sp3.jpg', 'Vaishnavism', context, Sampradaya3()),
      buildCarouselItem('assets/images/sp4.jpg', 'Ganpatya', context, Sampradaya4()),
      buildCarouselItem('assets/images/sp5.jpg', 'Smarthism', context, Sampradaya5()),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.5, 38, 16.5, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/garbha.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF5DF),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Welcome To Iksha",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Eczar',
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CarouselSlider(
                        items: imageSliders,
                        carouselController: buttonCarouselController,
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      buildRecommendationCard(
                        context,
                        'assets/images/video-icon.jpg',
                        "Video Recommendation",
                        "Explore a curated selection of insightful videos.",
                        VideoPlaylistPage(),
                      ),
                      const SizedBox(height: 15),
                      buildRecommendationCard(
                        context,
                        'assets/images/book.jpg',
                        "Books Recommendation",
                        "Discover must-read books on spirituality.",
                        const Books(),
                      ),
                      const SizedBox(height: 20),
                      buildRecommendationCard(
                        context,
                        'assets/images/triguna.png',
                        "Trigunas",
                        "Learn about the three fundamental qualities.",
                        const Trigunas(),
                      ),
                    ],
                  ),
                ),
              ),
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
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecommendationCard(
      BuildContext context,
      String image,
      String title,
      String subtitle,
      Widget page,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => page,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Eczar',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontFamily: 'Eczar',
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

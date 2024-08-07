import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iksha/pages/sampradayas/sampradaya1.dart';
import 'package:iksha/pages/sampradayas/sampradaya2.dart';
import 'package:iksha/pages/sampradayas/sampradaya3.dart';
import 'package:iksha/pages/sampradayas/sampradaya4.dart';
import 'package:iksha/pages/sampradayas/sampradaya5.dart';
import 'sampraday.dart';

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
      backgroundColor: const Color(0xFFFDF5DF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18.5, 20, 18.5, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Welcome to IKSHA",
              style: TextStyle(
                fontFamily: 'Eczar',
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              " ",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 12,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 15),
            CarouselSlider(
              items: imageSliders,
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                initialPage: 0,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/img1.jpeg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    const Text(
                      "Video Recommendation",
                      style: TextStyle(fontFamily: 'Eczar', fontSize: 32),
                    ),
                    const Text(
                      "           ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Eczar', fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),

              ),
            ),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/img1.jpeg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    const Text(
                      "Books Recommendation",
                      style: TextStyle(fontFamily: 'Eczar', fontSize: 32),
                    ),
                    const Text(
                      "     ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Eczar', fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),

            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/img1.jpeg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    const Text(
                      "Trigunas",
                      style: TextStyle(fontFamily: 'Eczar', fontSize: 32),
                    ),
                    const Text(
                      "          ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Eczar', fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),

              ),
            ),

          ],
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
          MaterialPageRoute(
            builder: (context) => widget,
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
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Eczar',
                    fontWeight: FontWeight.w500,
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
}

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

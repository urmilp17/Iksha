import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
      Sampraday('assets/images/img1.jpeg', 'Sampraday 1'),
      Sampraday('assets/images/img2.jpeg', 'Sampraday 2'),
      Sampraday('assets/images/img3.jpeg', 'Sampraday 3'),
      Sampraday('assets/images/img4.jpeg', 'Sampraday 4'),
      Sampraday('assets/images/img5.jpeg', 'Sampraday 5'),
      Sampraday('assets/images/img6.jpeg', 'Sampraday 6'),
    ];

    return Scaffold(
      backgroundColor: Colors.red[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18.5, 20, 18.5, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Welcome to IKSHA",
              style: TextStyle(
                fontFamily: 'Eczar',
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 12,
                height: 1.8,
              ),
            ),
            SizedBox(height: 15),
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
            SizedBox(height: 15),
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
                      "Video Recommedation",
                      style: TextStyle(fontFamily: 'Eczar', fontSize: 32),
                    ),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.6",
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

  Widget Sampraday(String file, String text) {
    return Container(
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
              padding: const EdgeInsets.all(8.0),
              color: Colors.black54,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Eczar',
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

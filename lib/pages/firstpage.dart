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
    return Column(
      children: <Widget>[
        // CarouselSlider(
        //   items: child,
        //   carouselController: buttonCarouselController,
        //   options: CarouselOptions(
        //     autoPlay: false,
        //     enlargeCenterPage: true,
        //     viewportFraction: 0.9,
        //     aspectRatio: 2.0,
        //     initialPage: 2,
        //   ),
        // ),
      ],
    );
  }
}

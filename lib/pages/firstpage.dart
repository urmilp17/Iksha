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
      ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Image.asset('assets/images/img1.jpeg',
            fit: BoxFit.cover, width: double.infinity),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Image.asset('assets/images/img2.jpeg',
            fit: BoxFit.cover, width: double.infinity),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Image.asset('assets/images/img3.jpeg',
            fit: BoxFit.cover, width: double.infinity),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Image.asset('assets/images/img4.jpeg',
            fit: BoxFit.cover, width: double.infinity),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Image.asset('assets/images/img5.jpeg',
            fit: BoxFit.cover, width: double.infinity),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Image.asset('assets/images/img6.jpeg',
            fit: BoxFit.cover, width: double.infinity),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.maxFinite,
          child: CarouselSlider(
            items: imageSliders,
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        const Text(
          "Welcome to IKSHA",
          style: TextStyle(
              fontFamily: 'Eczar', fontWeight: FontWeight.w600, fontSize: 25),
        ),
        const Text(
          "Lorem Ipsum is simply dummy text of"
          "\nthe printing and typesetting industry. "
          "\nLorem Ipsum has been the industry's standard "
          "\ndummy text ever since the 1500s, when "
              "\nan unknown printer took a galley "
              "\nof type and scrambled it to "
              "\nmake a type specimen book.",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Eczar', fontSize: 15),
          
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: double.maxFinite,
          child: Card(
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/ach.jpg',
                    fit: BoxFit.cover, width: double.infinity),
                Text("Sampradayas",style: TextStyle(fontFamily: 'Eczar',fontSize: 15),)
              ],
            ),
          ),
        )
      ],
    );
  }
}

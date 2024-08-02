import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';

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
      // ClipRRect(
      //   borderRadius: BorderRadius.circular(30.0),
      //   child: Image.asset('assets/images/img1.jpeg',
      //       fit: BoxFit.cover, width: double.infinity),
      // ),
      // ClipRRect(
      //   borderRadius: BorderRadius.circular(30.0),
      //   child: Image.asset('assets/images/img2.jpeg',
      //       fit: BoxFit.cover, width: double.infinity),
      // ),
      // ClipRRect(
      //   borderRadius: BorderRadius.circular(30.0),
      //   child: Image.asset('assets/images/img3.jpeg',
      //       fit: BoxFit.cover, width: double.infinity),
      // ),
      // ClipRRect(
      //   borderRadius: BorderRadius.circular(30.0),
      //   child: Image.asset('assets/images/img4.jpeg',
      //       fit: BoxFit.cover, width: double.infinity),
      // ),
      // ClipRRect(
      //   borderRadius: BorderRadius.circular(30.0),
      //   child: Image.asset('assets/images/img5.jpeg',
      //       fit: BoxFit.cover, width: double.infinity),
      // ),
      // ClipRRect(
      //   borderRadius: BorderRadius.circular(30.0),
      //   child: Image.asset('assets/images/img6.jpeg',
      //       fit: BoxFit.cover, width: double.infinity),
      // ),
      Sampraday('assets/images/ach.jpg','Vaishnavism'),
      Sampraday('assets/images/log.jpg','Shaivism')
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(18.5, 20, 18.5, 0),
      child: ListView(
        children: <Widget>[
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to IKSHA",
                  style: TextStyle(
                      fontFamily: 'Eczar',
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of"
                  "the printing and typesetting industry. "
                  "Lorem Ipsum has been the industry's standard "
                  "dummy text ever since the 1500s, when "
                  "an unknown printer took a galley "
                  "of type and scrambled it to "
                  "make a type specimen book.",
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontFamily: 'Eczar', fontSize: 12, height: 1.8),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CarouselSlider(
            items: imageSliders,
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: false,
              autoPlay: false,
              //enlargeCenterPage: true,
              viewportFraction: 0.9,

              initialPage: 2,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
              color: background,
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/images/img1.jpeg',
                            fit: BoxFit.cover, width: double.infinity),
                      ),
                    ),
                    const Text(
                      "Sampradayas",
                      style: TextStyle(fontFamily: 'Eczar', fontSize: 32),
                    ),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing"
                      "and typesetting industry. Lorem Ipsum has been "
                      "the industry's standard dummy text ever since "
                      "the 1500s, when an unknown printer took a galley "
                      "of type and scrambled it to make a type specimen book.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Eczar', fontSize: 13),
                    ),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Scaffold Sampraday(String File, String T) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              opacity: 1,
              image: AssetImage(File),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15, 8, 8, 8),
                child: Text(
                  T,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Eczar',
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

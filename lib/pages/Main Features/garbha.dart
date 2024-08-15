import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';

class Garbha extends StatelessWidget {
  const Garbha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.5, 38, 16.5, 0),
                child: Container(
                  height: 500,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/images/garbha.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.3, 430, 16.3, 0),
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 270,
              decoration: BoxDecoration(
                color: const Color(0xFFFDF5DF),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Garbha Sanskar",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Eczar',
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "The Garbha Sanskar Guide offers"
                      "comprehensive prenatal education,"
                      "combining traditional Hindu practices "
                      "and modern knowledge to enhance the "
                      "well-being of both mother and child."
                      "It includes rituals, dietary music, "
                      "recommendations, and meditative "
                      "techniques for a healthy pregnancy.",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontFamily: 'Eczar',height: 1.7, fontSize: 13),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      elevation: 8.0,
                      color: Color(0xDF644C00),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Explore",
                          style:
                              TextStyle(color: Colors.white, fontFamily: 'Eczar',fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                      ),
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
}

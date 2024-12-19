import 'package:flutter/material.dart';

import 'Main Features/garbhainfo/ginfo.dart';

class GarbhaSanskar extends StatefulWidget {
  const GarbhaSanskar({super.key});

  @override
  State<GarbhaSanskar> createState() => _GarbhaSanskarState();
}

class _GarbhaSanskarState extends State<GarbhaSanskar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25),
                height: 500,
                width: double.maxFinite,
                decoration: const BoxDecoration(

                  image: DecorationImage(
                      image: AssetImage('assets/images/garbha.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 430, 0, 0),
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.bottomCenter,
              height: 280,
              decoration: BoxDecoration(
                color: const Color(0xFFFDF5DF),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Garbha Sanskar",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Eczar',
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
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
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Ginfo(),
                          ),
                        );
                      },
                      child: const Card(
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

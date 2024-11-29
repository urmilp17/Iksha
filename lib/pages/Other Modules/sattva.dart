import 'package:flutter/material.dart';

import '../../colours.dart';

class SattvaPage extends StatefulWidget {
  const SattvaPage({super.key});

  @override
  _SattvaPageState createState() => _SattvaPageState();
}

class _SattvaPageState extends State<SattvaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Mantra Image
              Container(
                width: double.maxFinite,
                height: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/Sattva.jpeg",
                        ),
                        fit: BoxFit.cover)),
              ),
              const Text(
                "gÎd",
                style: TextStyle(fontFamily: "Deva", fontSize: 45),
              ),
              
              Text(
                " The word means “light”,“goodness” and “purity” in Sanskrit.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Eczar"
                ),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  "One of the aspects of Sattva guna is cleanliness, and taking good care of oneself. Keep your body clean, but also – keep your home clean.\nLiving in a tidy home has a positive impact on our mood. Also, the act of cleaning itself can help us get rid of not only physical but also mental clutter.",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Eczar",
                      fontSize: 16,
                      height: 1.5),
                ),
              ),
              Text("Example")
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SattvaPage(),
    debugShowCheckedModeBanner: false,
  ));
}

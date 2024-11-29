import 'package:flutter/material.dart';

class TamasPage extends StatelessWidget {
  const TamasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Image
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/tam.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Title
              const Text(
                "V_",
                style: TextStyle(fontFamily: "Deva", fontSize: 45,
                ),
              ),
              // Description
              const Text(
                "The word means “light”, “goodness” and “purity” in Sanskrit.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Eczar",
                ),
              ),
              // const SizedBox(height: 16),
              // Detailed Information
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "One of the aspects of Sattva guna is cleanliness, and taking good care of oneself. Keep your body clean, but also – keep your home clean.\nLiving in a tidy home has a positive impact on our mood. Also, the act of cleaning itself can help us get rid of not only physical but also mental clutter.",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Eczar",
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Example Section
              const Text(
                "Example",
                style: TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
    home: TamasPage(),
    debugShowCheckedModeBanner: false,
  ));
}

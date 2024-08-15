import 'package:flutter/material.dart';

class SattvaPage extends StatefulWidget {
  const SattvaPage({super.key});

  @override
  State<SattvaPage> createState() => _SattvaPageState();
}

class _SattvaPageState extends State<SattvaPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sattva",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
            ),
          ),
          SizedBox(height: 20), // Adds some space between the two texts
          Text(
                      "Sattva is one of the three Gunas (qualities) in Hindu philosophy. "
                          "It represents purity, harmony, balance, and goodness. "
                          "Sattva is associated with a peaceful and clear state of mind, "
                          "and it leads to positive and virtuous thoughts and actions.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

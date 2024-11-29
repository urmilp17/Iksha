import 'package:flutter/material.dart';

class KarmaYog extends StatefulWidget {
  const KarmaYog({super.key});

  @override
  State<KarmaYog> createState() => _KarmaYogState();
}

class _KarmaYogState extends State<KarmaYog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: <Widget>[
              const Text(
                'Karma Yoga consists of two words. It is a compound word consisting of two words – Karma and Yogaha. The word Karma in this context refers to proper action or appropriate action. The word Yoga means proper attitude or appropriate attitude – in Sanskrit Bhāvanā.',
                style: TextStyle(fontFamily: 'Eczar', height: 1.5),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                child: Card(
                  elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.network(
                        "https://i.pinimg.com/736x/f6/71/67/f671675f55154667556bc26b58553d4a.jpg")),
              ),
              const Text(
                'In simple language Karma Yoga is nothing but proper action with proper attitude. Now we have to understand what is meant by proper action. All the human actions possible for us, are broadly classified into three types by the scriptures. This is based on their spiritual influence on the human beings.'
                '\n\nThis is because, the scriptures consider the spiritual personality and the spiritual goal as the most important thing which we cannot ignore and therefore they categorise actions not based on their materialistic benefits and influence. But actions are categorised based on their spiritual influence on you.',
                style: TextStyle(fontFamily: 'Eczar', height: 1.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}

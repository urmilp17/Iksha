import 'package:flutter/material.dart';

class SattvaPage extends StatelessWidget {
  const SattvaPage({super.key});

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
                    image: AssetImage("assets/images/Sattva.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Title
              const Text(
                "Sattva (Purity and Harmony)",
                style: TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Introduction
              const Text(
                "Sattva is the guna of purity, harmony, and balance. It fosters clarity, wisdom, and selflessness, leading to spiritual growth and inner peace.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Eczar",
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              // Shlok
              const Text(
                "Shlok",
                style: TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '"Sattvam sukhe sanjayati" \n(Bhagavad Gita 14.9)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Eczar",
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              // Meaning
              const Text(
                "Meaning",
                style: TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Sattva binds one to joy and knowledge. It promotes a state of harmony, mental clarity, and spiritual awareness.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Eczar",
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              // Symptoms
              const Text(
                "Symptoms",
                style: TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                      "- Clarity of thought and decision-making.\n"
                      "- Desire for spiritual growth and knowledge.\n"
                      "- Emotional stability, with an ability to handle challenges calmly.\n"
                      "- Seeing situations with a clear, unbiased perspective.\n"
                      "- A sense of satisfaction and fulfillment with life.\n"
                      "- No attachment to personal recognition or fame.\n"
                      "- Feeling a deeper connection to spirituality or the divine.\n"
                      "- A natural feeling of gratitude towards life and others.\n"
                      "- Thoughtful actions that promote peace and harmony in others.\n",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Eczar",
                    height: 1.5,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // How to Cultivate Sattva
              const Text(
                "How to Cultivate Sattva",
                style: TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "1. Practice meditation and mindfulness regularly.\n"
                      "2. Eat fresh, light, and nutritious food.\n"
                      "3. Engage in acts of selflessness and kindness.\n"
                      "4. Maintain cleanliness and live in harmony with nature.",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Eczar",
                    height: 1.5,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
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

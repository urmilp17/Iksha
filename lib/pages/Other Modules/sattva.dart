import 'package:flutter/material.dart';

class SattvaPage extends StatefulWidget {
  const SattvaPage({super.key});

  @override
  _SattvaPageState createState() => _SattvaPageState();
}

class _SattvaPageState extends State<SattvaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Sattva "),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Share functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Mantra Image
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Image.asset('assets/images/prashna.jpg'), // image path
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Mantra Text
              const Text(
                "Title : Sattva ",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  " The word means “light,” “goodness” and “purity” in Sanskrit.",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Meaning
              const Text(
                "Sattva Guna:",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "One of the aspects of Sattva guna is cleanliness, and taking good care of oneself. Keep your body clean, but also – keep your home clean. Living in a tidy home has a positive impact on our mood. Also, the act of cleaning itself can help us get rid of not only physical but also mental clutter.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),

              // Details
              const Text(
                "Sattvic Foods:",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "promote a clear mind and is mainly fresh, juicy and nourishing vegetarian fare, easy to digest and made with love. Free of additives and preservatives it can include legumes, vegetables, fruit, ghee and fresh milk. Such foods raise ones’ consciousness, inspire positive action, deeper meditation and unleash ones’ latent potential and creativity; happy and at peace, effectively dealing with the outside world.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),

              // Benefits
              const Text(
                "Benefits:",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "🔆 This mantra blesses the practitioner with knowledge and wisdom.\n\n🔆 Improves weak memory.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
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
    home: SattvaPage(),
    debugShowCheckedModeBanner: false,
  ));
}

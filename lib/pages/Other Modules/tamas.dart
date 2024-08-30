import 'package:flutter/material.dart';

class TamasPage extends StatelessWidget {
  const TamasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Tamas"),
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
                "Title : Tamas ",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  " Tamas is a Sanskrit word meaning darkness.",
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
                "Tamas Guna:",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Tamas is the quality of inertia, inactivity, dullness, or lethargy. It is the lowest of three qualities or Gunas. Tamas is the template for inertia or resistance to action. It has also been translated from Sanskrit as “indifference.” It is because of Tamo or Tamas guna you experience dullness and ignorance.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),

              // Details
              const Text(
                "Tamasic Foods:",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                " require a lot of energy to digest and have a grounding effect but usually create inertia and can dull the mind. To these belong onions, mushrooms, meats, leftovers, microwaved and frozen foods. Foods made with indifference also have tamasic qualities. Such foods do nothing to lift ones’ consciousness and energy, but rather drag one into a state of inertia and laziness. ",
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
    home: TamasPage(),
    debugShowCheckedModeBanner: false,
  ));
}

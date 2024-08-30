import 'package:flutter/material.dart';

class RajasPage extends StatelessWidget {
  const RajasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Rajas "),
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
                "Title : Rajas ",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "The matter surrounding you is movable, Blood continuously circulates is because of Rajas Guna (activity) present in nature and the body.",
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
                "Rajas Guna:",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Rajas Guna is known for ‘fickling & activity’ state among trigunas. Characteristics of Rajas guna are desire, fear, depression, and anxiety, selfish, excited, workaholic, ambitious, chaos, restlessness and angry. Rajas Guna symbolizes with Red color.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),

              // Details
              const Text(
                "Rajasic Foods:",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                " usually come into play with hard labor as they support physical endurance and a resolute state of mind. They contain garlic, spices, caffeine (from coffee, black tea and chocolate), eggs, meat, alcohol and fermented or canned foods. Foods made in anger, fried foods or over-cooked Sattvic foods also get Rajasic qualities. These foods give an initial burst of energy but eventually one experiences a low or increase in stress levels. A predominantly rajasic",
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
    home: RajasPage(),
    debugShowCheckedModeBanner: false,
  ));
}

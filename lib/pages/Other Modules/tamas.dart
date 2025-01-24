import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class TamasPage extends StatelessWidget {
  const TamasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
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
              const SizedBox(height: 16),
              // Title
               Text(
                localizations?.tamas_title??"Tamas \n(Inertia and Ignorance)",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Introduction
               Text(
                 localizations?.tamas_desc??"Tamas is the guna of darkness, inertia, and ignorance. It brings lethargy, confusion, and resistance to change, leading to stagnation and delusion.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "Eczar",
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              // Shlok
               Text(
                 localizations?.shlok??"Shlok",
                style: const TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
               Text(
                 localizations?.shlok_t??'"Tamah pramade sanjayatyuta" \n(Bhagavad Gita 14.9)',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "Eczar",
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              // Meaning
              Text(
                localizations?.meaning??"Meaning",
                style: const TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
               Text(
                localizations?.shlok_tm??"Tamas binds one to ignorance and delusion. It clouds judgment, causing lethargy, confusion, and indulgence in destructive habits.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "Eczar",
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              // Symptoms
               Text(
                 localizations?.symptoms??"Symptoms",
                style: const TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  localizations?.tamas_sym??"- Attraction to destructive or harmful behaviors.\n"
                      "- Attraction to destructive or harmful behaviors.\n"
                      "- Lack of motivation and apathy towards personal goals.\n"
                      "- Difficulty focusing or comprehending simple tasks (mental fog).\n"
                      "- Avoidance of responsibility or decision-making.\n"
                      "- Tendency to dwell on negative thoughts without clear reason.\n"
                      "- Extreme fear or resistance to change or new experiences.\n"
                      "- Seeking distractions or addictions to avoid facing reality.\n"
                      "- Feelings of depression or hopelessness about the future.\n",
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Eczar",
                    height: 1.5,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // How to Overcome Tamas
               Text(
                 localizations?.tamas_how??"How to Overcome Tamas ?",
                style: const TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  localizations?.tamas_how_??"1. Engage in regular physical activity to break inertia.\n"
                      "2. Consume fresh and healthy food; avoid processed or stale food.\n"
                      "3. Practice meditation to develop mental clarity.\n"
                      "4. Surround yourself with positive and inspiring individuals.",
                  style: const TextStyle(
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
    home: TamasPage(),
    debugShowCheckedModeBanner: false,
  ));
}

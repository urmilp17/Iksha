import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class RajasPage extends StatelessWidget {
  const RajasPage({super.key});

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
                    image: AssetImage("assets/images/rajas.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Title
              const SizedBox(height: 16),
               Text(
                localizations?.rajas_title ??"Rajas \n(Activity and Passion)",
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
                localizations?.rajas_desc ??"Rajas represents energy, passion, and activity. It drives ambition, effort, and desires, but can lead to restlessness and attachment to outcomes.",
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
                localizations?.shlok ??"Shlok",
                style: const TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
               Text(
                 localizations?.shlok_r ??'"Rajah karmani bharata" \n(Bhagavad Gita 14.9)',
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
                 localizations?.meaning ??"Meaning",
                style: const TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
               Text(
                 localizations?.shlok_rm ??"Rajas binds one to activity and desires. It fuels ambition and dynamism but can result in agitation and dissatisfaction due to unfulfilled cravings.",
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
                 localizations?.symptoms ??"Symptoms",
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
                  localizations?.rajas_sym ??"- Desire for material success and recognition.\n"
                      "- Anxiety and dissatisfaction when goals are unmet.\n"
                      "- Inability to focus or calm the mind, constantly jumping between thoughts.\n"
                      "- A constant drive to achieve more, often leading to burnout.\n"
                      "- Getting easily frustrated or upset by setbacks.\n"
                      "- An overwhelming urge to speak without pause, often due to anxiety or excitement.\n"
                      "- An unending desire for external validation.\n"
                      "- Making decisions quickly without considering the long-term consequences.\n"
                      "- Over-prioritizing material success and wealth. \n",
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Eczar",
                    height: 1.7,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // How to Balance Rajas
               Text(
                 localizations?.rajas_how ??"How to Balance Rajas ?",
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
                  localizations?.rajas_how_ ??"1. Practice yoga and pranayama to calm the mind.\n"
                      "2. Avoid overstimulation and excessive desires.\n"
                      "3. Focus on detaching from the results of actions.\n"
                      "4. Meditate regularly to cultivate inner peace.",
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
    home: RajasPage(),
    debugShowCheckedModeBanner: false,
  ));
}

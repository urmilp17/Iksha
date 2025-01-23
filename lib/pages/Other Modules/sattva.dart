import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SattvaPage extends StatelessWidget {
  const SattvaPage({super.key});

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
                    image: AssetImage("assets/images/Sattva.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Title
              Text(
                localizations?.sattva_title??"Sattva \n(Purity and Harmony)",
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
                localizations?.sattva_desc??"Sattva is the guna of purity, harmony, \nand balance. It fosters clarity, wisdom, \nand selflessness, leading to \nspiritual growth and inner peace.",
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
                style:const TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
               Text(
                 localizations?.shlok_s ??'"Sattvam sukhe sanjayati" \n(Bhagavad Gita 14.9)',
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
                localizations?.shlok_sm ??"Sattva binds one to joy and knowledge. It promotes a state of harmony, mental clarity, and spiritual awareness.",
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
                  localizations?.sattva_sym ?? "- Clarity of thought and decision-making.\n- Desire for spiritual growth and knowledge.\n- Emotional stability, with an ability to handle challenges calmly.\n- Seeing situations with a clear, unbiased perspective.\n- A sense of satisfaction and fulfillment with life.\n- No attachment to personal recognition or fame.\n- Feeling a deeper connection to spirituality or the divine.\n- A natural feeling of gratitude towards life and others.\n- Thoughtful actions that promote peace and harmony in others.\n",
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Eczar",
                    height: 1.5,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // How to Cultivate Sattva
               Text(
                localizations?.sattva_how ??"How to Cultivate Sattva ?",
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
                  localizations?.sattva_how_ ??"1. Practice meditation and mindfulness regularly.\n2. Eat fresh, light, and nutritious food.\n3. Engage in acts of selflessness and kindness.\n4. Maintain cleanliness and live in harmony with nature.",
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
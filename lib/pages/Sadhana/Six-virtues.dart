import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iksha/colours.dart';

class ShadSampati extends StatelessWidget {
  const ShadSampati({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFFFDF5DF),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        localizations?.what_is_shad??'What is Shat-sampatti?',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                            fontFamily: 'Eczar'
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 3),
              const Text(
                'e_m[XgmYZgån[Îm… H\$m ?\ne_mo X_ Cna_pñV[Vjm lÕm g_mYmZ§ M B[V &',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: "DevaHead"
                ),
              ),
              const SizedBox(height: 10),
              // Divider (Blue line)
              Container(
                height: 3,
                width: 60,
                color: iconcolor,
              ),
              const SizedBox(height: 10),
              // Content
              SizedBox(
                height: 500,
                child: RawScrollbar(
                  thumbColor: iconcolor,
                  thumbVisibility: true,
                  radius: const Radius.circular(10.0),
                  child: SingleChildScrollView(
                    child: Text(
                      localizations?.shad_info ??'Meaning: What are the Shama etc., six-fold virtues constituting the inner wealth? They are Shama, Dama, Uparama, Titiksha, Shraddha, and Samadhana.'
                          'These six virtues shape the character of a person. Having these virtues indicates the capability of a Sadhaka to endure, control the mind and senses, concentrate, and finally have unswerving faith in achieving his goal. The six attributes are taken as one unit because they pertain to the various psychological aspects involved in bringing about mental control and discipline.'
                          'After discrimination dawns on a person, he has awakened to the real purpose of his existence. It moves internally to drive the person to seek more than what he sees in the transient world. However, he has his old traits that distract him. Then comes Vairagya which prompts as an inner restraining voice at every passing appearance.',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Eczar'
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
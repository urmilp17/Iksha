import 'package:flutter/material.dart';
import 'package:iksha/pages/Yogas/Yogas.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Yoga extends StatelessWidget {
  const Yoga({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.5, 16, 16.5, 0),
                child: Container(
                  height: 500,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/images/yog.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.3, 393, 16.3, 0),
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 270,
              decoration: BoxDecoration(
                color: const Color(0xFFFDF5DF),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Text(
                      localizations?.yoga_questionnaire_title ??"Yoga Questionnaire",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontFamily: 'Eczar',
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                     Text(
                      localizations?.yoga_questionnaire_description ??"The Questionnaire helps users identify "
                      "their spiritual path—Karma (action), "
                      "Bhakti (devotion), or Gyan (knowledge) "
                      "through a series of introspective "
                      "questions,providing personalized "
                      "guidance based on their responses "
                      "to enhance their spiritual journey.",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontFamily: 'Eczar', height: 1.6, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Yogas(),
                          ),
                        );
                      },
                      child:  Card(
                        elevation: 8.0,
                        color: const Color(0xDF644C00),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            localizations?.find_button??" Find ",
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Eczar',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

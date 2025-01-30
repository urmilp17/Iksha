import 'package:flutter/material.dart';
import 'package:iksha/pages/Yogas/Yogas.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Yoga extends StatelessWidget {
  const Yoga({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context).languageCode;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double getFontSize(String locale, double defaultSize, double hindiSize) {
      return locale == 'hi' ? hindiSize : defaultSize;
    }

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.04,
                  screenHeight * 0.02,
                  screenWidth * 0.04,
                  0,),
                child: Container(
                  height: screenHeight * 0.4,
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
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.04,
              screenHeight * 0.4,
              screenWidth * 0.04,
              0,),
            child: Container(
              alignment: Alignment.bottomCenter,
              height: screenHeight * 0.38,
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
                      style:  TextStyle(
                          fontFamily: 'Eczar',
                          fontWeight: FontWeight.w600,
                          fontSize: screenHeight * 0.03),
                    ),
                     SizedBox(
                      height: screenHeight * 0.005,
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
                      style:  TextStyle(
                          fontFamily: 'Eczar', height: 1.6, fontSize: getFontSize(
                        currentLocale,
                        screenHeight * 0.02,
                        screenHeight * 0.021,
                      ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
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
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          child: Text(
                            localizations?.find_button??" Find ",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Eczar',
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.02),
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

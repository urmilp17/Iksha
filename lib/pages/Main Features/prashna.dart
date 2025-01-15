import 'package:flutter/material.dart';
import 'package:iksha/pages/Main%20Features/chat.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Prashna extends StatelessWidget {
  const Prashna({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context).languageCode;
    double getFontSize(String locale, double defaultSize, double hindiSize) {
      return locale == 'hi' ? hindiSize : defaultSize;
    }
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
                        image: AssetImage('assets/images/prashna.jpg'),
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
                      localizations?.prashna_uttari_title ??"Prashna Uttari",
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
                      localizations?.prashna_uttari_description ?? "The Question Answer Vector Model "
                      "uses advanced AI to analyze user "
                      "questions and provide answers based on "
                      "Hindu scriptures. It helps users explore "
                      "Dharma, spiritual paths, and "
                      "philosophical concepts by delivering "
                      "accurate, and insightful responses.",
                      textAlign: TextAlign.left,
                      style:  TextStyle(
                          fontFamily: 'Eczar', height: 1.6, fontSize: getFontSize(currentLocale, 14, 15)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AskQuestion(),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 8.0,
                        color: const Color(0xDF644C00),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            localizations?.ask_prashnas_button ??"Ask Prashnas",
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

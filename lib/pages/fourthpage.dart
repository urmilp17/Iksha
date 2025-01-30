import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Main Features/garbhainfo/ginfo.dart';

class GarbhaSanskar extends StatefulWidget {
  const GarbhaSanskar({super.key});

  @override
  State<GarbhaSanskar> createState() => _GarbhaSanskarState();
}

class _GarbhaSanskarState extends State<GarbhaSanskar> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
                padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.04,
                  screenHeight * 0.05,
                  screenWidth * 0.04,
                  0,
                ),
                child: Container(
                  height: screenHeight * 0.45,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/images/garbha.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.04,
              screenHeight * 0.45,
              screenWidth * 0.04,
              0,
            ),
            child: Container(
              alignment: Alignment.bottomCenter,
              height: screenHeight * 0.42,
              decoration: BoxDecoration(
                color: const Color(0xFFFDF5DF),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      localizations?.garbha_sanskar_title ?? "Garbha Sanskar",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Eczar',
                        fontWeight: FontWeight.w600,
                        fontSize: screenHeight * 0.03, // Dynamic font size
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Text(
                      localizations?.garbha_sanskar_description ??
                          "The Garbha Sanskar Guide offers"
                              "comprehensive prenatal education,"
                              "combining traditional Hindu practices "
                              "and modern knowledge to enhance the "
                              "well-being of both mother and child."
                              "It includes rituals, dietary music, "
                              "recommendations, and meditative "
                              "techniques for a healthy pregnancy.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Eczar',
                        height: 1.6,
                        fontSize: getFontSize(
                          currentLocale,
                          screenHeight * 0.02,
                          screenHeight * 0.021,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Ginfo(),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 8.0,
                        color: const Color(0xDF644C00),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          child: Text(
                            localizations?.explore_button ?? "Explore",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Eczar',
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.02,
                            ),
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
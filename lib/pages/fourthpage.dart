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
              Container(
                margin: const EdgeInsets.only(top: 30),
                height: 500,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/garbha.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 430, 0, 0),
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.bottomCenter,
              height: 280,
              decoration: const BoxDecoration(
                color: Color(0xFFFDF5DF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      localizations?.garbha_sanskar_title ?? "Garbha Sanskar",
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
                          height: 1.7,
                          fontSize: getFontSize(currentLocale, 13, 16)),
                    ),
                    const SizedBox(
                      height: 5,
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
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            localizations?.explore_button ?? "Explore",
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

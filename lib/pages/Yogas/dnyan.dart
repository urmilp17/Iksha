import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../internet_service.dart';

class DnyanYog extends StatefulWidget {
  const DnyanYog({super.key});

  @override
  State<DnyanYog> createState() => _DnyanYogState();
}

class _DnyanYogState extends State<DnyanYog> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context).languageCode;
    final isConnectedToInternet =
        Provider.of<InternetConnectionService>(context).isConnectedToInternet;

    double getFontHeight(String locale, double defaultSize, double hindiSize) {
      return locale == 'hi' ? hindiSize : defaultSize;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: RawScrollbar(
        thumbColor: iconcolor,
        thumbVisibility: true,
        radius: const Radius.circular(10.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Text(localizations?.jnanayoga_intro ??
                  "Jnanayoga is a stream of yoga that involves Buddhi (बुद्धि) (intellect), "
                  "self- introspection and chintan (चिन्तन) that leads to the ultimate "
                  "realization that Jiva (जीव) and Brahma are inseparable (Moksha)."
                  "\n\nTo progress in Jnanayoga, one pointedness, discipline and a "
                  "sharp intellect is required, because only Jnana leads to Saksahtkar "
                  "(to know things as they truly are).",
                  style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: isConnectedToInternet ? Container(
                      width: double.maxFinite,
                      height: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/736x/7e/8d/6f/7e8d6fe4e1d86b16bcd921e9be36265e.jpg"),
                            fit: BoxFit.cover,
                            scale: 1),
                      ),
                      child: const Text(""),
                    ):Column(
                  children: <Widget>[
                  Icon(
                    Icons.warning_rounded,
                    size: 50,
                    color: iconcolor,
                  ),
                  Text(
                    localizations?.internet ?? "No Internet",
                    style: const TextStyle(fontFamily: "Eczar"),
                  ),
                  ],
                ),
                  ),
                ),
                 Text(
                   localizations?.jnanayoga_what_is_jnana ??"What is Jnana?",
                  style: const TextStyle(
                      fontFamily: 'Eczar',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                Text(
                  localizations?.jnanayoga_sbg_reference ??"In Shrimadbhagvadgita Jnanayoga is reffered to as Samkhyayoga, "
                  "which states that Mukti (मुक्ति) is possible with Tattvajnana (तत्वज्ञान); "
                  "but in practice the sadhana of Vedanta is also known as Jnanayoga."
                  "\n\nAccording to the theory of Jnanayoga, the Atman (Paramatma) is "
                  "Aananda-svaroopa (आनन्द स्वरूप), Jnanasvaroopa (ज्ञानस्वरूप), Satya (सत्य), "
                  "Nitya (नित्य) and Shuddha (शुद्ध). Nothing other than Brahman exists "
                  "(permanent) in this world. This entire world is illuminatd and "
                  "situated in Brahman. Brahman itself is the illuminator and although "
                  "its fire is one, it manifests in various forms.\n",
                  style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                ),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: localizations?.jnanayoga_classification_intro ?? "Jnanayoga sadhana is classified into two:\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_bahiranga_intro ??"i. - Bahiranga sadhana - ",
                      style: TextStyle(
                          fontFamily: 'Eczar',
                          height: getFontHeight(currentLocale, 1.5, 1.7),
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_bahiranga_1 ??"for beginners.\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_antaranga_intro ??"ii. - Antaranga sadhana - ",
                      style: TextStyle(
                          fontFamily: 'Eczar',
                          height: getFontHeight(currentLocale, 1.5, 1.7),
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_antaranga_1 ??"for advanced seekers.\n\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_bahiranga_sadhana ??"Bahiranga sadhana (बहिरंग साधन) - \n",
                      style: TextStyle(
                          fontFamily: 'Eczar',
                          height: getFontHeight(currentLocale, 1.5, 1.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: localizations?.four_pillars ?? "The four pillars are -\n\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_bahiranga_pillars ??"· Viveka (विवेक)\n",
                      style: const TextStyle(fontFamily: 'Eczar', height: 1.7,fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_bahiranga_details ??"Refer Homepage for detailed information.\n",
                      style: const TextStyle(fontFamily: 'Eczar', height: 1.5),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_antaranga_sadhana ??"Antaranga sadhana (अंतरंग साधन) - \n",
                      style: TextStyle(
                          fontFamily: 'Eczar',
                          height: getFontHeight(currentLocale, 1.5, 1.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: localizations?.four_pillars ??"The four pillars are -\n\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_shravana ??"· Shravana (श्रवण)\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7),fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_shravana_description ??"To listen and comprehend knowledge (subtlest wisdom) about Brahma, preachings of scholars, yogis and Guru about Brahma with utmost attention and peaceful mind is Shravana.\n\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_manana ??"· Manana (मनन)\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7),fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_manana_description ??"Process of repeatedly recollecting the knowledge and wisdom that one hears, and eliminating any doubts that arise by questioning the speaker. Just as an animal masticates its food, a sincere sadhaka or aspirant recollects and masticates on the teachings that he/she has partaken.\n\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_nididhyasana ??"· Nididhyasana (निदिध्यासन)\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7),fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_nididhyasana_description ??"After Shravana and manana, when the sadhaka establishes the heard knowledge in hrdaya i.e. adopts it in his/her Acharana (conduct) and abides in the teachings, it is Nidhidhyasana.\nAccording to Vedanta, only when one contemplates on Brahman in all jada padartha starting from the body to the Buddhi, it is Nidhidhyasana.\n\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_nididhyasana_components ??"According to Aparokshanubhuti, Niddhidhyasana has fifteen components: Yama (यम), Niyama (नियम), Tyaga (त्याग), Mauna (मौन), Desha (देश), Kaala (काल), Asana (आसन), Moolabandha (मूलबंध), Deha (भक्ति), Sthiti (सृष्टी), Pranayama (प्रत्याहार), Pratyahara, Dharana (धारणा), Dhyana (ध्यान) and Atma Sakshatkar (आत्म साक्षात्कार) with Atma Sakshatkar being the ultimate state of Sadhana.\n\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_atma_sakshatkar ??"· Atma Sakshatkar (आत्म साक्षात्कार)\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7),fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_atma_sakshatkar_description ??"When the sadhaka reaches the highest state in his/her Sadhana, and recognizes his/her true svaroop and is able to synchronize himself/herself with the Paramatattva (परमतत्व), he/she becomes eligible for Atma-sakshatkar.\n\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_jnani_qualities ??"Qualities of a Jnani (ज्ञानी)\n",
                      style: const TextStyle(
                          fontFamily: 'Eczar',
                          height: 1.7,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: "प्रजहाति यदा कामान्सर्वान्पार्थ मनोगतान् |\nआत्मन्येवात्मना तुष्ट: स्थितप्रज्ञस्तदोच्यते ||\nदु:खेष्वनुद्विग्नमना: सुखेषु विगतस्पृह: |\nवीतरागभयक्रोध: स्थितधीर्मुनिरुच्यते ||\n\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7),fontSize: 15,fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: localizations?.jnanayoga_sbg_2_18_19 ?? "When a man abandons all the desires of the heart and is satisfied in the Self alone by the Self, then he is said to be one of steady wisdom. One whose mind remains undisturbed amidst misery, who does not crave for pleasure, and who is free from attachment, fear, and anger, is called a sage of steady wisdom\n"
                          "\nAccording to (S.B.G-2.18-19)\n"
                          "The man of Shraddha (श्रद्धा), the devoted and the master of his senses obtains knowledge. "
                          "Having obtained this knowledge, he attains supreme peace. This is the Brahmi (ब्रह्ममी) state. "
                          "Attaining this, none is bewildered. Being established in it even at the death-hour, "
                          "a man gets into oneness with Brahman (ब्रह्म).\n",
                      style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                    ),
                  ],
                  ),
                ),
                Center(
                  child: Text(
                    "तद्विद्धि प्रणिपातेन परिप्रश्नेन सेवया (BG 4.34)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7),fontSize: 16,fontWeight: FontWeight.w500,),
                  ),
                ),
                Text(
                  localizations?.jnanayoga_seek_enlightenment ??"When you seek that enlightenment by prostrating, questioning and performing "
                      "selfless service; \nthe wise, the seers into the Truth \nwill instruct you in that knowledge.\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

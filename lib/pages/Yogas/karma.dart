import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../colours.dart';

class KarmaYog extends StatefulWidget {
  const KarmaYog({super.key});

  @override
  State<KarmaYog> createState() => _KarmaYogState();
}

class _KarmaYogState extends State<KarmaYog> {

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context).languageCode;
    double getFontSize(String locale, double defaultSize, double hindiSize) {
      return locale == 'hi' ? hindiSize : defaultSize;
    }

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
              children: <Widget>[
                 Text(
                  localizations?.karmaYoga_intro?? 'Karma Yoga consists of two words. It is a compound word consisting of two words – Karma and Yogaha. The word Karma in this context refers to proper action or appropriate action. The word Yoga means proper attitude or appropriate attitude – in Sanskrit Bhāvanā.',
                  style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  child: Container(
                    width: double.maxFinite,
                    height: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/736x/f6/71/67/f671675f55154667556bc26b58553d4a.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Text(""),
                  ),
                ),
                Text(
                  localizations?.karmaYoga_description ??'In simple language Karma Yoga is nothing but proper action with proper attitude. Now we have to understand what is meant by proper action. All the human actions possible for us, are broadly classified into three types by the scriptures. This is based on their spiritual influence on the human beings.'
                  '\n\nThis is because, the scriptures consider the spiritual personality and the spiritual goal as the most important thing which we cannot ignore and therefore they categorise actions not based on their materialistic benefits and influence. But actions are categorised based on their spiritual influence on you.\n',
                  style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                ),
                 Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: localizations?.karmaYoga_laws ?? "The four major laws of Karma Yoga are described in Shrimad Bhagvad Gita as follows:\n",
                        style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                      ),
                      TextSpan(
                        text: localizations?.karmaYoga_law1 ??"i. Work with a sense of duty.\n",
                        style: TextStyle(
                            fontFamily: 'Eczar',
                            height: getFontHeight(currentLocale, 1.5, 1.7),
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: localizations?.karmaYoga_law2 ??"ii. Work without getting intensely \n    attached (focused attention) to the work.\n",
                        style: TextStyle(
                            fontFamily: 'Eczar',
                            height: getFontHeight(currentLocale, 1.5, 1.7),
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: localizations?.karmaYoga_law3 ??"iii. Never allow the anxieties about the results to \n     interfere with your mind during the \n    currency of the job and\n",
                        style: TextStyle(
                            fontFamily: 'Eczar',
                            height: getFontHeight(currentLocale, 1.5, 1.7),
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: localizations?.karmaYoga_law4 ??"iv. Accept failure and success with equanimity.\n\n",
                        style: TextStyle(
                            fontFamily: 'Eczar',
                            height: getFontHeight(currentLocale, 1.5, 1.7),
                            fontWeight: FontWeight.w500),
                      ),
                       TextSpan(
                        text: localizations?.karma_types_title ??"Types of Karma According to Bhagwadgita: \n",
                        style: TextStyle(
                            fontFamily: 'Eczar',
                            height: getFontHeight(currentLocale, 1.5, 1.7),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                       TextSpan(
                        text: localizations?.karma_types_description ?? "The way we do actions depends on our personality. "
                            "In other words all our actions are guided by "
                            "three tendencies mamely Sattva (सत्त्व), Rajas (रजस्) and Tamas (तमस)."
                            "\n\nAny action which is undertaken from delusion, without heed to "
                            "consequence, loss, injury and ability is declared to be Tamasika Karma (तामसिक कर्म)."
                            "\n\nAction which is done by one craving for desires, or again with "
                            "egoism or with much effort, is declared to be Rajasika karma (राजसिक कर्म)."
                            "\n\nHe who is free from all material attachments and false ego, who "
                            "is enthusiastic and resolute and who is indifferent to success or "
                            "failure, is a Sattvika karma (सात्विक कर्म) performer of deeds in the righteous path.\n\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.7,fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: localizations?.karmaYoga_goal ?? "The goal of life is to reach highest happiness which is the state of total self- satisfaction. It is a state of pure consciousness, a state from where all actions emerge. This is Nishkamya Karma (निष्काम कर्म) the total non-action/ desireless actions. Though this ultimate goal of life, is total non-action we cannot reach that stated by surrendering action.\n\nThe essence of converting Kamya Karma (काम्य कर्म) into Karma Yoga (कर्मयोग) is in cutting out the strong attachment to fruits of action, which continuously lead us to uncessing work. Asanga (असंग), non-attachment is the key. Unattached work is the process. It is this detachment that counts in Karma Yoga. \nIt is that special attitude, skill that converts \nKamya Karma to Karma Yoga.\n\n",
                        style: TextStyle(
                            fontFamily: 'Eczar',
                            height: getFontHeight(currentLocale, 1.5, 1.7)),
                      ),
                       TextSpan(
                        text: localizations?.karmaYoga_secrets ??"Secrets of Karma Yoga (कर्म योग): \n",
                        style: TextStyle(
                            fontFamily: 'Eczar',
                            height: getFontHeight(currentLocale, 1.5, 1.7),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                       TextSpan(
                        text: localizations?.karmaYoga_secret_description ??"It is necessary to discriminate \naction, forbidden action and inaction. \nThe secrets of Karma Yoga are:\n",
                        style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                      ),
                       TextSpan(
                        text: localizations?.karmaYoga_secret ??"Perform action.\nBeing fixed in Yoga.\nRenouncing attachments and \nEven minded in success and failure.\n\n",
                        style: TextStyle(
                            fontFamily: 'Eczar',
                            height: getFontHeight(currentLocale, 1.5, 1.7),
                            fontWeight: FontWeight.w500),
                      ),
                       TextSpan(
                        text: localizations?.karmaYoga_gita ?? "Gita doesn't define that Karma is work done to perfection is verily Yoga (Samatva Buddhi, (समत्व बुद्धि). But it advocates that Yoga is dexterity in performing actions. Yogah karmasu kausalam, when you perform an aciton with an equianimous attidtude (Yoga), then such an action does not bind a man into bondage, even though the nature of karma is is to bind.\n",
                        style: TextStyle(fontFamily: 'Eczar', height: getFontHeight(currentLocale, 1.5, 1.7)),
                      ),
                    ],
                  ),
                ),
                 const Center(
                  child: Text(
                    "कर्मण्यकर्म यः पश्येदकर्मणि च कर्म यः।\nस बुद्धिमान्मनष्येशु स युत्तफः कृत्सकर्मकृत् ।।\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Eczar', height: 1.5,fontSize: 16,fontWeight: FontWeight.w500,),
                  ),
                ),
                Text(
                  localizations?.karmaYoga_verse_translation ?? "He who sees action of Jivatma (जीवात्मा) in inaction and Parmatma's (परमात्मा) inaction in action, "
                      "he is wise among men, he is a Yogi/Yukta (one who performs actions with equanimous attitude) "
                      "and accomplisher of everything. In such accomplished men, all impressions of actions are "
                      "burnt by the fire of knowledge. \nOne who performs actions with this knowledge, attains "
                      "Jnana and in this fire of knowledge all impressions of actions are burnt\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Eczar', height: 1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

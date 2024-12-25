import 'package:flutter/material.dart';

import '../../colours.dart';

class BhaktiYog extends StatefulWidget {
  const BhaktiYog({super.key});

  @override
  State<BhaktiYog> createState() => _BhaktiYogState();
}

class _BhaktiYogState extends State<BhaktiYog> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> bhaktiForms = [
      {
        "title": "Śravaṇam (Hearing): ",
        "description":
            "is hearing about Ishwara. One must always hear about Ishwara when he is reading, recalling or meditating and understand the meaning. As the result of constant Sravanam of Ishwar, the devotee will experience oneness with him.\n"
      },
      {
        "title": "Kīrtanam (Chanting): ",
        "description":
            "is chanting Ishwara's attributes, character, name, power, glory etc. with joy and enthusiasm. It is done either solely or in a group as a public prayer. It increases the devotion to Ishwara and becomes a means of promoting and spreading the love of Ishwara.\n"
      },
      {
        "title": "Smaranam (Recollecting): ",
        "description":
            "is remembering \nthe name, majesty and power of Ishwara.\n"
      },
      {
        "title": "Pādasevanam (Imbibing): ",
        "description":
            "It means walking Guru's (गुरु) (one who has attained Ishwar Sakshatkar) path by imbibing the virtues of Dharma adhered by the Guru in his own life.\n"
      },
      {
        "title": "Archanam (Worshiping): ",
        "description":
            "Worshiping Ishwara with the union of Mind, Word and Deed is called Archana.\n"
      },
      {
        "title": "Vandanam (Prayer): ",
        "description":
            "Invocation and listening to legends/ discourses pertaining to the Ishwara. Vandana is prayer and prostration.\n"
      },
      {
        "title": "Dāsyam (Service): ",
        "description":
            "is the Service of Ishwara. In spite of the identity between the soul and Ishwara, the devotee should always consider that he is one of the humblest servants of Ishwara, which enhance the cause of Ishwara-realization.\n"
      },
      {
        "title": "Sakhyam (Friendship): ",
        "description":
            "In Sakhya-Bhava devotee treats Ishwara as a friend. To be always with the Ishwara, to treat Him as one's own dear friend, to be in His company at all times, to love Him as one's own Self, is Sakhya-Bhava of Bhakti-Marga.\n"
      },
      {
        "title": "Ātmanivedanam (Offering): ",
        "description":
            "The devotee offers everything to Ishwara, including his body, mind and soul. He keeps nothing for himself. He loses even his own self. He has no personal and independent existence. He totally offers himself to Ishwara, which is called Atma Nivaedana."
      },
    ];

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
                const Text(
                  'Bhakti Yoga is not a separate path but encompasses all three main spiritual disciplines: Karma Yoga (Path of Action), Upāsana Yoga (Path of Meditation), and Jnāna Yoga (Path of Knowledge).'
                  'Bhakti Yoga is the overarching attitude of devotion that permeates these practices, making them meaningful and effective.'
                  '\n\nIn Karma Yoga, Bhakti is expressed by dedicating actions to God and accepting results as divine grace.'
                  '\n\nIn Upāsana Yoga, Bhakti manifests through meditation and mental worship.'
                  '\n\nIn Jnāna Yoga, Bhakti reflects in the pursuit of self-realization, equating the self with God.'
                  '\n\nThus, Bhakti Yoga integrates all forms of discipline into a harmonious practice directed towards spiritual liberation.',
                  style: TextStyle(fontFamily: 'Eczar', height: 1.5),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 7),
                  child: Container(
                    width: double.maxFinite,
                    height: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://i.pinimg.com/736x/fa/d7/3d/fad73d4395d54aa9b0b766c015648174.jpg"),
                          fit: BoxFit.cover,
                          scale: 1),
                    ),
                    child: const Text(""),
                  ),
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text:
                              'The three types of Bhakti, based on the intensity and perspective of love for God, are:\n\n',
                          style: TextStyle(fontFamily: 'Eczar', height: 1.5)),
                      TextSpan(
                          text: 'Manda Bhakti (Dull or Selfish Bhakti):',
                          style: TextStyle(
                              fontFamily: 'Eczar',
                              height: 1.5,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text:
                              '\nLove for God as a means to achieve worldly desires or goals.'
                              'Conditional and dependent on God fulfilling specific wishes.'
                              '  The least intense form of devotion.\n\n',
                          style: TextStyle(fontFamily: 'Eczar', height: 1.5)),
                      TextSpan(
                        text: 'Madhyama Bhakti (Middle-Level Bhakti):',
                        style: TextStyle(
                            fontFamily: 'Eczar',
                            height: 1.5,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                          text: '\nLove for God as the ultimate goal of life.'
                              '\nGod is seen as a representation of peace, happiness, and security.'
                              'Devotion is more mature and intense than Manda Bhakti.\n\n',
                          style: TextStyle(fontFamily: 'Eczar', height: 1.5)),
                      TextSpan(
                        text: 'Uttama Bhakti (Supreme Bhakti):',
                        style: TextStyle(
                            fontFamily: 'Eczar',
                            height: 1.5,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                          text: '\nLove for God as non-different from oneself.'
                              'Recognizes the oneness of the individual self and God.'
                              'This highest form of devotion equates love for God with self-love.',
                          style: TextStyle(fontFamily: 'Eczar', height: 1.5)),
                    ],
                  ),
                ),
                const Text(
                  "\nBhakti is devotion or reverential love directed towards a higher principle, "
                  "which could be God or anything regarded as sacred, superior, or deserving of respect. "
                  "It represents love infused with reverence and is an essential concept in spiritual practice. "
                  "Bhakti can be expressed towards parents (Mātru Bhakti, Pitru Bhakti), a teacher (Guru Bhakti), "
                  "one’s country (Desha Bhakti), or God (Īshvara Bhakti). The scriptures analyze Bhakti in both its "
                  "general form (love) and its specific form (love of God).\n",
                  style: TextStyle(fontFamily: 'Eczar', height: 1.5),
                ),
                const Text(
                  "The nine forms of Bhakti are different ways to \nexpress devotion to God, each emphasizing a unique aspect of love:",
                  style: TextStyle(fontFamily: 'Eczar', height: 1.5),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: bhaktiForms.map((form) {
                    return Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: form["title"],
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Eczar',
                                fontSize: 16),
                          ),
                          TextSpan(
                            text: form["description"],
                            style: const TextStyle(
                              fontFamily: 'Eczar',
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "\nTypes of Bhaktas described in \nShrimad Bhagavad Gita:\n",
                        style: TextStyle(
                            fontFamily: 'Eczar',
                            height: 1.5,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: "चतुर्विधा भजन्ते मां जना: सुकृतिनोऽर्जुन |\nआर्तो जिज्ञासुरर्थार्थी ज्ञानी च भरतर्षभ ||\n\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.5,fontSize: 15,fontWeight: FontWeight.w300,fontStyle: FontStyle.italic),
                      ),
                      TextSpan(
                        text: "They are -\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.5),
                      ),
                      TextSpan(
                        text: "· Arta (आर्त) (Distressed one)\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.6,fontSize: 14),
                      ),
                      TextSpan(
                        text: "· Jijnasu (जिज्ञासु) (Inquisitive one)\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.6,fontSize: 14),
                      ),
                      TextSpan(
                        text: "· Artharthee (अर्थार्थी) (desirer of wealth)\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.6,fontSize: 14),
                      ),
                      TextSpan(
                        text: "· Jnani (ज्ञानी) (one who is in search of \n the Absolute knowledge).\n\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.6,fontSize: 14),
                      ),
                      TextSpan(
                        text:
                        "Qualities of a bhakta\n",
                        style: TextStyle(
                            fontFamily: 'Eczar',
                            height: 1.5,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: "1. Not envious and kind to others\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.6,fontSize: 14),
                      ),
                      TextSpan(
                        text: "2. Equipoised\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.6,fontSize: 14),
                      ),
                      TextSpan(
                        text: "3. Level headed\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.6,fontSize: 14),
                      ),
                      TextSpan(
                        text: "4. Act in Ishwarasakshi\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.6,fontSize: 14),
                      ),
                      TextSpan(
                        text: "5. Desireless, pure, expert, free from worry\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.6,fontSize: 14),
                      ),
                      TextSpan(
                        text: "6. Determined etc.\n\n",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.6,fontSize: 14),
                      ),
                      TextSpan(
                        text: "One who is not envious, but who is a kind friend to all living entities, "
                            "who does not think himself a proprietor, who is free from false ego and has equal "
                            "mind both in happiness and in distress, who is always satisfied and engaged in "
                            "devotional service with determination and whose mind and "
                            "intelligence are in agreement with Ishwara (ईश्वर) - he is very dear to Ishwara."
                            "\n\nThat devotee of Ishwara who is desireless, pure, expert, free from worry, "
                            "free from agitation, unconcerned with any mundane (related to desires) endeavour, "
                            "is very dear to Ishwara.One who grasps neither pleasure nor grief, who neither "
                            "grieves nor desires, and who renounces both auspicious and inauspicious things, that devotee is very dear to Ishwara."
                            "\n\nOne who has equal feeling with his friends "
                            "as well as enemies, who is equipoised in honour and dishonour, heat and cold, "
                            "happiness and distress, is very dear to Ishwara."
                            "\n\nOne who is silent even when he is praised or reputed, satisfied with whatever "
                            "comes on its own accord, not attached to domestic life, fixed in determination "
                            "and engaged in devotional service, is very dear to Ishwara.",
                        style: TextStyle(fontFamily: 'Eczar', height: 1.6,fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

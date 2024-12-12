import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class BhaktiYog extends StatefulWidget {
  const BhaktiYog({super.key});

  @override
  State<BhaktiYog> createState() => _BhaktiYogState();
}

class _BhaktiYogState extends State<BhaktiYog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
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
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 7),
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
                    const TextSpan(
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
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Śravaṇam (Hearing): ",
                      style: TextStyle(
                          fontFamily: 'Eczar',
                          height: 1.5,
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text:
                          "Listening to scriptures, stories, and teachings about God.\n",
                      style: TextStyle(
                          fontFamily: 'Eczar',
                          height: 1.5,),
                    ),
                    TextSpan(
                      text: "Kīrtanam (Chanting): ",
                      style: TextStyle(
                          fontFamily: 'Eczar',
                          height: 1.5,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

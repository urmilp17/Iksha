import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../colours.dart';

class Sampradaya2 extends StatelessWidget {
  const Sampradaya2({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 18, 5, 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.keyboard_backspace,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      'assets/images/sp2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child: Column(
                // Add New Widgets here
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Text(
                     localizations?.shaktism ??'Shaktism',
                    style: const TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    localizations?.shakt_info ??'Shaktism involves a galaxy of goddesses, all being regarded as different aspects, manifestations, or personifications of the divine feminine energy called Shakti. It includes various modes of worship, ranging from those focused on the most worshipped Durga, to gracious Parvati, and the fierce Kali. After the decline of Buddhism in India, various Hindu and Buddhist goddesses were combined to form the Mahavidya, a pantheon of ten goddesses. The most common forms of the Mahadevi worshipped in Shaktism include: Durga, Kali, Saraswati, Lakshmi, Parvati, and Tripurasundari. Also worshipped are the various Gramadevatas across the Indian villages.',
                    style: const TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 25),
                   Text(
                     localizations?.shakt_head ??'Part of a series of Shaktism',
                    style: const TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildCard(
                    title: localizations?.sampradayas_1??'Origins and history',
                    subtitle:
                    localizations?.shakt_1 ??'The earliest archaeological evidence of what appears to be an Upper Paleolithic shrine for Shakti worship were discovered in the terminal upper paleolithic site of Baghor I (Baghor stone) in Sidhi district of Madhya Pradesh, India.',
                    imagePath: 'assets/images/testimonial1.jpg',
                  ),
                  _buildCard(
                    title: localizations?.sampradayas_2??'Beliefs and practices',
                    subtitle:
                    localizations?.shakt_2 ??'Shaktism believes in Shakti, the divine feminine power, as the ultimate reality and source of all creation. Its practices include goddess worship, tantric rituals, and celebrations like Durga Puja to honor manifestations of Shakti such as Durga, Kali, and Lakshmi.',                    imagePath: 'assets/images/testimonial2.jpg',
                  ),
                  _buildCard(
                    title: localizations?.sampradayas_3??'Traditions',
                    subtitle:
                    localizations?.shakt_3 ??'Shaktism is a major Hindu tradition that reveres Shakti, the divine feminine energy, as the ultimate reality and cosmic power behind creation, sustenance, and destruction. It encompasses devotional worship, tantric practices, and festivals like Navaratri and Durga Puja, celebrating goddesses such as Durga, Kali, and Lalita Tripura Sundari as manifestations of supreme divinity.',
                    imagePath: 'assets/images/testimonial2.jpg',
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        const url =
                            'https://www.instagram.com/ishaivite?igsh=MXIycTB3c3oxMDF1MA==';
                        final Uri uri = Uri.parse(url);

                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri, mode: LaunchMode.externalApplication);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      icon: Icon(Icons.info, color: iconcolor),
                      label: const Text('Instagram'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: iconcolor,
                        textStyle: const TextStyle(fontFamily: 'Eczar'),
                        side: BorderSide(color: iconcolor),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 35),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required String imagePath,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 25,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Eczar',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontFamily: 'Eczar',
            fontSize: 15,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}

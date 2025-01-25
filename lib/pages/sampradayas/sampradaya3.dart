import 'package:flutter/material.dart';
import 'package:iksha/internet_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../colours.dart';

class Sampradaya3 extends StatelessWidget {
  const Sampradaya3({super.key});

  @override
  Widget build(BuildContext context) {
    final isConnectedToInternet =
        Provider.of<InternetConnectionService>(context).isConnectedToInternet;
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
                      'assets/images/sp3.jpg',
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
                    localizations?.vaishnav ??'Vaishnavism',
                    style: const TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                   Text(
                    localizations?.vaishnav_info ??'One of the major Hindu denominations along with Shaivism, Shaktism, and Smartism. It is also called Vishnuism since it considers Vishnu as the sole supreme being leading all other Hindu deities, that is, Mahavishnu. Its followers are called Vaishnavites or Vaishnavas , and it includes sub-sects like Krishnaism and Ramaism, which consider Krishna and Rama as the supreme beings respectively. According to a 2020 estimate by The World Religion Database (WRD), hosted at Boston University’s Institute on Culture, Religion and World Affairs (CURA), Vaishnavism is the largest Hindu sect, constituting about 399 million Hindus.',
                    style: TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 25),
                   Text(
                     localizations?.vaishnav_head ??'Part of a series of Vaishnavism',
                    style: const TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildCard(
                    title:localizations?.sampradayas_1??'Origins and history',
                    subtitle:
                    localizations?.vaishnav_1 ??'The ancient emergence of Vaishnavism is unclear, the evidence inconsistent and scanty. Syncretism of various traditions resulted in Vaishnavism. Although Vishnu was a Vedic solar deity, he is mentioned less often compared to Agni, Indra, and other Vedic deities, thereby suggesting that he had a minor position in the Vedic religion.',
                    imagePath: 'assets/images/testimonial1.jpg',
                  ),
                  _buildCard(
                    title: localizations?.sampradayas_2??'Beliefs',
                    subtitle:
                    localizations?.vaishnav_2 ??'Vaishnavism is centred on the devotion of Vishnu and his avatars. According to Schweig, it is a "polymorphic monotheism, i.e. a theology that recognises many forms (ananta rupa) of the one, single unitary divinity," since there are many forms of one original deity, with Vishnu taking many forms.',
                    imagePath: 'assets/images/testimonial2.jpg',
                  ),
                  _buildCard(
                    title: localizations?.sampradayas_3??'Traditions',
                    subtitle:
                    localizations?.vaishnav_3 ??'The Vaishnavism traditions may be grouped within four sampradayas, each exemplified by a specific Vedic personality. They have been associated with a specific founder, providing the following scheme: Sri Sampradaya (Ramanuja), Brahma Sampradaya (Madhvacharya), Rudra Sampradaya (Vishnuswami, Vallabhacharya), Kumaras Sampradaya (Nimbarka). These four sampradayas emerged in early centuries of the 2nd millennium CE, by the 14th century, influencing and sanctioning the Bhakti movement.',
                    imagePath: 'assets/images/testimonial2.jpg',
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: isConnectedToInternet ? OutlinedButton.icon(
                      onPressed: () async {
                        const url =
                            'https://www.instagram.com/snaatanhindutva?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==';
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
                    ):Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.warning,
                          size: 18,
                          color: iconcolor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          localizations?.internet ?? "No Internet",
                          style: const TextStyle(fontFamily: "Eczar"),
                        ),
                      ],
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

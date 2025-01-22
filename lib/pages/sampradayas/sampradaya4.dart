import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../colours.dart';

import '../../colours.dart';

class Sampradaya4 extends StatelessWidget {
  const Sampradaya4({super.key});

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
                      'assets/images/sp4.jpg',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Text(
                    localizations?.ganpatya ??'Ganpatya',
                    style: const TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildStyledText(
                    'अधर्मोपचयो धर्मापचयोहि यदा भवेत् !\n'
                        'साधून्संरक्षितुं दुष्टास्तानत्तुं संभवाम्यहम् !',
                    isHighlight: true,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    localizations?.gan_info_1 ??'When Lord Ganesha says in his Gita, the atrocities of the demons increase, '
                        'and at that time, the Lord Himself takes the form of Sagun-Sakar incarnation, performing war-like pastimes. '
                        'But in the present Kali Yuga, or in the history of the world, there are often no such direct demons on earth. '
                        'The gods are in heaven, and the demons are in Patala, performing their duties peacefully.',
                    style: const TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildStyledText(
                    localizations?.gan_info_2 ??'Therefore, the Lord does not need to take such an incarnation. However, even when the gods and demons are peaceful in their respective places, a third component, the human, behaves strangely. '
                        'Some humans try to become god-like through their good deeds, while others behave more horribly than demons. '
                        'At such times, there is no need to kill them physically. The task is to transform their distorted thoughts into good ones. '
                        'Therefore, when the Lord takes a human incarnation at such times, it is called "Shri Guru".',
                  ),
                  const SizedBox(height: 20),
                  _buildBulletSection(
                    title: localizations?.gan_info_title ??'According to the Ganapatya tradition:',
                    items: [
                      localizations?.gan_info_title_1 ??'Pasha/Ganesh - incarnated as Shri Guru Ganakacharya',
                      localizations?.gan_info_title_2 ??'Kamala/Brahma - incarnated as Shri Guru Bhrigu',
                      localizations?.gan_info_title_3 ??'Ankush/Vishnu - incarnated as Shri Guru Vyas',
                      localizations?.gan_info_title_4 ??'Mudgara/Surya - incarnated as Shri Guru Mudgalacharya',
                      localizations?.gan_info_title_5 ??'Parasu/Shiva - incarnated as Shri Guru Shukacharya',
                    ],
                  ),
                  const SizedBox(height: 20),
                   Text(
                    localizations?.gan_info_title_1_ ??'The incarnations of Guru Panchaka in Kali Yuga:',
                    style: const TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildBulletSection(
                    title: '',
                    items: [
                      localizations?.gan_info_title_1_1 ??'Shri Guru Ganakacharya - incarnated as Gaudapadacharya',
                      localizations?.gan_info_title_1_2 ??'Shri Guru Mudgalacharya - incarnated as Ganeshyogindra',
                      localizations?.gan_info_title_1_3 ??'Shri Guru Shukacharya - incarnated as Shankaracharya',
                      localizations?.gan_info_title_1_4 ??'Shri Guru Vyas - incarnated as Girijasuta',
                      localizations?.gan_info_title_1_5 ??'Shri Guru Bhrigu - incarnated as Brahmananda',
                    ],
                  ),
                  const SizedBox(height: 25),
                   Text(
                    localizations?.gan_head ??'Part of a series of Ganpatya',
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
                    localizations?.gan_1 ??'The origins of Ganpatya are unclear and a matter of debate among scholars, as it is an amalgam of pre-Vedic cults and traditions and Vedic culture',
                    imagePath: 'assets/images/testimonial1.jpg',
                  ),
                  _buildCard(
                    title: localizations?.sampradayas_2??'Beliefs and practices',
                    subtitle:
                    localizations?.gan_2 ??'Ganpatya includes organized worship of Ganesha and deep philosophical traditions, rooted in Hinduism.',
                    imagePath: 'assets/images/testimonial2.jpg',
                  ),
                  _buildCard(
                    title: localizations?.sampradayas_3??'Traditions',
                    subtitle:
                    localizations?.gan_3 ??'Ganpatya is ancient and evolved into multiple traditions over time, blending dualism and monism practices. Currently, Mayureshwar Parampara from Morgao,Pune is spreading knowledge and devtion of Ganesha.',
                    imagePath: 'assets/images/testimonial3.jpg',
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        const url =
                            'https://www.instagram.com/prathamaradhya_bappa_?igsh=aGUxb25zbTZ3NHJ1';
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
                          vertical: 12,
                          horizontal: 35,
                        ),
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

  Widget _buildStyledText(String text, {bool isHighlight = false}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Eczar',
        fontSize: isHighlight ? 18 : 16,
        fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
        color: isHighlight ? Colors.black87 : Colors.black87,
        height: 1.5,
      ),
    );
  }

  Widget _buildBulletSection({required String title, required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Eczar',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        const SizedBox(height: 10),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            '• $item',
            style: const TextStyle(
              fontFamily: 'Eczar',
              fontSize: 16,
              height: 1.4,
              color: Colors.black87,
            ),
          ),
        )),
      ],
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

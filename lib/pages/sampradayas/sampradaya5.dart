import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../colours.dart';

class Sampradaya5 extends StatelessWidget {
  const Sampradaya5({super.key});

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
                      'assets/images/sp5.jpg',
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
                    localizations?.smarthism ?? 'Smarthism',
                    style: const TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    localizations?.smarth_info ??'The Smarta tradition (Sanskrit: स्मार्त), also called Smartism, is a movement in Hinduism that developed and expanded with the Puranas genre of literature. It reflects a synthesis of four philosophical strands, namely Uttara Mīmāṃsā, Advaita, Yoga, and theism. The Smarta tradition rejects theistic sectarianism, and is notable for the domestic worship of five shrines with five deities, all treated as equal – Ganesha, Shiva, Shakti, Vishnu and Surya. The Smarta tradition contrasted with the older Shrauta tradition, which was based on elaborate rituals and rites. There has been a considerable overlap in the ideas and practices of the Smarta tradition with other significant historic movements within Hinduism, namely Shaivism, Brahmanism, Vaishnavism, and Shaktism.',
                    style: TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 25),
                   Text(
                     localizations?.smarth_head ??'Part of a series of Smarthism',
                    style: TextStyle(
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
                    localizations?.smarth_1 ??'The smriti texts of the period between 200 BCE and 100 CE proclaim the authority of the Vedas, and "nonrejection of the Vedas comes to be one of the most important touchstones for defining Hinduism over and against the heterodoxies, which rejected the Vedas." The Smriti texts interpret the Vedas in a number of ways, which gave rise to six darsanas (orthodox schools) of Hindu philosophy.',
                    imagePath: 'assets/images/testimonial1.jpg',
                  ),
                  _buildCard(
                    title: localizations?.sampradayas_2??'Beliefs and practices',
                    subtitle:
                    localizations?.smarth_2 ??'The Smartas evolved a kind of worship which is known as Panchayatana puja. In this Puja, one or more of the five Hindu Deities (Surya, Shiva, Vishnu, Ganesha and Adi Shakti) are the objects of veneration. The five symbols of the major Gods are placed on a round open metal dish called Panchayatana, the symbol of the deity preferred by the worshiper being in the center.',
                    imagePath: 'assets/images/testimonial2.jpg',
                  ),
                  _buildCard(
                    title: localizations?.sampradayas_3??'Traditions',
                    subtitle:
                    localizations?.smarth_3 ??'Smarta tradition emerged initially as a synthesis movement to unify Hinduism into a nonsectarian form based on the Vedic heritage. It accepted varnasrama-dharma, states Bruce Sullivan, which reflected an acceptance of Varna (caste/class) and ashrama (four stages of human life) as a form of social and religious duty. In the later second half of the 1st millennium, Adi Shankara reformed and brought ideas to the movement in the form of the Advaita Vedanta philosophy.',
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

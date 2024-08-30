import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Sampradaya4 extends StatelessWidget {
  const Sampradaya4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                // Add New Widgets here
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Ganpatya',
                    style: TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Ganpatya is one of the major Hindu traditions, which worships Shiva as the Supreme Being. One of the largest Hindu denominations, it incorporates many sub-traditions ranging from devotional dualistic theism such as Shaiva Siddhanta to yoga-orientated monistic non-theism such as Kashmiri Shaivism.\nIt considers both the Vedas and the Agama texts as important sources of theology. According to a 2010 estimate by Johnson and Grim, Shaivism is the second-largest Hindu sect, constituting about 252 million or 26.6% of Hindus.',
                    style: TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Text(
                    'Part of a series of Ganpatya',
                    style: TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildCard(
                    title: 'Origins and history',
                    subtitle:
                    'The origins of Ganpatya are unclear and a matter of debate among scholars, as it is an amalgam of pre-Vedic cults and traditions and Vedic culture',
                    imagePath: 'assets/images/testimonial1.jpg',
                  ),
                  _buildCard(
                    title: 'Beliefs and practices',
                    subtitle:
                    'Ganpatya, organized worship of the Indian god Shiva and, with Vaishnavism and Shaktism, one of the three principal forms of modern Hinduism. Shaivism includes such diverse movements as the highly philosophical Shaiva-siddhanta, the socially distinctive Lingayat, ascetics such as the dashnami sannyasin s, and innumerable folk variants.',
                    imagePath: 'assets/images/testimonial2.jpg',
                  ),
                  _buildCard(
                    title: 'Traditions',
                    subtitle:
                    'Ganpatya is ancient, and over time it developed many sub-traditions. These broadly existed and are studied in three groups: theistic dualism, nontheistic monism, and those that combine features or practices of the two.',
                    imagePath: 'assets/images/testimonial2.jpg',
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
                      icon: const Icon(Icons.info, color: Colors.deepPurpleAccent),
                      label: const Text('Instagram'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.deepPurpleAccent,
                        textStyle: const TextStyle(fontFamily: 'Eczar'),
                        side: const BorderSide(color: Colors.deepPurpleAccent),
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

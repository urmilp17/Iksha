import 'package:flutter/material.dart';

class Sampradaya1 extends StatelessWidget {
  const Sampradaya1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
              child: Icon(
                Icons.keyboard_backspace,
                color: Colors.black,
                size: 28,
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
                      'assets/images/sp1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Shaivism',
              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Shaivism (/ˈʃaɪvɪzəm/; Sanskrit: शैवसम्प्रदायः, romanized: Śaivasampradāyaḥa) is one of the major Hindu traditions, which worships Shiva as the Supreme Being. One of the largest Hindu denominations, it incorporates many sub-traditions ranging from devotional dualistic theism such as Shaiva Siddhanta to yoga-orientated monistic non-theism such as Kashmiri Shaivism. It considers both the Vedas and the Agama texts as important sources of theology. According to a 2010 estimate by Johnson and Grim, Shaivism is the second-largest Hindu sect, constituting about 252 million or 26.6% of Hindus.',
              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'Part of a series of shaivism',
              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/testimonial1.jpg'),
                ),
                title: Text(
                  'Origins and history',
                  style: TextStyle(fontFamily: 'Eczar', fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'The origins of Shaivism are unclear and a matter of debate among scholars, as it is an amalgam of pre-Vedic cults and traditions and Vedic culture',
                  style: TextStyle(fontFamily: 'Eczar'),
                ),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/testimonial2.jpg'),
                ),
                title: Text(
                  'Beliefs and practices',
                  style: TextStyle(fontFamily: 'Eczar', fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Shaivism, organized worship of the Indian god Shiva and, with Vaishnavism and Shaktism, one of the three principal forms of modern Hinduism. Shaivism includes such diverse movements as the highly philosophical Shaiva-siddhanta, the socially distinctive Lingayat, ascetics such as the dashnami sannyasin s, and innumerable folk variants.',
                  style: TextStyle(fontFamily: 'Eczar'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Follow Us',
              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook, color: Color(0xFF3b5998)),
                  onPressed: () {
                    // Action for Facebook
                  },
                ),

                IconButton(
                  icon: const Icon(Icons.camera_alt, color: Color(0xFFC13584)), // using camera_alt for Instagram
                  onPressed: () {
                    // Action for Instagram
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.business, color: Color(0xFF0077B5)), // using business for LinkedIn
                  onPressed: () {
                    // Action for LinkedIn
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Action for joining the community
                  },
                  icon: const Icon(Icons.group_add),
                  label: const Text('Know More'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontFamily: 'Eczar'),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    // Action for learning more
                  },
                  icon: const Icon(Icons.info),
                  label: const Text('Instagram'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepOrange,
                    textStyle: const TextStyle(fontFamily: 'Eczar'),
                    side: const BorderSide(color: Colors.deepOrange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

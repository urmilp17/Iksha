import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsPage extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'History of Vaisnavism',
      author: 'Research Paper',
      image: 'assets/images/book17.jpg', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/1uftD6RdGaSRSWaH0HVQbTxrGIkO_nf7X/view?usp=sharing',
      pages: 17,
      description:
          'The "History of Vaishnavism" explores the origins, evolution, and influence of Vaishnavism, a major Hindu tradition centered on the worship of Lord Vishnu and his avatars. It highlights the contributions of saints, scriptures, and devotional movements that shaped its theology, rituals, and cultural significance.',
    ),
    Book(
      title: 'Introduction to Smartha Tradition',
      author: 'Research Paper',
      image: 'assets/images/book2.jpg', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/uc?export=download&id=185uAUxDAmvBPMeQrX3XPDFFtRELv4Oyq',
      pages: 10,
      description:
          'A brilliant examination of everyday objects, uncovering why some designs work while others fail. '
          'Don Norman explains how intuitive design impacts our daily lives and what we can learn from it.',
    ),
    //////////////////////////////////////adding new books
    Book(
      title: 'VivekaChudamani of Sri-Shankaracharya',
      author: 'Hemchandra Raychaudhuri',
      image: 'assets/images/book3.png', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/1f7-iTgw_fnhjYIWrsBOGInBfIsiMzGap/view?usp=sharing',
      pages: 269,
      description:
          'Vivekachudamani is a renowned Advaita Vedanta text written by Adi Shankaracharya. Comprising 580 verses, it guides seekers on the path to Self-realization, discernment (viveka), detachment (vairagya), and liberation (moksha), offering profound insights into the nature of reality and the ultimate goal of human existence.',
    ),
    //4th book
    Book(
      title: 'VEDANTA FOR BEGINNERS',
      author: 'SRI SWAMI SIVANANDA',
      image: 'assets/images/book4.png', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/1I677Xav5_Qpt9R8V_-i8xBbBPuBNaDzk/view?usp=sharing',
      pages: 73,
      description:
          'This book delves into the history of Vaishnavism, exploring its origins, development, and core philosophies. It provides a comprehensive look at the traditions spiritual and cultural significance.',
    ),
    //5th book
    Book(
      title: 'Understanding Advaita Vedanta',
      author: 'S. Sundaram',
      image: 'assets/images/book5.png', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/1bBmao1-kPeG4OXZWWyOE1g-9yqAl_PeA/view?usp=sharing',
      pages: 635,
      description:
          'Understanding Advaita Vedanta"* delves into the core principles of Advaita Vedanta, emphasizing the non-dualistic nature of reality and the unity of self and Brahman. It provides an insightful exploration of its philosophical tenets, bridging ancient wisdom with contemporary understanding.',
    ),
    //6th book
    Book(
      title: 'Tattvabodha',
      author: 'Swami Paramarthananda',
      image: 'assets/images/book6.png', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/1mvHs37ktB0ElYDeGjOTRWVOa5TyeXDQx/view?usp=sharing',
      pages: 113,
      description:
          'SwParam_IntroVedanta-Tattvabodha" serves as an introductory guide to Vedanta philosophy through the lens of Tattvabodha, a foundational text attributed to Adi Shankaracharya. It simplifies complex concepts like the nature of self, the universe, and liberation, making them accessible to students and seekers of Vedantic wisdom.',
    ),
    //7th book
    Book(
      title: 'Råmacaritamånasa',
      author: 'Goswami Tulsidas',
      image: 'assets/images/book7.png', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/1NZKlcJ2Mo8ReUtGXtSUYgl1sP2tDrmNM/view?usp=sharing',
      pages: 1119,
      description:
          'Rāmacaritamānasa is a devotional epic that narrates the life and virtues of Lord Rama, blending spiritual wisdom and poetic beauty. Written in Awadhi, it is a cornerstone of Bhakti literature and a guide to living a righteous life.',
    ),
    //8th book
    Book(
      title: 'Sankara and Modern Physics',
      author: 'N. Subramanian',
      image: 'assets/images/book8.png', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/1j9JqM9_MLLbgXOtj_ekWzo5YXPm1PpqX/view?usp=sharing',
      pages: 44,
      description:
          'Sankara and Modern Physics bridges the timeless philosophies of Adi Shankaracharya with contemporary principles of modern physics. It explores parallels between Advaita Vedantas concept of non-duality and quantum mechanics, offering a unique perspective on the nature of reality.',
    ),
    //9th book
    Book(
      title: 'Panchadasi',
      author: 'Swami Vidyaranya',
      image: 'assets/images/book9.png', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/15eMx8TcDRGMiA6dMsOqDb_qUfbGnLGRw/view?usp=sharing',
      pages: 726,
      description:
          'Panchadasi is a seminal text of Advaita Vedanta, presenting its core philosophical teachings across fifteen chapters. It offers a detailed exposition of the nature of ultimate reality, self-realization, and the path to liberation, blending logic and devotion.',
    ),
    //10th book
    Book(
      title: 'HOLY GEETA',
      author: 'Swami Chinmayananda',
      image: 'assets/images/book10.png', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/14pzIcu5IcZRlKoDOClOPXGQ_9gvoT4ao/view?usp=sharing',
      pages: 1538,
      description:
          'The Holy Geeta is a comprehensive commentary on the Bhagavad Gita, providing profound insights into its philosophical, spiritual, and practical teachings. Swami Chinmayananda elucidates the timeless wisdom of the Gita, making it accessible for modern seekers striving for self-realization and harmony.',
    ),
    //11th book
    Book(
      title: 'Hindu and Buddhist Ideas in Dialogue',
      author: 'R. C. Zaehner',
      image: 'assets/images/book11.png', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/1I9_aaJVVh0iR2dYGuQC4Zyskr0bA7HsS/view?usp=sharing',
      pages: 237,
      description:
          'In Hindu and Buddhist Ideas in Dialogue, Zaehner explores the philosophical and theological intersections between Hinduism and Buddhism. He delves into the similarities and differences in their views on concepts such as the self, liberation, and the nature of reality, offering a comparative analysis of these two major spiritual traditions.',
    ),
    //12th book
    Book(
      title: 'THE CHHANDOGYA UPANISHAD',
      author: 'S. Radhakrishnan',
      image: 'assets/images/book12.png', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/1GTiwy2HdG40wt3tOhTZL1TI1KG7AU3Sh/view?usp=sharing',
      pages: 388,
      description:
          'The Chhandogya Upanishad is one of the principal Upanishads, focusing on the nature of the self, the ultimate reality (Brahman), and the relationship between the two. It is known for its teachings on meditation, sound, and the famous phrase "Tat Tvam Asi" ("Thou art that").',
    ),
    //13th book
    Book(
      title: 'Śri Śaṅkara Bhagavatpāda Vṛttānta Sāra Sarvasva',
      author: 'Śri Śaṅkara Bhagavatpāda',
      image: 'assets/images/book13.png', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/19TgxPduhGz2vBuSmBv9KAhjcH_qiFGz6/view?usp=sharing',
      pages: 614,
      description:
          'Śri Śaṅkara Bhagavatpāda Vṛttānta Sāra Sarvasva is a profound philosophical work by Adi Śaṅkara, a prominent philosopher and theologian in the Advaita Vedanta tradition. This text summarizes and elucidates the essence of Advaita Vedanta, focusing on the non-duality of the self (Atman) and ultimate reality (Brahman), aiming to guide individuals toward realizing the oneness of all existence.',
    ),
    //14th book
    Book(
      title: 'AN ANALYSIS OF THE BRAHMA SUTRA',
      author: 'S. Radhakrishnan',
      image: 'assets/images/book18.jpeg', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/1GWHCSUfgskaQrL1cQegydCTQ9sMaoZ-x/view?usp=sharing',
      pages: 97,
      description:
          'An Analysis of the Brahma Sutra by S. Radhakrishnan is a scholarly interpretation of the Brahma Sutras, which are a fundamental text of Vedanta philosophy. The work delves into the philosophical underpinnings of the sutras, offering insights into the nature of the supreme reality (Brahman), the relationship between the individual self (Atman) and Brahman, and the paths to spiritual liberation (moksha).',
    ),
    //15th book
    Book(
      title: 'Against a Hindu God'
          'buddhist philosophy of religion in india',
      author: 'Parimal G. Patil',
      image: 'assets/images/book15.png', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/1ZAwFD3tH3R1iJb6SUyCSb3COYyT80Ph_/view?usp=sharing',
      pages: 421,
      description:
          'Buddhist philosophy in India critiques Hindu gods by emphasizing non-theism and rejecting the notion of an eternal, unchanging self (Atman). It teaches that liberation is achieved through personal effort, wisdom, and meditation, rather than through the worship of gods or reliance on rituals.',
    ),
    //16th book
    Book(
      title: 'Advaita Buddhism Hindu Studies',
      author: 'Richard King',
      image: 'assets/images/book19.jpeg', // Replace with your image asset
      driveUrl:
          'https://drive.google.com/file/d/1lGeUfzpZ6yxTaVy92obJ3I9aUBDxli51/view?usp=sharing',
      pages: 18,
      description:
          'Advaita Buddhism Hindu Studies explores the intersection of Advaita Vedanta, Buddhism, and Hinduism, examining their shared roots and differing views on concepts like the self, liberation, and ultimate reality. The study offers comparative insights into non-duality, the nature of existence, and the paths to spiritual awakening across these philosophical traditions.',
    ),
  ];

  BookDetailsPage({super.key});

  Future<void> _launchDriveFolder(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          'Books',
          style: TextStyle(color: Colors.black, fontFamily: "LibreBaskerville"),
        ),
        centerTitle: true,
      ),
      body: RawScrollbar(
        thumbColor: iconcolor,
        thumbVisibility: true,
        radius: const Radius.circular(10.0),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            book.image,
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Eczar",
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'by ${book.author}',
                                style: const TextStyle(
                                    color: Colors.grey, fontFamily: "Eczar"),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                '${book.pages} pages',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Eczar",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: iconcolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () => _launchDriveFolder(book.driveUrl),
                          child: const Text(
                            'READ NOW',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Eczar",
                                color: Colors.white),
                          ),
                        ),
                        // IconButton(
                        //   icon: const Icon(Icons.favorite_border),
                        //   color: Colors.pink,
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      book.description,
                      style: const TextStyle(fontSize: 14.0, fontFamily: "Eczar"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String image;
  final String driveUrl;
  final int pages;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.image,
    required this.driveUrl,
    required this.pages,
    required this.description,
  });
}

void main() {
  runApp(MaterialApp(
    home: BookDetailsPage(),
  ));
}

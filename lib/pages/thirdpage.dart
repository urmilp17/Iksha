import 'package:flutter/material.dart';
import 'dart:math';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List<Map<String, String>> articles = [
    {
      'imagePath': 'assets/images/article1.jpg',
      'title': 'Origin of Ganesha',
      'content': "Like all gods in the Hindu pantheon, Ganesh has a mythological origin. He is the son of Shiva and his consort Parvati, both of human form and yet he bears the head of an elephant. The reason for this closely follows his birth or more appropriately his creation. He was not born to Parvati as mere mortal are. It is said that she was lonely. Shiva was away as was often the case. In her loneliness it appears she was given to neglect personal hygiene, or maybe it was an act of pure desperation and determination. She decided to create a child and did this by forming him, Ganesh, through moulding a substantial accumulation of her body dirt. And so Ganesh was born and Parvati was happy and occupied.The story goes that one day, while Parvati was having a bath, Shiva came home. When he attempted to enter the house though, he was met with resistance in the form of the boy Ganesh. Neither of them knew they were related.  Shiva got angry at not being allowed in and dealt with the situation by chopping off Ganesh’s head. It was at this moment that Parvati came out to find what Shiva had done. She was inconsolable but managed to tell Shiva that the boy whose head he had cut off was in fact his son. Angry and upset at the hash he had made of the situation, Shiva decided to fix it. He went out and hunted the first animal he saw, the elephant, and brought back its head to replace the boy’s. That is how Ganesh has an elephant head. He is worshipped as the remover of obstacles.",
      'date': '9 August 2024'
    },
    {
      'imagePath': 'assets/images/article2.jpeg',
      'title': "What did Sage Narada preach to Prahlada",
      'content': "King hiranyakashyap leaves to woods to do meditation for Lord Brahma, to attain mystical powers and for immortality too.His wife Leelavathi was a devotee and a great Pativratha.One day, Lord Indra when comes to know that, Hiranyakasipa is doing rigorous penance for Brahma, starts to feel insecure of losing the title of King of Devas.So, he plans to abduct Hiranyakasipa’s wife Leelavathi.Lord Indra abducts her and will be on the way of taking her to Heaven , in his Pushpak vehicle. In the travel, he encounters sage Narada.Sage Narada warns Indra and says “ Hey indra, why have you abducted the great Pativratha Leelavathi and digging your own grave ! Don't you know that, Hiranyakasipa is almost at the end of his penance , and would return soon. He would kill you, if he comes to know that , you gave held his pregnant wife as hostage. One more important thing, the son born to Leelavathi will be a great devotee of Vishnu and through him , Hiranyakasipa would meet his end”.Hearing this , Indra says “ oh sage Narada ! What should I do now ? Please help me and take Leelavati with you to your ashram “.In this way, Sage Narada takes Leelavathi to his ashram.It is believed that, whenever a woman is pregnant, what ever she thinks , hears all can be heard by the baby in her womb. That is why , our elders always say us to remain calm , composed and think positive and eat nutritious food during pregnancy. What the mother thinks, feels, hears all eventually effect the baby in her womb.Sage Narada starts telling Puranas and tales about Lord Vishnu to Leelavathi.And after sometime, out of tiredness Leelavathi eventually sleeps.",
      'date': '26 July 2024'
    },
    {
      'imagePath': 'assets/images/article3.jpg',
      'title': 'What makes goddess Lakshmi angry?',
      'content': 'The following things make Goddess Lakshmi angry, and she (the epitome of prosperity, happiness, and potential) goes away from home:\n\n'
          '1. Insulting others.\n'
          '2. Insulting holy works, Lord Vishnu, and morals.\n'
          '3. Disrespecting the weak and people with lower status.\n'
          '4. Not keeping the house clean.\n'
          '5. Offering her hot (chilly) or bitter food.\n'
          '6. Disrespecting symbols of prosperity like Swastik, Sindoor, gold, basil, and holy pot.\n'
          '7. Having ego about existing prosperity.\n'
          '8. Not thanking her for gifts like prosperity, power, fortune, and knowledge which she gave you.\n\n'
          'Results if she gets angry:\n\n'
          '1. You will be affected by Alakshmi (the epitome of poverty, hunger, bad luck, laziness, and dirtiness).\n'
          '2. Your luck and fortune will leave you.\n'
          '3. Your prosperity, wealth, and self-confidence will be destroyed.\n'
          '4. You can never achieve success.\n'
          '5. You may have to live a poor life, lacking proper food, money, clothes, etc.',
      'date': '26 July 2024'
    },
    {
      'imagePath': 'assets/images/article4.jpg',
      'title': "What happened to Lord Rama's dead body?",
      'content': "When Lord Vishnu come to Earth, He Take Different Forms according to Situation, he never take birth he is unborn when there was nothing lord Vishnu was there alone in formless way, he appear not take birth(when prahalad called lord narsimha appeared from pillar here lord narsimha didn't took birth he appeared and after killing demon Lord Narsimha disappeared)"
          "Hari Vypak Sarvatra Samana prem te pragat hoi Mai Jana, Desh kal videshu mahi kahahu so kha jaha prabhu nahi"
          "Lord Vishnu is immortal he is present everywhere in formless way but when devotees calls the formless god with love, Lord Vishnu take form and appear same with lord Shiva and Mata Durga all are immortal One and Same, The Formless God for love take different forms and do different leelas to give devotees bliss and Joy and attract the eternal fragments(souls) home who are stuck in the 84 lakh different types of body in Material Nature thinking himself as the body not soul and trapped by Maya. The soul is formless eternal and are fragments of God and supreme bliss itself, but stuck in Maya forgotten itself, the formless God take form and attract the lost souls home"
          "he don't go in mother womb which is full of dirt, but still to do roleplay (leela)on earth and to attract the lost souls home he use his yogmaya to make people think he take birth from Mother Womb, but the truth is he is immortal and his body is eternal made of Supreme bliss itself,"
          "When Yamraj came to tell Lord Ram that every living beings are happy and Dharma is 100% again than lord Rama to end his leela go to Saryu river and take a dip inside and took the form of Narayan and Go to Vaikuntha, same with Lord Krishna🙏 and Upcoming Kalki Avatar, Marayada Purushottam bhagwan Shree Ram ki Jai",
      'date': '26 July 2024'
    },
    {
      'imagePath': 'assets/images/article5.jpg',
      'title': 'Why is Lord Shiva also called Rudradev?',
      'content': "According to Bhagavata Purana, Lord Brahma originated from Lord Narayana’s navel. Now, Lord Vishnu ordered Lord Brahma to do the task of creation. Brahma created four sons: Sanaka, Sanandana, Sanatsujaata, and Sanatkumaara. These four were the sons of Lord Brahma. Though the look of these four sons of Lord Brahma was like that of a child, they had profound and pure knowledge about the supreme Lord Vishnu. Now, Lord Brahma asked them to continue the task of creation. But, these four kumaras of Lord Brahma refused to do so and said that they didn’t want to fall in the samsara bandhana and wanted to do tapasya and please Lord Narayana.On seeing this, Lord Brahma got angry because his sons were not listening to him. His anger was uncontrollable. Suddenly, a baby emerged out of Lord Brahma’s forehead. The baby started crying aloud. It was crying so loud that the crying sound was unbearable for anyone. The baby was crying because he wanted a name. Now, Lord Brahma got even more angry and cursed the baby that he would be called Rudra. Rudra means ‘one who cries’. Because this baby cried loudly, he is called Rudra. Another meaning of Rudra is ‘one who drives away sorrows’. The etymological meaning of Rudra is ‘one who drives away evil and fear’. He is the ‘destroyer of sorrows and the one who removes",
      'date': '26 July 2024'
    },
  ];

  @override
  void initState() {
    super.initState();
    shuffleArticles();
  }

  void shuffleArticles() {
    final random = Random();
    setState(() {
      articles.shuffle(random);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          shuffleArticles();
        },
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return buildArticle(
              imagePath: articles[index]['imagePath']!,
              title: articles[index]['title']!,
              content: articles[index]['content']!,
              date: articles[index]['date']!,
            );
          },
        ),
      ),
    );
  }

  Widget buildArticle({
    required String imagePath,
    required String title,
    required String content,
    required String date,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageDetailPage(
              imagePath: imagePath,
              title: title,
              content: content,
              date: date,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200, // Set a fixed height for the image container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                content,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageDetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String content;
  final String date;

  const ImageDetailPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.content,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300, // Set a fixed height for the image container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: Articles(),
));

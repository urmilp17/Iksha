import 'package:flutter/material.dart';

class Vairagya extends StatelessWidget {
  const Vairagya({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      body: Center(
        child: Container(
          width: 350, // Adjust width based on your preference
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFFFDF5DF),            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: const Color(0xFFFDF5DF),                blurRadius: 10.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.stars_outlined, color: Colors.black, size: 30),
                      SizedBox(width: 8),
                      Text(
                        'What is Viraga?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.more_vert, color: Colors.black, size: 30),
                ],
              ),
              const SizedBox(height: 10),

              // Date
              const Text(
                '         ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),

              // Title
              const Text(
                'विरागः कः ? '
                    'इहस्वर्गभोगेषु इच्छाराहित्यम् ।',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Divider (Blue line)
              Container(
                height: 3,
                width: 60,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 10),

              // Content
              const Text(
               'What is meant by Viraga? Viraga means indifference or disinterest, absence of raaga. Raaga means longing for something, an attachment to it believing that its presence will solve the problem. Viraga is absence of such anchoring things, binders to the worldly things, with the false notion that such a thing is required to make one happy. This freedom from raaga, or attachment is directed towards what is the question. It is directed towards Kartrtva and Bhoktrtva bhavas of a person. Raaga and desires motivate one towards performing more and more Karma, generating positive and negative karmaphalas. Karmaphala (in a positive sense of punya) must be enjoyed and this leads to the concept of Bhoga. However, while everyone performs karma with an intention of procuring benefits (punya) many a times it leads to undesirable phala (papa) which must also be endured and experienced.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),

              // Footer section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Views count
                  Row(
                    children: const [
                      // Icon(Icons.remove_red_eye, color: Colors.grey, size: 20),
                      SizedBox(width: 5),
                      Text(
                        '         ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  // Social icons (likes and comments)
                  Row(
                    children: const [
                      Icon(Icons.favorite_border, color: Colors.grey, size: 20),
                      SizedBox(width: 15),
                      Icon(Icons.share, color: Colors.grey, size: 20),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Vairagya(),
    debugShowCheckedModeBanner: false,
  ));
}
=======
    return const Placeholder();
  }
}
>>>>>>> origin/master

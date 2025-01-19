import 'package:flutter/material.dart';

class Mumukshatva extends StatelessWidget {
  const Mumukshatva({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350, // Adjust width based on your preference
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFFFDF5DF),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Text(
                        'What is Mumukshatva?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                            fontFamily: 'Eczar'
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Title
              const Text(
                ' मुमुक्षुत्वं किम् ? '
                    ' मोक्षो मे भूयाद् इति इच्छा ।',
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
                'What is Mumukshatva? A (burning) desire, an intense longing to realise the Self. Achieving the sthiti of limitlessness is the true aim of all human aspirations. To aspire is to rise or reach upward; it is an earnest desire that is above one’s present reach or attainment, especially for something noble and spiritual. This earnest desire is usually accompanied by the endeavor to attain it with the result being released from the wheel of births and deaths and its concomitant evils of old age, disease, delusion, and sorrow. If one is totally equipped with the previous three previous qualifications, Viveka, Vairagya and Shat Virtues – Mumukshatvam will come by on its own accord because the mind no longer holds on to external objects. When purification of the mind and mental discipline is affected the longing for freedom from a limited nature, dawns by itself. Mumukshatvam is a value to which one becomes committed.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),

              // Footer section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Views count
                  Row(
                    children: [
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
    home: Mumukshatva(),
    debugShowCheckedModeBanner: false,
  ));
}

import 'package:flutter/material.dart';

class ShadSampati extends StatelessWidget {
  const ShadSampati({super.key});

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
                        'What is Shat-sampatti?',
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
                ' शमादिसाधनसम्पत्तिः का ? '
                    ' शमो दम उपरमस्तितिक्षा श्रद्धा समाधानं च इति ।',
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
                'Meaning: What are the Shama etc., six-fold virtues constituting the inner wealth? They are Shama, Dama, Uparama, Titiksha, Shraddha, and Samadhana.'
                    'These six virtues shape the character of a person. Having these virtues indicates the capability of a Sadhaka to endure, control the mind and senses, concentrate, and finally have unswerving faith in achieving his goal. The six attributes are taken as one unit because they pertain to the various psychological aspects involved in bringing about mental control and discipline.'
                    'After discrimination dawns on a person, he has awakened to the real purpose of his existence. It moves internally to drive the person to seek more than what he sees in the transient world. However, he has his old traits that distract him. Then comes Vairagya which prompts as an inner restraining voice at every passing appearance.',
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
                  Row(
                    children: [
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
    home: ShadSampati(),
    debugShowCheckedModeBanner: false,
  ));
}

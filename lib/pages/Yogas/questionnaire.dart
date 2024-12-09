import 'package:flutter/material.dart';

import '../../colours.dart';

class YogaQuizScreen extends StatefulWidget {
  @override
  _YogaQuizScreenState createState() => _YogaQuizScreenState();
}

class _YogaQuizScreenState extends State<YogaQuizScreen> {
  final List<String> questions = [
    "What kind of practices resonate most with you?",
    "What type of strength do you value the most?",
    "How do you define your life’s focus?",
    "What motivates your sense of duty?",
    "What does renunciation mean to you?",
    "How do you approach your relationship with others?",
    "What kind of service do you prioritize?",
    "How do you nurture spiritual growth?",
    "How do you view detachment?",
    "What inspires you in daily life?",
    "How do you overcome challenges?",
    "What is your ultimate goal in life?",
  ];

  final List<List<String>> options = [
    [
      "Spiritual practices for self-realization",
      "Practical and selfless service",
      "Devotional practices and rituals"
    ],
    ["Wisdom and knowledge", "Discipline and action", "Faith and love for God"],
    [
      "Seeking truth and understanding",
      "Fulfilling responsibilities with integrity",
      "Developing a deep connection with God"
    ],
    [
      "A sense of higher purpose",
      "Social responsibilities and helping others",
      "Expressing love and devotion"
    ],
    [
      "Letting go of ego and ignorance",
      "Renouncing the fruits of actions",
      "Surrendering to God’s will"
    ],
    [
      "Understanding others deeply",
      "Helping others selflessly",
      "Loving others unconditionally"
    ],
    [
      "Serving humanity through wisdom",
      "Serving society through actions",
      "Serving God through devotion"
    ],
    [
      "Learning and self-reflection",
      "Dedicated effort and discipline",
      "Worship and prayer"
    ],
    [
      "Detachment from desires and ignorance",
      "Detachment from rewards of actions",
      "Detachment through surrender to God"
    ],
    [
      "The pursuit of enlightenment",
      "The satisfaction of doing one’s duty",
      "The joy of being close to God"
    ],
    [
      "Facing challenges with understanding",
      "Facing challenges with resilience",
      "Facing challenges with faith"
    ],
    [
      "Achieving self-realization",
      "Making the world a better place",
      "Union with God"
    ],
  ];

  // To store user's selected answers
  List<String?> selectedAnswers = List<String?>.filled(12, null);

  void calculateYogaPath() {
    Map<String, int> pathCount = {"Jnana": 0, "Karma": 0, "Bhakti": 0};

    for (var answer in selectedAnswers) {
      if (answer != null) {
        if (options.any((q) => q.contains(answer))) {
          if (options[0][0] == answer ||
              options[1][0] == answer ||
              options[2][0] == answer) {
            pathCount["Jnana"] = pathCount["Jnana"]! + 1;
          }
          if (options[0][1] == answer ||
              options[1][1] == answer ||
              options[2][1] == answer) {
            pathCount["Karma"] = pathCount["Karma"]! + 1;
          }
          if (options[0][2] == answer ||
              options[1][2] == answer ||
              options[2][2] == answer) {
            pathCount["Bhakti"] = pathCount["Bhakti"]! + 1;
          }
        }
      }
    }

    // Determine the Yoga path with the highest count
    String recommendedPath =
        pathCount.entries.reduce((a, b) => a.value > b.value ? a : b).key;

    // Show result as a dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your Recommended Yoga Path",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Eczar')),
        content: Text("Based on your answers, your path is: $recommendedPath",
            style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Eczar')
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                // Clear all selected answers
                selectedAnswers = List<String?>.filled(12, null);
              });
              Navigator.of(context).pop();
            },
            child: const Text("OK",
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'Eczar'
            ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: const Text(
          "Yoga Path Quiz",
          style: TextStyle(fontFamily: 'LibreBaskerville'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("\nThis quiz offers an engaging and interactive way for users "
                  "to explore their recommended path of Yoga based on their preferences "
                  "and values. \n\nBy answering a series of thoughtfully crafted questions, "
                  "users receive a personalized result highlighting the Yoga path\nJnana, "
                  "Karma, or Bhakti\nthat resonates most with their choices.\n",

              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 15,
                height: 1.5
              ),),
              for (int i = 0; i < questions.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q${i + 1}. ${questions[i]}",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Eczar'),
                    ),
                    for (int j = 0; j < options[i].length; j++)
                      RadioListTile<String>(
                        title: Text(
                          options[i][j],
                          style: const TextStyle(
                              fontFamily: 'Eczar', fontSize: 15),
                        ),
                        value: options[i][j],
                        groupValue: selectedAnswers[i],
                        onChanged: (value) {
                          setState(() {
                            selectedAnswers[i] = value;
                          });
                        },
                      ),
                  ],
                ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedAnswers.contains(null)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                "Please answer all questions before submitting!")),
                      );
                    } else {
                      calculateYogaPath();
                    }
                  },

                  child: const Text("Submit"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

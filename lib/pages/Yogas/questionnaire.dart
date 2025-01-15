import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../colours.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class YogaQuizScreen extends StatefulWidget {
  const YogaQuizScreen({super.key});

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
  List<String?> previousSelections = List<String?>.filled(12, null);

  // Firestore reference
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String yogaCollection = "yogacounts";

  Future<void> updateYogaCount(String path, int delta) async {
    try {
      await _firestore.collection(yogaCollection).doc("counts").update({
        path: FieldValue.increment(delta),
      });
    } catch (e) {
      print("Error updating count: $e");
    }
  }

  void handleOptionChange(int questionIndex, String newAnswer) {
    String? previousAnswer = previousSelections[questionIndex];
    if (previousAnswer != null) {
      // Decrement the count for the previous selection
      if (options[questionIndex][0] == previousAnswer) {
        updateYogaCount("Jnana", -1);
      } else if (options[questionIndex][1] == previousAnswer) {
        updateYogaCount("Karma", -1);
      } else if (options[questionIndex][2] == previousAnswer) {
        updateYogaCount("Bhakti", -1);
      }
    }

    // Increment the count for the new selection
    if (options[questionIndex][0] == newAnswer) {
      updateYogaCount("Jnana", 1);
    } else if (options[questionIndex][1] == newAnswer) {
      updateYogaCount("Karma", 1);
    } else if (options[questionIndex][2] == newAnswer) {
      updateYogaCount("Bhakti", 1);
    }

    // Update the previousSelections and selectedAnswers
    setState(() {
      previousSelections[questionIndex] = newAnswer;
      selectedAnswers[questionIndex] = newAnswer;
    });
  }

  void calculateYogaPath() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
    await _firestore.collection(yogaCollection).doc("counts").get();

    if (!snapshot.exists || snapshot.data() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error: Counts not found in Firestore.")),
      );
      return;
    }

    Map<String, int> pathCount = {
      "Jnana": snapshot.data()!["Jnana"] ?? 0,
      "Karma": snapshot.data()!["Karma"] ?? 0,
      "Bhakti": snapshot.data()!["Bhakti"] ?? 0,
    };

    var sortedPaths = pathCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    String resultMessage;

    if (sortedPaths[0].value == sortedPaths[1].value &&
        sortedPaths[0].value != sortedPaths[2].value) {
      resultMessage =
      "You can go with either ${sortedPaths[0].key} or ${sortedPaths[1].key} Yoga.";
    } else if (sortedPaths[0].value == sortedPaths[1].value &&
        sortedPaths[1].value == sortedPaths[2].value) {
      resultMessage =
      "You are a beginner for this, just cultivate faith for the Lord and listen to the vachanas of Saints.";
    } else {
      resultMessage =
      "Based on your answers, your path is: ${sortedPaths[0].key} Yoga.";
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Your Recommended Yoga Path",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        content: Text(
          resultMessage,
          style: const TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              // Reset Firestore counts
              await _firestore
                  .collection(yogaCollection)
                  .doc("counts")
                  .set({"Jnana": 0, "Karma": 0, "Bhakti": 0});

              // Clear user's previous selections and selected answers
              setState(() {
                selectedAnswers = List<String?>.filled(12, null);
                previousSelections = List<String?>.filled(12, null);
              });

              // Close the dialog
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context).languageCode;


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
              for (int i = 0; i < questions.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q${i + 1}. ${questions[i]}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    for (int j = 0; j < options[i].length; j++)
                      RadioListTile<String>(
                        title: Text(
                          options[i][j],
                          style: const TextStyle(fontSize: 15),
                        ),
                        value: options[i][j],
                        groupValue: selectedAnswers[i],
                        onChanged: (value) {
                          if (value != null) {
                            handleOptionChange(i, value);
                          }
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

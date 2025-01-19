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
  List<String?> selectedAnswers = List<String?>.filled(12, null);
  List<String?> previousSelections = List<String?>.filled(12, null);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String yogaCollection = "yogacounts";

  List<String> getLocalizedQuestions(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return [
      localizations?.question_1 ??
          "What kind of practices resonate most with you?",
      localizations?.question_2 ??
          "What type of strength do you value the most?",
      localizations?.question_3 ?? "How do you define your life’s focus?",
      localizations?.question_4 ?? "What motivates your sense of duty?",
      localizations?.question_5 ?? "What does renunciation mean to you?",
      localizations?.question_6 ??
          "How do you approach your relationship with others?",
      localizations?.question_7 ?? "What kind of service do you prioritize?",
      localizations?.question_8 ?? "How do you nurture spiritual growth?",
      localizations?.question_9 ?? "How do you view detachment?",
      localizations?.question_10 ?? "What inspires you in daily life?",
      localizations?.question_11 ?? "How do you overcome challenges?",
      localizations?.question_12 ?? "What is your ultimate goal in life?",
    ];
  }

  List<List<String>> getLocalizedOptions(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return [
      [
        localizations?.option_1_1 ?? "Spiritual practices for self-realization",
        localizations?.option_1_2 ?? "Practical and selfless service",
        localizations?.option_1_3 ?? "Devotional practices and rituals"
      ],
      [
        localizations?.option_2_1 ?? "Wisdom and knowledge",
        localizations?.option_2_2 ?? "Discipline and action",
        localizations?.option_2_3 ?? "Faith and love for God"
      ],
      [
        localizations?.option_3_1 ?? "Seeking truth and understanding",
        localizations?.option_3_2 ??
            "Fulfilling responsibilities with integrity",
        localizations?.option_3_3 ?? "Developing a deep connection with God"
      ],
      [
        localizations?.option_4_1 ?? "A sense of higher purpose",
        localizations?.option_4_2 ??
            "Social responsibilities and helping others",
        localizations?.option_4_3 ?? "Expressing love and devotion"
      ],
      [
        localizations?.option_5_1 ?? "Letting go of ego and ignorance",
        localizations?.option_5_2 ?? "Renouncing the fruits of actions",
        localizations?.option_5_3 ?? "Surrendering to God’s will"
      ],
      [
        localizations?.option_6_1 ?? "Understanding others deeply",
        localizations?.option_6_2 ?? "Helping others selflessly",
        localizations?.option_6_3 ?? "Loving others unconditionally"
      ],
      [
        localizations?.option_7_1 ?? "Serving humanity through wisdom",
        localizations?.option_7_2 ?? "Serving society through actions",
        localizations?.option_7_3 ?? "Serving God through devotion"
      ],
      [
        localizations?.option_8_1 ?? "Learning and self-reflection",
        localizations?.option_8_2 ?? "Dedicated effort and discipline",
        localizations?.option_8_3 ?? "Worship and prayer"
      ],
      [
        localizations?.option_9_1 ?? "Detachment from desires and ignorance",
        localizations?.option_9_2 ?? "Detachment from rewards of actions",
        localizations?.option_9_3 ?? "Detachment through surrender to God"
      ],
      [
        localizations?.option_10_1 ?? "The pursuit of enlightenment",
        localizations?.option_10_2 ?? "The satisfaction of doing one’s duty",
        localizations?.option_10_3 ?? "The joy of being close to God"
      ],
      [
        localizations?.option_11_1 ?? "Facing challenges with understanding",
        localizations?.option_11_2 ?? "Facing challenges with resilience",
        localizations?.option_11_3 ?? "Facing challenges with faith"
      ],
      [
        localizations?.option_12_1 ?? "Achieving self-realization",
        localizations?.option_12_2 ?? "Making the world a better place",
        localizations?.option_12_3 ?? "Union with God"
      ],
    ];
  }

  Future<void> updateYogaCount(String path, int delta) async {
    try {
      await _firestore.collection(yogaCollection).doc("counts").update({
        path: FieldValue.increment(delta),
      });
    } catch (e) {
      print("Error updating count: $e");
    }
  }

  void calculateYogaPath() async {
    final localizations = AppLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context).languageCode;

    String getText(String locale, String defaultText, String hindiText) {
      return locale == 'hi' ? hindiText : defaultText;
    }

    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection(yogaCollection).doc("counts").get();

    if (!snapshot.exists || snapshot.data() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error: Counts not found in Firestore.")),
      );
      return;
    }

    Map<String, int> pathCount = {
      localizations?.jnana_title ?? "Jnana": snapshot.data()!["Jnana"] ?? 0,
      localizations?.karmaYoga_title ?? "Karma": snapshot.data()!["Karma"] ?? 0,
      localizations?.bhaktiYoga_title ?? "Bhakti":
          snapshot.data()!["Bhakti"] ?? 0,
    };

    var sortedPaths = pathCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    String resultMessage;

    if (sortedPaths[0].value == sortedPaths[1].value &&
        sortedPaths[0].value != sortedPaths[2].value) {
      resultMessage = getText(
          currentLocale,
          "You can go with either ${sortedPaths[0].key} or ${sortedPaths[1].key} Yoga.",
          "आप ${sortedPaths[0].key} या ${sortedPaths[1].key} योग के साथ जा सकते हैं।");
    } else if (sortedPaths[0].value == sortedPaths[1].value &&
        sortedPaths[1].value == sortedPaths[2].value) {
      resultMessage = getText(
          currentLocale,
          "You are a beginner for this, just cultivate faith for the Lord and listen to the vachanas of Saints.",
          "आप इसके लिए एक प्रारंभिक साधक हैं, बस भगवान के प्रति श्रद्धा उत्पन्न करें और संतों के उपदेशों को सुनें।");
    } else {
      resultMessage = getText(
          currentLocale,
          "Based on your answers, your path is: \n${sortedPaths[0].key} Yoga.",
          "आपके उत्तरों के आधार पर, आपका मार्ग है: \n${sortedPaths[0].key} योग।");
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          getText(currentLocale, "Your Recommended Yoga Path",
              "आपका अनुशंसित योग मार्ग"),
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "Eczar"),
        ),
        content: Text(
          resultMessage,
          style: const TextStyle(fontSize: 15, fontFamily: "Eczar"),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await _firestore
                  .collection(yogaCollection)
                  .doc("counts")
                  .set({"Jnana": 0, "Karma": 0, "Bhakti": 0});

              setState(() {
                selectedAnswers = List<String?>.filled(12, null);
                previousSelections = List<String?>.filled(12, null);
              });

              Navigator.of(context).pop();
            },
            child: Text(
              getText(currentLocale, "OK", "ठीक है"),
              style: const TextStyle(
                  fontFamily: "Eczar", fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context).languageCode;


    String getText(String locale, String defaultText, String hindiText) {
      return locale == 'hi' ? hindiText : defaultText;
    }

    final questions = getLocalizedQuestions(context);
    final options = getLocalizedOptions(context);

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () async {
            await _firestore
                .collection(yogaCollection)
                .doc("counts")
                .set({"Jnana": 0, "Karma": 0, "Bhakti": 0});

            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          localizations?.yoga_quiz_title ??"Yoga Path Quiz",
          style: const TextStyle(fontFamily: 'Eczar'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizations?.yoga_quiz_desc ??"\nThis quiz offers an engaging and interactive way for users "
                    "to explore their recommended path of Yoga based on their preferences "
                    "and values. \n\nBy answering a series of thoughtfully crafted questions, "
                    "users receive a personalized result highlighting the Yoga path\nJnana, "
                    "Karma, or Bhakti\nthat resonates most with their choices.\n",
                style: TextStyle(fontFamily: 'Eczar', fontSize: 15, height: 1.5),
              ),
              for (int i = 0; i < questions.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q${i + 1}. ${questions[i]}",

                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Eczar",
                      height: 1.5),
                    ),
                    for (int j = 0; j < options[i].length; j++)
                      RadioListTile<String>(
                        title: Text(
                          options[i][j],
                          style: const TextStyle(
                              fontSize: 15, fontFamily: "Eczar"),
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
                  child: Text(
                    getText(currentLocale, "Submit", "उत्तर जमा करें"),
                    style: const TextStyle(fontFamily: "Eczar"),
                  ),
                ),
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutYoga extends StatefulWidget {
  const AboutYoga({super.key});

  @override
  State<AboutYoga> createState() => _AboutYogaState();
}

class _AboutYogaState extends State<AboutYoga> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'What is Yoga ?',
        style: TextStyle(
            fontFamily: 'Eczar',
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),
      ),
      content: Container(
        height: 240,
        child: const RawScrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,

            child: Text(
              'Keeping all the goals and especially the spiritual goal of Moksha in mind the scriptures prescribe a course of discipline which we generally call Sādhanā. Sādhanā means a course of discipline that we undertake to accomplish a goal – the goal is called Sādhyam.'
                  '\n\nTo accomplish the Sādhyam, the goal, we take to a course of discipline called Sādhanā and when we take to this discipline we are called Sādhaka. Therefore the scriptures want us to become Sādhakas taking to Sādhanā for accomplishing the Sādhyam.'
                  '\n\nAnd once we accomplish the Sādhyam, we will be become Siddhāhā. So, Sādhaka through Sādhanā should attain Sādhyam and thus become Siddha. Sādhaka to Siddha is the journey of life. Siddha is not related to miraculous powers. Siddha is one who is totally at home with himself. '
                  '\n\nAnd this entire course of Sādhanā is broadly classified or divided into three levels or segments for the convenience of understanding and practice. Each level being called a Yogaha.'
                  '\n\nThe very word Yoga meant that which links the Sādhaka and the Sādhyam – the seeker and the sought. Yoga is derived from the root Yuj – to combine or unite. Unite the Sādhaka and Sādhyam.'
                  '\n\nयुज्यते साध्येन सह '
                  '\nसाधकः येन सह साधना',
              style: TextStyle(
                  fontFamily: 'Eczar',
                  fontSize: 14,

              ),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

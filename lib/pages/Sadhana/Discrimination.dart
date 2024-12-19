import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';

class Viveka extends StatelessWidget {
  const Viveka({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          width: 350, // Adjust width based on your preference
          padding: const EdgeInsets.fromLTRB(18, 25, 18, 0),
          decoration: BoxDecoration(
            color: const Color(0xFFFDF5DF),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFFDF5DF),
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
                      //SizedBox(width: 8),
                      Text(
                        'What is Viveka ?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Eczar'
                        ),
                      ),
                    ],
                  ),
                ],
              ),
               const SizedBox(height: 3),

              // Date
              // const Text(
              //   '         ',
              //   style: TextStyle(
              //     color: const Color(0x3E5A5DFF),
              //     fontSize: 16,
              //   ),
              // ),

              // Title
              const Text(
                "{ZË`m{ZË`dñVw{ddoH\$… H\$…? {ZË`dñËdoH\$§ ~«÷ \nVÛ²`{V{aº\$§ gd©_{ZË`_² &",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'DevaHead'
                ),
              ),
              const SizedBox(height: 10),

              // Divider (Blue line)
              Container(
                height: 3,
                width: 60,
                color: iconcolor,
              ),
              const SizedBox(height: 10),

              // Content
              const SizedBox(
                height: 500,
                child: RawScrollbar(
                  child: SingleChildScrollView(
                    child: Text(
                      'What is meant by Nitya-anitya-vastu-viveka? Nitya vastu, is eternal, an infinite vastu; everything else is ephemeral (timebound), so anitya is something that is temporary, empirical, and finite. What is nitya is a real entity, rest of everything else is all temporal.'
                          '\n\nLater, in Tattvabodha, the nitya vastu is proved to be the Atman or Brahman. This discrimination is important for the reductional analysis where everything is discussed and resolved as \nSatyam or Mithya.'
                          '\n\nFor example, a pot is mithya because anything which undergoes changes is said to be mithya. Here the clay which is the material cause of the pot does not undergo any change and always remains clay in all forms of clay pots. '
                          '\n\nSo, at this level, clay is satyam. When clay is further analysed, the chemical composition of clay, and further the atoms are satyam and everything else is mithya, at this microscopic level.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Eczar'
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Footer section
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     // Views count
              //     Row(
              //       children: [
              //        // Icon(Icons.remove_red_eye, color: Colors.grey, size: 20),
              //         SizedBox(width: 5),
              //         Text(
              //           '         ',
              //           style: TextStyle(
              //             color: Colors.grey,
              //             fontSize: 14,
              //           ),
              //         ),
              //       ],
              //     ),
              //     // Social icons (likes and comments)
              //     Row(
              //       children: [
              //         Icon(Icons.favorite_border, color: Colors.grey, size: 20),
              //         SizedBox(width: 15),
              //         Icon(Icons.share, color: Colors.grey, size: 20),
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Viveka(),
    debugShowCheckedModeBanner: false,
  ));
}



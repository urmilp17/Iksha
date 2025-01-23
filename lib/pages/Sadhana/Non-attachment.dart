import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iksha/colours.dart';
class Vairagya extends StatelessWidget {
  const Vairagya({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        localizations?.what_is_vairagya ??'What is Vairagya?',
                        style: const TextStyle(
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
              const SizedBox(height: 3),
              const Text(
                'd¡am½`_² [H\$_² ? \nBhñdJ©^moJofw BÀNmam[hË`_² &',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: "DevaHead"
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 3,
                width: 60,
                color: iconcolor,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 500,
                child: RawScrollbar(
                  thumbColor: iconcolor,
                  thumbVisibility: true,
                  radius: const Radius.circular(10.0),
                  child: SingleChildScrollView(
                    child: Text(
                      localizations?.vairagya_info??'What is meant by Vairagya? Vairagya means indifference or disinterest, absence of raaga. Raaga means longing for something, an attachment to it believing that its presence will solve the problem. Vairagya is the absence of such attachment to worldly things, with the false notion that such a thing is required to make one happy. This freedom from raaga, or attachment, is directed towards Kartrtva and Bhoktrtva bhavas of a person. Raaga and desires motivate one towards performing more and more Karma, generating positive and negative karmaphalas. Karmaphala (in a positive sense of punya) must be enjoyed and this leads to the concept of Bhoga. However, while everyone performs karma with an intention of procuring benefits (punya), many times it leads to undesirable phala (papa) which must also be endured and experienced.',
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Eczar",
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              // Footer section
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

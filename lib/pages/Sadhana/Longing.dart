import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iksha/colours.dart';
class Mumukshatva extends StatelessWidget {
  const Mumukshatva({super.key});

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
                        localizations?.what_is_mumuk ??'What is Mumukshatva?',
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
              const SizedBox(height: 3),

              const Text(
                '_w_wjwËd§ [H\$_² ?\n_mojmo _o ^y`mX² B[V BÀNm &',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: "DevaHead"
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
              SizedBox(
                height: 500,
                child: RawScrollbar(
                  thumbColor: iconcolor,
                  thumbVisibility: true,
                  radius: const Radius.circular(10.0),
                  child: SingleChildScrollView(
                    child:  Text(
                      localizations?.mumuk_info ??'What is Mumukshatva? A (burning) desire, an intense longing to realise the Self. Achieving the sthiti of limitlessness is the true aim of all human aspirations. To aspire is to rise or reach upward; it is an earnest desire that is above one’s present reach or attainment, especially for something noble and spiritual. This earnest desire is usually accompanied by the endeavor to attain it with the result being released from the wheel of births and deaths and its concomitant evils of old age, disease, delusion, and sorrow. If one is totally equipped with the previous three previous qualifications, Viveka, Vairagya and Shat Virtues – Mumukshatvam will come by on its own accord because the mind no longer holds on to external objects. When purification of the mind and mental discipline is affected the longing for freedom from a limited nature, dawns by itself. Mumukshatvam is a value to which one becomes committed.',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Eczar"
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';

class Ginfo extends StatefulWidget {
  const Ginfo({super.key});

  @override
  State<Ginfo> createState() => _GinfoState();
}

class _GinfoState extends State<Ginfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          "गर्भसंस्कार",
          style: TextStyle(fontFamily: "Yatra", fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 12, 8),
              child: Row(
                children: <Widget>[
                  const Expanded(
                    flex: 1,
                    child: Text(
                      "The term Garbhsanskar is often heard these days, "
                      "but most people only have a superficial understanding of it. "
                      "\nLiterally, it means the sanskars (values or influences) "
                      "imparted to the fetus in the womb. However, what kind of "
                      "sanskars can be imparted to the fetus, and how? What is their significance, "
                      "and why are they necessary? It's essential to understand these aspects.",
                      style: TextStyle(fontFamily: "Eczar", fontSize: 15),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 270,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/iksha-324658.firebasestorage.app/o/Other%2Fpreg.png?alt=media&token=1805a3a8-c673-4c44-952a-7e465c9899e1"))),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.maxFinite,
                height: 32,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Text(
                    "Ritualistic Perspective",
                    style: TextStyle(
                        fontFamily: "Eczar",
                        color: iconcolor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                "\"Pumān sūyate yasmāt iti puṁsavanam\"",
                style: TextStyle(
                    fontFamily: "Eczar",
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Text(
              "The process through which a \"pumān\" (a valiant and \nvirtuous progeny) is born is called Puṁsavana.",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Eczar", fontSize: 12),
            ),
            const ToggleInfoWidget(
                text:
                    "In practice and Ayurveda, this samskāra is described as a ritual for achieving the desired gender of the child. "
                    "It is performed to determine whether the unborn child should be male or female. However, the Vedas suggest that "
                    "this samskāra should be performed for everyone with the intention of obtaining a virtuous and radiant child. "
                    "\nHence, it is advised that this ritual be performed in the second, fourth, sixth, or eighth month of pregnancy."
                    "\n\nAccording to Ayurveda, the gender of the fetus is determined two months after conception. "
                    "This means that within one or one and a half months after the cessation of menstruation, "
                    "it can be inferred whether the fetus will be male or female. It is believed that prior to this stage, "
                    "the gender of the fetus can be influenced or altered. However, if the ritual were solely for altering the gender, "
                    "there would be no recommendation to perform Puṁsavana in the fourth, sixth, or eighth month."),
            const Center(
              child: Text(
                "\"Avyaktaḥ prathame māsi saptāhāt kalalī bhavet।\n Garbhaḥ puṁsavānānyaya pūrva vyakte prayojayet॥\"",
                style: TextStyle(
                    fontFamily: "Eczar",
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                "In the first month, the fetus remains undifferentiated in terms of gender. In the second month, the differentiation starts becoming apparent. Hence, the Puṁsavana samskāra should ideally be performed before the gender of the fetus becomes evident",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Eczar", fontSize: 12),
              ),
            ),
            const ToggleInfoWidget(
                text:
                    "The ancient sciences revealed that the gender of the fetus could be influenced, making this knowledge accessible to all.In today's society, the ratio of males to females has become imbalanced. The number of females is decreasing rapidly, creating a serious concern for the future.In ancient times, the number of females was greater than males. Boys were given more importance, partly because males frequently lost their lives in wars or during long journeys. However, in the current scenario, there is no necessity to perform Puṁsavana purely for ensuring a male child.That said, Puṁsavana is not limited to altering gender; it has greater benefits, such as ensuring the radiance, virtues, and well-being of the fetus. It also helps prevent genetic defects (genetic disorders) and protects the fetus.")
          ],
        ),
      ),
    );
  }
}

class ToggleInfoWidget extends StatefulWidget {
  final String text;

  const ToggleInfoWidget({super.key, required this.text});

  @override
  _ToggleInfoWidgetState createState() => _ToggleInfoWidgetState();
}

class _ToggleInfoWidgetState extends State<ToggleInfoWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Eczar",
                  fontSize: 13,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// child: Text(
// widget.text,
// textAlign: TextAlign.center,
// style: const TextStyle(
// fontFamily: "Eczar",
// fontSize: 13,
// ),
// ),

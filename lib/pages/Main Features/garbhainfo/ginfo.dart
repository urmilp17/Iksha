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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 34,
          ),
          const Center(
            child: Text(
              "गर्भसंस्कार",
              style: TextStyle(fontFamily: "Yatra", fontSize: 30),
            ),
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
              )),
            ),
          )
        ],
      ),
    );
  }
}

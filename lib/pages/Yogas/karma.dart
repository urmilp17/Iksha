import 'package:flutter/material.dart';

class KarmaYog extends StatefulWidget {
  const KarmaYog({super.key});

  @override
  State<KarmaYog> createState() => _KarmaYogState();
}

class _KarmaYogState extends State<KarmaYog> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Karma"),
      ),
    );
  }
}

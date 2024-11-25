import 'package:flutter/material.dart';

class BhaktiYog extends StatefulWidget {
  const BhaktiYog({super.key});

  @override
  State<BhaktiYog> createState() => _BhaktiYogState();
}

class _BhaktiYogState extends State<BhaktiYog> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Bhakti"),
      ),
    );
  }
}
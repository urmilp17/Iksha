import 'package:flutter/material.dart';

class DnyanYog extends StatefulWidget {
  const DnyanYog({super.key});

  @override
  State<DnyanYog> createState() => _DnyanYogState();
}

class _DnyanYogState extends State<DnyanYog> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Dnyan"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:io'; // For exiting the app

class NoConnectionPageHi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off, // No connection icon
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            const Text(
              'वाईफ़ाई या मोबाइल डेटा नहीं है',
              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'कृपया अपना कनेक्शन जाँचें और पुनः प्रयास करें।',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => exit(0),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ), // Exits the app
              child: const Text(
                'एप्लिकेशन बंद करें',
                style: TextStyle(fontFamily: 'Eczar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

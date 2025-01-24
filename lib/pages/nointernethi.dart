import 'package:flutter/material.dart';
import 'package:open_settings_plus/open_settings_plus.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ), // Exits the app
                  child: const Text(
                    'बैकं',
                    style: TextStyle(fontFamily: 'Eczar'),
                  ),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    final settings = OpenSettingsPlus.shared;
                    if (settings is OpenSettingsPlusAndroid) {
                      settings.wifi();
                    } else if (settings is OpenSettingsPlusIOS) {
                      settings.wifi();
                    } else {
                      throw Exception('Platform not supported');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ), // Exits the app
                  child: const Text(
                    'सेटिंग्स',
                    style: TextStyle(fontFamily: 'Eczar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

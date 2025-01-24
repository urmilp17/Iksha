import 'package:open_settings_plus/open_settings_plus.dart';
import 'package:flutter/material.dart';


class NoConnectionPage extends StatelessWidget {
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
              'No Wifi or Cellular Data',
              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please check your connection and try again.',
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
                    'Go Back',
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
                    'Settings',
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
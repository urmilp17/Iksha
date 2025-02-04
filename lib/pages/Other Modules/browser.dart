import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart'; // Ensure this import is correct
import 'package:iksha/internet_service.dart';
import 'package:iksha/pages/Other%20Modules/bookpdf.dart';
import 'package:iksha/pages/Other%20Modules/videofile.dart';
import 'package:open_settings_plus/open_settings_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrowserWindow extends StatefulWidget {
  final String url;
  final String page;
  const BrowserWindow({super.key, required this.url,required this.page});

  @override
  _BrowserWindowState createState() => _BrowserWindowState();
}

class _BrowserWindowState extends State<BrowserWindow> {
  InAppWebViewController? _webViewController;

  @override
  void dispose() {
    InAppWebViewController.clearAllCache(); // Clear cache to free memory
    _webViewController = null; // Ensure it's null before disposal
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isConnectedToInternet =
        Provider.of<InternetConnectionService>(context).isConnectedToInternet;


    return isConnectedToInternet
        ? Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            if (_webViewController != null) {
              _webViewController!.stopLoading(); // Stop ongoing loads
            }
            if(widget.page == 'book'){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => BookDetailsPage()),
                    (route) => false,
              );
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => VideoPage()),
                    (route) => false,
              );
            }
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(widget.url)),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
        onLoadStart: (controller, url) {},
        onLoadStop: (controller, url) {},
        onProgressChanged: (controller, progress) {},
      ),
    )
        : Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 80, color: Colors.grey),
            const SizedBox(height: 20),
            Text(
              localizations?.no_internet ?? 'No Wifi or Cellular Data',
              style: const TextStyle(
                fontFamily: 'Eczar',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              localizations?.playlist ??
                  'Unable to load playlist.\nPlease check your connection and try again.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Eczar',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 15),
              ),
              child: Text(
                localizations?.settings ?? 'Settings',
                style: const TextStyle(fontFamily: 'Eczar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
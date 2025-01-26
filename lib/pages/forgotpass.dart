import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iksha/internet_service.dart';
import 'package:provider/provider.dart';
import 'package:open_settings_plus/open_settings_plus.dart';
import '../colours.dart';
import 'register.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isConnectedToInternet =
        Provider.of<InternetConnectionService>(context).isConnectedToInternet;
    Scaffold getWarning(String locale, Scaffold engWarn, Scaffold hindWarn) {
      return locale == 'hi' ? hindWarn : engWarn;
    }
    final currentLocale = Localizations.localeOf(context).languageCode;
    Scaffold warningInternet = getWarning(
        currentLocale,
        Scaffold(
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
        ),
        Scaffold(
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
        ));
    return isConnectedToInternet ? Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              margin: const EdgeInsets.only(top: 200, bottom: 20),
              decoration: BoxDecoration(
                  color: const Color(0xFFFFF9F2),
                  borderRadius: BorderRadius.circular(25.0)),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      localizations?.for_pass_title ??
                          'Enter your registered email address. \nWe will send you a password reset link.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: 'Eczar', fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(fontFamily: "Eczar"),
                        decoration: InputDecoration(
                            hintText:
                                localizations?.email ?? 'Enter your email',
                            hintStyle: const TextStyle(fontFamily: "Eczar")),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return localizations?.pls_email ?? 'Please enter your email';
                          } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                            return localizations?.vld_email ?? 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        resetPassword();
                      }
                    },
                    child: Text(
                      localizations?.send ?? 'Send',
                      style: TextStyle(color: iconcolor, fontFamily: "Eczar"),
                    ),
                  ),
          ],
        ),
      ),
    ):warningInternet;
  }

  void resetPassword() async {
    try {
      final localizations = AppLocalizations.of(context);
      final email = emailController.text.trim();
      final userSnapshot = await firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (userSnapshot.docs.isEmpty) {
        SnackBar(
          content: Text(
            localizations?.email_nexists ?? "Email does not exist",
            style: const TextStyle(fontFamily: "Eczar"),
          ),
        );
        throw FirebaseAuthException(
            message: 'Email does not exist', code: 'email-not-found');
      }

      await auth.sendPasswordResetEmail(email: email);

      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email sent!')),
      );

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Register(),
          transitionDuration: const Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'An error occurred')),
      );
    }
  }
}
